##
## make some volcano plots of the equal-time DE
##

## t=0
plot(cuffdiff.0$logFC, -log10(cuffdiff.0$p_value), cex=0.5, main="OSH1-GR v WT at t=0", xlim=c(-10,10))
lines(c(-10,10),c(3.60,3.60), col="red")
text(-9, 3.60, "q=0.01", col="red", pos=3)
lines(c(-10,10),c(2.72,2.72), col="blue")
text(-9, 2.72, "q=0.05", col="blue", pos=3)
goodpoints = cuffdiff.0$q_value<0.01
text(cuffdiff.0$logFC[goodpoints], -log10(cuffdiff.0$p_value[goodpoints]), cuffdiff.0$gene_id[goodpoints], cex=0.5, pos=3, offset=0.2, col="red")

## t=3
plot(cuffdiff.3$logFC, -log10(cuffdiff.3$p_value), cex=0.5, main="OSH1-GR v WT at t=3h", xlim=c(-10,10))
lines(c(-10,10),c(3.60,3.60), col="red")
text(-9, 3.60, "q=0.01", col="red", pos=3)
lines(c(-10,10),c(2.72,2.72), col="blue")
text(-9, 2.72, "q=0.05", col="blue", pos=3)
goodpoints = cuffdiff.3$q_value<0.01
text(cuffdiff.3$logFC[goodpoints], -log10(cuffdiff.3$p_value[goodpoints]), cuffdiff.3$gene_id[goodpoints], cex=0.5, pos=3, offset=0.2, col="red")

## t=6
plot(cuffdiff.6$logFC, -log10(cuffdiff.6$p_value), cex=0.5, main="OSH1-GR v WT at t=6h", xlim=c(-10,10))
lines(c(-10,10),c(3.60,3.60), col="red")
text(-9, 3.60, "q=0.01", col="red", pos=3)
lines(c(-10,10),c(2.72,2.72), col="blue")
text(-9, 2.72, "q=0.05", col="blue", pos=3)
goodpoints = cuffdiff.6$q_value<0.01
text(cuffdiff.6$logFC[goodpoints], -log10(cuffdiff.6$p_value[goodpoints]), cuffdiff.6$gene_id[goodpoints], cex=0.5, pos=3, offset=0.2, col="red")

## t=24
plot(cuffdiff.24$logFC, -log10(cuffdiff.24$p_value), cex=0.5, main="OSH1-GR v WT at t=24h", xlim=c(-10,10))
lines(c(-10,10),c(3.60,3.60), col="red")
text(-9, 3.60, "q=0.01", col="red", pos=3)
lines(c(-10,10),c(2.72,2.72), col="blue")
text(-9, 2.72, "q=0.05", col="blue", pos=3)
goodpoints = cuffdiff.24$q_value<0.01
text(cuffdiff.24$logFC[goodpoints], -log10(cuffdiff.24$p_value[goodpoints]), cuffdiff.24$gene_id[goodpoints], cex=0.5, pos=3, offset=0.2, col="red")
