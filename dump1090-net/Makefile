NAME=$(shell basename `pwd`)

ALTDOCKERS := $(wildcard Dockerfile-*)
TAG =
.PHONY:  check-env

all: build $(ALTDOCKERS)

build: check-env
	true


$(ALTDOCKERS): check-env
	true

check-env:
ifndef DOCKUSER
	$(error DOCKUSER is undefined; needed for docker push)
endif
