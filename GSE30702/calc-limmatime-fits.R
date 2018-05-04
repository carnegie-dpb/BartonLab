##
## calculate the fits for time-wise limma designs
##

library(affy)
library(limma)

design.limmatime = read.table(file="design-limmatime.tsv", header=T)
fit.limmatime = lmFit(rma, design.limmatime)
fit2.limmatime = eBayes(fit.limmatime)

pdf(file="fit.limmatime.pdf", width=10, height=8)
volcanoplot(fit2.limmatime, coef="WT30", highlight=15, main="WT30")
volcanoplot(fit2.limmatime, coef="WT60", highlight=15, main="WT60")
volcanoplot(fit2.limmatime, coef="WT120", highlight=15, main="WT120")
volcanoplot(fit2.limmatime, coef="GRREV30", highlight=15, main="GRREV30")
volcanoplot(fit2.limmatime, coef="GRREV60", highlight=15, main="GRREV60")
volcanoplot(fit2.limmatime, coef="GRREV120", highlight=15, main="GRREV120")
volcanoplot(fit2.limmatime, coef="KAN1GR30", highlight=15, main="KAN1GR30")
volcanoplot(fit2.limmatime, coef="KAN1GR60", highlight=15, main="KAN1GR60")
dev.off()


