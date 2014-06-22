
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

DEVMAPS := $(patsubst $(SRCDIR)%.dev,$(CURDIR)/%,$(shell find $(SRCDIR) -name '*.dev'))

.PHONY: all
all: $(DEVMAPS) gen

define COPY

$(CURDIR)/$(1): $(SRCDIR)$(1).dev
	@mkdir -p $$(dir $$@)
	cp $$< $$@

endef

$(foreach dev,$(DEVMAPS),$(eval $(call COPY,$(patsubst $(CURDIR)/%,%,$(dev)))))

.PHONY: gen
gen: $(patsubst $(SRCDIR)%,.done/%.done,$(shell find $(SRCDIR) -name '*.pl'))

.done/%.pl.done: %.pl
	@mkdir -p $(dir $@)
	@mkdir -p $(patsubst .done/%,%,$(dir $@))
	perl $<
	@touch $@

