##
## dump out all the res tables
##

write.table(sep="\t", quote=F, file="res.STM8.WT8.tsv", res.STM8.WT8)
write.table(sep="\t", quote=F, file="res.STM24.WT24.tsv", res.STM24.WT24)
write.table(sep="\t", quote=F, file="res.STM72.WT72.tsv", res.STM72.WT72)
write.table(sep="\t", quote=F, file="res.STM216.WT216.tsv", res.STM216.WT216)

write.table(sep="\t", quote=F, file="res.KD72.WT72.tsv", res.KD72.WT72)
write.table(sep="\t", quote=F, file="res.KD216.WT216.tsv", res.KD216.WT216)

write.table(sep="\t", quote=F, file="res.STM72.KD72.tsv", res.STM72.KD72)
write.table(sep="\t", quote=F, file="res.STM216.KD216.tsv", res.STM216.KD216)
