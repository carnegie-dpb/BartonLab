##
## calculate the DE results for the non-time course limma data
##

library(affy)
library(limma)

res.GRREV.WT      = topTable(fit2.limma, adjust.method="BH", number=22810, coef="GRREVvWT")
res.KAN1GR.WT     = topTable(fit2.limma, adjust.method="BH", number=22810, coef="KAN1GRvWT")








