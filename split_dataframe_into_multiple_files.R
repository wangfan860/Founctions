a= read.delim("BRCA.mirnaseq_illuminahiseq_miR_isoform.quantification.txt",header = TRUE, sep = "\t")
spt1 <- split(a, a$SampleId) 
lapply(names(spt1), function(x){write.csv(spt1[[x]], file = paste(x,sep = ""),row.names=FALSE)})
