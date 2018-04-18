##
## load the cufflinks output into a big data frame; add TPM values
##

labels = c("OtB5765","OtB5766","OtB5767",
           "OtB5768","OtB5769","OtB5770",
           "OtB5771","OtB5772","OtB5773"
           )

samples = c("GTN1.1","GTN1.2","GTN1.4",
            "GTN30.1","GTN30.4","GTN30.5",
            "GTN60.2","GTN60.4","GTN60.5")

## load the per-sample data frames; genes have non-unique tracking_id like CUFF.1

isoforms.00.1 = read.table(file=paste("cufflinks/",labels[1],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.00.2 = read.table(file=paste("cufflinks/",labels[2],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.00.3 = read.table(file=paste("cufflinks/",labels[3],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.30.1 = read.table(file=paste("cufflinks/",labels[4],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.30.2 = read.table(file=paste("cufflinks/",labels[5],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.30.3 = read.table(file=paste("cufflinks/",labels[6],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.60.1 = read.table(file=paste("cufflinks/",labels[7],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.60.2 = read.table(file=paste("cufflinks/",labels[8],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")
isoforms.60.3 = read.table(file=paste("cufflinks/",labels[9],"/isoforms.fpkm_tracking",sep=""), header=TRUE, row.names="tracking_id", quote="", sep="\t")


## remove blank columns

isoforms.00.1$class_code = NULL
isoforms.00.1$nearest_ref_id = NULL
isoforms.00.1$gene_short_name = NULL
isoforms.00.1$tss_id = NULL

isoforms.00.2$class_code = NULL
isoforms.00.2$nearest_ref_id = NULL
isoforms.00.2$gene_short_name = NULL
isoforms.00.2$tss_id = NULL

isoforms.00.3$class_code = NULL
isoforms.00.3$nearest_ref_id = NULL
isoforms.00.3$gene_short_name = NULL
isoforms.00.3$tss_id = NULL

isoforms.30.1$class_code = NULL
isoforms.30.1$nearest_ref_id = NULL
isoforms.30.1$gene_short_name = NULL
isoforms.30.1$tss_id = NULL

isoforms.30.2$class_code = NULL
isoforms.30.2$nearest_ref_id = NULL
isoforms.30.2$gene_short_name = NULL
isoforms.30.2$tss_id = NULL

isoforms.30.3$class_code = NULL
isoforms.30.3$nearest_ref_id = NULL
isoforms.30.3$gene_short_name = NULL
isoforms.30.3$tss_id = NULL

isoforms.60.1$class_code = NULL
isoforms.60.1$nearest_ref_id = NULL
isoforms.60.1$gene_short_name = NULL
isoforms.60.1$tss_id = NULL

isoforms.60.2$class_code = NULL
isoforms.60.2$nearest_ref_id = NULL
isoforms.60.2$gene_short_name = NULL
isoforms.60.2$tss_id = NULL

isoforms.60.3$class_code = NULL
isoforms.60.3$nearest_ref_id = NULL
isoforms.60.3$gene_short_name = NULL
isoforms.60.3$tss_id = NULL

## merge into single isoforms dataframe

isoforms = isoforms.00.1

isoforms = merge(isoforms, isoforms.00.2, by=0, suffixes=c(".00.1",""), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

isoforms = merge(isoforms, isoforms.00.3, by=0, suffixes=c(".00.2",""), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

isoforms = merge(isoforms, isoforms.30.1, by=0, suffixes=c(".00.3",""), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

isoforms = merge(isoforms, isoforms.30.2, by=0, suffixes=c(".30.1",""), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

isoforms = merge(isoforms, isoforms.30.3, by=0, suffixes=c(".30.2",""), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

isoforms = merge(isoforms, isoforms.60.1, by=0, suffixes=c(".30.3",""), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

isoforms = merge(isoforms, isoforms.60.2, by=0, suffixes=c(".60.1",""), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

isoforms = merge(isoforms, isoforms.60.3, by=0, suffixes=c(".60.2",".60.3"), sort=TRUE)
rownames(isoforms) = isoforms$Row.names
isoforms$Row.names = NULL

## add TPM column - do it now since we lost some loci in the merge

isoforms$TPM.00.1 = isoforms$FPKM.00.1/sum(isoforms$FPKM.00.1)*1e6
isoforms$TPM.00.2 = isoforms$FPKM.00.2/sum(isoforms$FPKM.00.2)*1e6
isoforms$TPM.00.3 = isoforms$FPKM.00.3/sum(isoforms$FPKM.00.3)*1e6
isoforms$TPM.30.1 = isoforms$FPKM.30.1/sum(isoforms$FPKM.30.1)*1e6
isoforms$TPM.30.2 = isoforms$FPKM.30.2/sum(isoforms$FPKM.30.2)*1e6
isoforms$TPM.30.3 = isoforms$FPKM.30.3/sum(isoforms$FPKM.30.3)*1e6
isoforms$TPM.60.1 = isoforms$FPKM.60.1/sum(isoforms$FPKM.60.1)*1e6
isoforms$TPM.60.2 = isoforms$FPKM.60.2/sum(isoforms$FPKM.60.2)*1e6
isoforms$TPM.60.3 = isoforms$FPKM.60.3/sum(isoforms$FPKM.60.3)*1e6

