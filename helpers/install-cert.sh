#!/bin/bash

set -eo pipefail
unset CDPATH
IFS=$'\n\t'



function copy_cert {

    cert_file=$1

    if "$on_mac"; then

        echo "Assuming running Docker for Mac. Adding certificate to keychain."
        sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$cert_file"
        echo
        echo "Certificate added - restart Docker for Mac to take effect"

    else

        echo "Adding certificate to local machine."
        mkdir -p "/etc/docker/certs.d/${registry_host}"
        cp "$cert_file" "/etc/docker/certs.d/${registry_host}/ca.crt"
        echo "Certificate added"

    fi
}


function install_cert {
    tmp_file=$(mktemp /tmp/cert.XXXXXX)

    if [[ $(id -u) -ne 0 ]]; then

        echo "Installing a certificate requires root privileges. Try:"
        echo "$ sudo $0 $args"
        exit 1

    fi

    command -v openssl >/dev/null 2>&1 || {
        echo >&2 "Install openssl to get certificates from URL"
        exit 1
    }
    echo "Retrieving certificate from $hostname"
    echo "quit" | openssl s_client -showcerts  -servername "$hostname" -connect "$hostname":443 > "$tmp_file"

  echo "Installing certificate"
  copy_cert "$tmp_file"

  return $?
}



on_mac=false

if [[ "$(uname -s)" = "Darwin" ]]; then
    on_mac=true
fi



#change to directory with script so we can reach deps
#https://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$src_dir"

#process args

args=$@
require_confirm=true
file_path=


usage=$(cat <<EOF
Tool for installing a self-signed certificate.
EOF
)


commands=$(cat <<EOF
Commands:
  --server        install CA certificate fetched via openssl from server
  --cert_file     install CA certificate from a file
EOF
)

function print_help {
  echo "$usage"
  echo
  echo "$commands"
}


if [[ $# -gt 0 ]]; then
    case $1 in
      --server)
          hostname="$2"

          if [[ -z "$hostname" ]]; then
              echo "No hostname provided"
              exit 1
          fi
          shift
          ;;
      --cert-file)
        file_path="$2"

        if [[ -z "$file_path" ]]; then
          echo "No certificate file provided"
          exit 1
        fi

        shift
        ;;

        -h|--help)
            print_help
            exit 0
            ;;
        *)
            print_help
            exit 1
            ;;
    esac
    shift
fi

install_cert
if [[ $? -eq 0 ]]; then
    echo
    echo "Congratulations. You can now log into your Mayhem Docker repository with: "
    echo "$ docker login -u <USERNAME> -p <API_TOKEN> <MAYHEM_HOST>:5000"
fi

exit $?
