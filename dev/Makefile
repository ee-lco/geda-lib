
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

.PHONY: all
all: copy gen

.PHONY: copy
copy: $(patsubst $(SRCDIR)%.dev,$(CURDIR)/%,$(shell find $(SRCDIR) -name '*.dev'))

$(CURDIR)/%: %.dev
	@mkdir -p $(dir $@)
	cp $< $@

.PHONY: gen
gen: $(patsubst $(SRCDIR)%,.done/%.done,$(shell find $(SRCDIR) -name '*.pl'))

.done/%.pl.done: %.pl
	@mkdir -p $(dir $@)
	@mkdir -p $(patsubst .done/%,%,$(dir $@))
	perl $<
	@touch $@

