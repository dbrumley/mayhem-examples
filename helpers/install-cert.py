#!/usr/bin/python
import ssl
import sys
import socket
import os
import errno

if len(sys.argv) != 2:
  print("Must supply hostname")
  sys.exit(1)

if os.getuid() != 0:
  print("Must run as root. Try with sudo")
  sys.exit(1)

hostname=sys.argv[1]
context = ssl.create_default_context()
try:
  cert=ssl.get_server_certificate((hostname, 443))
except ssl.SSLError as err:
  print("Failed with SSL Error: %s"%str(err))
  exit(1)
except socket.gaierror as err:
  print("Failed to connect: %s"%str(err))
  exit(1)


try:
  os.makedirs(os.path.join("/etc/docker/certs.d/",hostname ), 0o755)
except OSError as e:
  if e.errno == errno.EEXIST:
    pass
  else:
    raise

with open(os.path.join("/etc/docker/certs.d/", hostname + "/ca.crt"), "w") as f:
  f.write(cert)
  f.close()
