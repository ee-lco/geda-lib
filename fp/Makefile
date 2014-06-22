
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

FOOTPRINTS := $(patsubst $(SRCDIR)%,$(CURDIR)/%,$(shell find $(SRCDIR) -name '*.fp'))

.PHONY: all
all: $(FOOTPRINTS)

define COPY

$(CURDIR)/$(1): $(SRCDIR)$(1)
	@mkdir -p $$(dir $$@)
	cp $$< $$@

endef

$(foreach fp,$(FOOTPRINTS),$(eval $(call COPY,$(patsubst $(CURDIR)/%,%,$(fp)))))

