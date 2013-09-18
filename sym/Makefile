
.DEFAULT_GOAL := all

SRCDIR=./
LIBDIR=./

ifneq ($(SRCDIR),$(LIBDIR))
$(LIBDIR)%.sym: $(SRCDIR)%.sym
	@mkdir -p $(@D)
	cp $< $@

SYMBOLS+=$(subst $(SRCDIR),$(LIBDIR),$(wildcard $(SRCDIR)*.sym))
endif

define TT_recipe
SYMBOLS+=$(LIBDIR)$(2).sym
$(LIBDIR)$(2).sym: $(SRCDIR)$(1).tt
	@mkdir -p $$(@D)
	tpage $(foreach var,$(3),--define $(var) ) $$< > $$@
endef

include $(wildcard $(SRCDIR)*.mk)

.PHONY: all
all: $(SYMBOLS)

