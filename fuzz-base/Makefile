NAME=$(shell basename `pwd`)

ALTDOCKERS := $(wildcard Dockerfile-*)
TAG =
.PHONY:  check-env

all: build $(ALTDOCKERS)

build: check-env
	docker build -t $(DOCKUSER)/$(NAME) .
	docker push $(DOCKUSER)/$(NAME)

$(ALTDOCKERS): check-env
	docker build -t $(DOCKUSER)/$(NAME):$(subst Dockerfile-,,$@) -f $@ .
	docker push $(DOCKUSER)/$(NAME):$(subst Dockerfile-,,$@)

check-env:
ifndef DOCKUSER
	$(error DOCKUSER is undefined; needed for docker push)
endif
