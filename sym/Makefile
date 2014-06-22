
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

SYMBOLS := $(patsubst $(SRCDIR)%,$(CURDIR)/%,$(shell find $(SRCDIR) -name '*.sym'))

.PHONY: all
all: $(SYMBOLS) gen

define COPY

$(CURDIR)/$(1): $(SRCDIR)$(1)
	@mkdir -p $$(dir $$@)
	cp $$< $$@

endef

$(foreach sym,$(SYMBOLS),$(eval $(call COPY,$(patsubst $(CURDIR)/%,%,$(sym)))))

.PHONY: gen
gen:

define TT_recipe
gen: $(2).sym

$(2).sym: $(1).tt
	@mkdir -p $$(dir $$@)
	tpage $(foreach var,$(3),--define $(var) ) $$< > $$@

endef

include $(shell find $(SRCDIR) -name '*.mk')

