##
## dump out all the res time-wise  tables
##

write.table(sep="\t", quote=F, file="res.GRREV30.tsv", res.GRREV30)
write.table(sep="\t", quote=F, file="res.GRREV60.tsv", res.GRREV60)
write.table(sep="\t", quote=F, file="res.GRREV120.tsv",res.GRREV120)

write.table(sep="\t", quote=F, file="res.WT30.tsv", res.WT30)
write.table(sep="\t", quote=F, file="res.WT60.tsv", res.WT60)
write.table(sep="\t", quote=F, file="res.WT120.tsv", res.WT120)

write.table(sep="\t", quote=F, file="res.KAN1GR30.tsv", res.KAN1GR30)
write.table(sep="\t", quote=F, file="res.KAN1GR60.tsv", res.KAN1GR60)


