a=read.table("849BRCA.mirnaseq__illuminahiseq_miR_isoform.quantification.txt", sep="\t",header=T)
b=data.frame(a[,7])
c=b[!duplicated(b), ]
write.csv(c,"849-unique_miR.csv)
