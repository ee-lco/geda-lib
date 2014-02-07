
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

.PHONY: all
all: copy gen

.PHONY: copy
copy: $(patsubst $(SRCDIR)%,$(CURDIR)/%,$(shell find $(SRCDIR) -name '*.sym'))

$(CURDIR)/%.sym: %.sym
	@mkdir -p $(dir $@)
	cp $< $@

.PHONY: gen
gen:

define TT_recipe
gen: $(2).sym

$(2).sym: $(1).tt
	@mkdir -p $$(dir $$@)
	tpage $(foreach var,$(3),--define $(var) ) $$< > $$@

endef

include $(shell find $(SRCDIR) -name '*.mk')

