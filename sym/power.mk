$(foreach variant,1 2,$(foreach polarity,plus minus,$(foreach voltage,1.2 1.5 1.8 2 2.5 3 3.3 5 6 9 10 12 15 18 24,$(eval $(call TT_recipe,power-$(variant),$(voltage)V-$(polarity)-$(variant),voltage=$(if $(filter $(polarity),plus),+,-)$(voltage)V)))))

