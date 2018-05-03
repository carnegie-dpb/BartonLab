##
## calculate the DE results for the various designs
##

library(affy)
library(limma)

res.STM8.WT8       = topTable(fit2.WT, adjust.method="BH", number=22810, coef="STM8vWT8")
res.STM24.WT24     = topTable(fit2.WT, adjust.method="BH", number=22810, coef="STM24vWT24")
res.STM72.WT72     = topTable(fit2.WT, adjust.method="BH", number=22810, coef="STM72vWT72")
res.STM216.WT216   = topTable(fit2.WT, adjust.method="BH", number=22810, coef="STM216vWT216")

res.KD72.WT72   = topTable(fit2.WT, adjust.method="BH", number=22810, coef="KD72vWT72")
res.KD216.WT216 = topTable(fit2.WT, adjust.method="BH", number=22810, coef="KD216vWT216")

res.STM72.KD72   = topTable(fit2.KD, adjust.method="BH", number=22810, coef="STM72vKD72")
res.STM216.KD216 = topTable(fit2.KD, adjust.method="BH", number=22810, coef="STM216vKD216")







