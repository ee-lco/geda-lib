
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

all: copy gen

gen: $(patsubst %,.done/%.done,$(patsubst $(SRCDIR)%,%,$(shell find $(SRCDIR) -name '*.pl')))

.done/%.pl.done: %.pl
	@mkdir -p $(dir $@)
	@mkdir -p $(patsubst .done/%,%,$(dir $@))
	perl $<
	@touch $@

copy: $(patsubst %.dev,%,$(patsubst $(SRCDIR)%,%,$(shell find $(SRCDIR) -name '*.dev')))

%: %.dev
	@mkdir -p $(dir $@)
	cp $< $@

