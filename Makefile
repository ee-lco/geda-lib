
.DEFAULT_GOAL := all

SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH  := $(SRCDIR)

.PHONY: all
all: $(CURDIR)/dev $(CURDIR)/fp $(CURDIR)/sym

define submake_recipe
.PHONY: $(CURDIR)/$(1)
$(CURDIR)/$(1): $(1)/Makefile
	@mkdir -p $$@
	make -C $$@ -f ../$$< $(MAKECMDGOALS)

endef

$(foreach tgt,dev fp sym,$(eval $(call submake_recipe,$(tgt))))

