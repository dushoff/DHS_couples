# DHS_couples
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: clmmPlot.Rout 

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

Sources += $(wildcard *.R)

## Content

ltc.Rout: $(Drop)/DHS_couples/dc.RData ltc.R

diffModel.Rout: ltc.Rout diffModel.R

clmModel.Rout: ltc.Rout clmModel.R

clmmPlot.Rout: ordfuns.Rout plotFuns.Rout clmModel.Rout clmmPlot.R
	$(run-R)

diffModel.plot.Rout: diffModel.Rout newpred.Rout modelPlot.R
	$(run-R)

diffModel.effects.Rout: diffModel.Rout newpred.Rout modelPlot.R
	$(run-R)



######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
