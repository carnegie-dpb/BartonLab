##
## calculate the DE results for the time course limma data
##

library(affy)
library(limma)

res.WT30     = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="WT30")
res.WT60     = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="WT60")
res.WT120    = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="WT120")

res.GRREV30  = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="GRREV30")
res.GRREV60  = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="GRREV60")
res.GRREV120 = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="GRREV120")

res.KAN1GR30 = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="KAN1GR30")
res.KAN1GR60 = topTable(fit2.limmatime, adjust.method="BH", number=22810, coef="KAN1GR60")










