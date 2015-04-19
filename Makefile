
.DEFAULT_GOAL := all

TARGETS := dev fp sym

SRCDIR  ?= $(dir $(lastword $(MAKEFILE_LIST)))
VPATH   := $(SRCDIR)

.PHONY: all
all: $(foreach tgt,$(TARGETS),$(CURDIR)/$(tgt))

.PHONY: clean
clean:
	rm -rf $(foreach tgt,$(TARGETS),$(CURDIR)/$(tgt))

define submake_recipe
.PHONY: $(CURDIR)/$(1)
$(CURDIR)/$(1): $(1)/Makefile
	@mkdir -p $$@
	make -C $$@ -f $$(realpath $$<) $(MAKECMDGOALS)

endef

$(foreach tgt,$(TARGETS),$(eval $(call submake_recipe,$(tgt))))

