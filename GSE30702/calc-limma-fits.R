##
## calculate the fits for limma (non-time-course) design
##

library(affy)
library(limma)

design.limma = read.table(file="design-limma.tsv", header=T)
fit.limma = lmFit(rma, design.limma)
fit2.limma = eBayes(fit.limma)

pdf(file="fit.limma.pdf", width=10, height=8)
volcanoplot(fit2.limma, coef="GRREVvWT", highlight=15, main="GRREVvWT")
volcanoplot(fit2.limma, coef="KAN1GRvWT", highlight=15, main="KAN1GRvWT")
dev.off()
