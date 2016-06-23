a= read.delim("BRCA.mirnaseq_illuminahiseq_miR_isoform.quantification.txt",header = TRUE, sep = "\t")
spt1 <- split(a, a$SampleId) 
lapply(names(spt1), function(x){write.table(spt1[[x]], file = paste(x,"_isoform.quantification",sep = ""),row.names=FALSE,sep = "\t")})

##change all file into txt file
###in cmd window type cd C:\Users\fwang1\Desktop\BRCA_Survival\hiseq2             
##rename files ren * *.txt
