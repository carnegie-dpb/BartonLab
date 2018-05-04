##
## run the routines to calculate the rma object
##

library(affy)
library(arrayQualityMetrics)
library(limma)

abatch = ReadAffy()
pdf(file="abatch.pdf", width=10, height=8)
boxplot(abatch)
hist(abatch)
dev.off()
arrayQualityMetrics(abatch, outdir="quality.abatch", reporttitle="Raw AffyBatch Quality Report", force=T)

rma = rma(abatch)
pdf(file="rma.pdf", width=10, height=8)
boxplot(rma)
hist(rma)
dev.off()
arrayQualityMetrics(rma, outdir="quality.rma", reporttitle="RMA-normalized ExpressionSet Quality Report", force=T)

