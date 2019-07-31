NAME=$(shell basename `pwd`)

ALTDOCKERS := $(wildcard Dockerfile-*)
TAG =
.PHONY:  check-env

all: build $(ALTDOCKERS)

build: check-env
	docker build -t $(DOCKERID)/$(NAME) .
	docker push $(DOCKERID)/$(NAME)

$(ALTDOCKERS): check-env
	docker build -t $(DOCKERID)/$(NAME):$(subst Dockerfile-,,$@) -f $@ .
	docker push $(DOCKERID)/$(NAME):$(subst Dockerfile-,,$@)

check-env:
ifndef DOCKERID
	$(error DOCKERID is undefined; needed for docker push)
endif
