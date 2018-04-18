##
## load the cuffdiff output into a data frame
##

read.groups.info = read.table(file="cuffdiff/GTN.0.30.60/read_groups.info", header=TRUE, sep="\t", fill=TRUE, quote="")

cuffdiff = read.table(file="cuffdiff/GTN.0.30.60/isoform_exp.diff", header=TRUE, sep="\t", fill=TRUE, quote="")

