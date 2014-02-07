
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

.PHONY: all
all: copy

.PHONY: copy
copy: $(patsubst $(SRCDIR)%,$(CURDIR)/%,$(shell find $(SRCDIR) -name '*.fp'))

$(CURDIR)/%.fp: %.fp
	@mkdir -p $(dir $@)
	cp $< $@

