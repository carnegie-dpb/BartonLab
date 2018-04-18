## load cuffdiff gene data
## 
## test_id gene_id gene    locus   sample_1        sample_2        status  value_1 value_2 log2(fold_change)       test_stat       p_value q_value significant
##

cuffdiff = read.table("gene_exp.diff", header=TRUE, sep="\t")

cuffdiff$logFC = cuffdiff$log2.fold_change.
cuffdiff$log2.fold_change. = NULL

## include only genes
cuffdiff = cuffdiff[substring(cuffdiff$gene_id,1,2)=='OS',]

## "OSH1-0 OSH1-3"  "OSH1-0 OSH1-6"  "OSH1-0 OSH1-24"
## "OSH1-3 OSH1-6"  "OSH1-3 OSH1-24"
## "OSH1-6 OSH1-24"
## 
## "WT-0 WT-3" "WT-0 WT-6" "WT-0 WT-24"
## "WT-3 WT-6" "WT-3 WT-24"
## "WT-6 WT-24"
##
## "OSH1-0 WT-0"    "OSH1-0 WT-3"    "OSH1-0 WT-6"    "OSH1-0 WT-24"
## "OSH1-3 WT-0"    "OSH1-3 WT-3"    "OSH1-3 WT-6"    "OSH1-3 WT-24"   
## "OSH1-6 WT-0"    "OSH1-6 WT-3"    "OSH1-6 WT-6"    "OSH1-6 WT-24"   
## "OSH1-24 WT-0"   "OSH1-24 WT-3"   "OSH1-24 WT-6"   "OSH1-24 WT-24"  

cuffdiff.0 = cuffdiff[cuffdiff$sample_2=="OSH1-0" & cuffdiff$sample_1=="WT-0" & cuffdiff$status=="OK", ]
cuffdiff.3 = cuffdiff[cuffdiff$sample_2=="OSH1-3" & cuffdiff$sample_1=="WT-3" & cuffdiff$status=="OK", ]
cuffdiff.6 = cuffdiff[cuffdiff$sample_2=="OSH1-6" & cuffdiff$sample_1=="WT-6" & cuffdiff$status=="OK", ]
cuffdiff.24 = cuffdiff[cuffdiff$sample_2=="OSH1-24" & cuffdiff$sample_1=="WT-24" & cuffdiff$status=="OK", ]



