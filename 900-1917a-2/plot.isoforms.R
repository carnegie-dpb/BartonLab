plot.isoforms = function(transcripts) {

    t = c(0,0,0, 30,30,30, 60,60,60)

    tlines = c(0, 30, 60)

    for (i in 1:length(transcripts)) {
        
        fpkm.norm = c(
            isoforms[transcripts[i],]$FPKM.00.1,
            isoforms[transcripts[i],]$FPKM.00.2,
            isoforms[transcripts[i],]$FPKM.00.3,
            isoforms[transcripts[i],]$FPKM.30.1,
            isoforms[transcripts[i],]$FPKM.30.2,
            isoforms[transcripts[i],]$FPKM.30.3,
            isoforms[transcripts[i],]$FPKM.60.1,
            isoforms[transcripts[i],]$FPKM.60.2,
            isoforms[transcripts[i],]$FPKM.60.3
        ) / read.groups.info$internal_scale

        if (i==1) {
            plot(t, fpkm.norm, col=1,
                 ylim=c(0,1e2), xaxp=c(0,60,2), ylab="expression (normalized FPKM)", xlab="t (min)", main=paste("GRTN:",paste(transcripts,collapse=" ")))
        } else {
            points(t, fpkm.norm, col=i)
        }

        lines(tlines, c(mean(fpkm.norm[1:3]),mean(fpkm.norm[4:6]),mean(fpkm.norm[7:9])), col=i)

    }

    legend(60, 0.1, transcripts, pch=1, col=1:length(transcripts), xjust=1, yjust=0)
    
}
