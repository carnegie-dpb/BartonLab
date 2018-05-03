##
## calculate the fits for the various designs
##

library(affy)
library(limma)

design.WT = read.table(file="design-WT.tsv", header=T)
fit.WT = lmFit(rma, design.WT)
fit2.WT = eBayes(fit.WT)

design.KD = read.table(file="design-KD.tsv", header=T)
fit.KD = lmFit(rma, design.KD)
fit2.KD = eBayes(fit.KD)


