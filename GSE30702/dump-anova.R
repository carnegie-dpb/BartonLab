##
## Dump the ANOVA data to tab-delimited files.
##

write.table(file="anova.ALL.tsv", anova.ALL, sep="\t", quote=F)
write.table(file="anova.GRREV.WT.tsv", anova.GRREV.WT, sep="\t", quote=F)
write.table(file="anova.KAN1GR.WT.tsv", anova.KAN1GR.WT, sep="\t", quote=F)
