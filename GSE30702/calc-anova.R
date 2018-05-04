##
## Calculate the ANOVA for ALL conditions and GRREVvWT and KAN1GRvWT
##
## Requires: samples.tsv, rma

source("anova.twoway.R")

expr = exprs(rma)
colnames(expr) = substring(colnames(expr),1,9)

samples = read.table(file="samples.tsv", header=T)
rownames(samples) = samples$label
samples$label = NULL

conditions.ALL = c("WT", "GRREV","KAN1GR")
anova.ALL = anova.twoway(expr=expr, samples=samples, conditions=conditions.ALL)

conditions.GRREV.WT = c("WT", "GRREV")
anova.GRREV.WT = anova.twoway(expr=expr, samples=samples, conditions=conditions.GRREV.WT)

conditions.KAN1GR.WT = c("WT", "KAN1GR")
anova.KAN1GR.WT = anova.twoway(expr=expr, samples=samples, conditions=conditions.KAN1GR.WT)
