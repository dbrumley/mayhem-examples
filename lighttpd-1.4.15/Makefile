NAME=lighttpd-1.4.15

DOCKERS := $(wildcard Dockerfile-*)

.PHONY:  check-env

all: $(DOCKERS)

$(DOCKERS): check-env
	docker build -t $(DOCKUSER)/$(NAME):$(subst Dockerfile-,,$@) -f $@ .
	docker push $(DOCKUSER)/$(NAME):$(subst Dockerfile-,,$@)

check-env:
ifndef DOCKUSER
	$(error DOCKUSER is undefined; needed for docker push)
endif
