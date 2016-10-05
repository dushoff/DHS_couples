
library(ordinal)
library(splines)
library(gridExtra)
library(ggplot2)
library(reshape)
theme_set(theme_bw())
attr(modAns,"terms") <- NULL 


## need all predictors ... this is hacky because ea and id are the second last and last column in modAns
predNames <- "ageDiff"

isoList <- lapply(predNames, function(n){
  ordpred(mod, n, modAns)
})

listPlot(isoList)


