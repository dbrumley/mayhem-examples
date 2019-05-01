DOCKUSER=dbrumley

SUBDIRS := $(wildcard */.)
all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ DOCKUSER=dbrumley

.PHONY: all $(SUBDIRS)

all: $(ENABLED)
