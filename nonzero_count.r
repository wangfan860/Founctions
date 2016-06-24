TotalTable= read.csv("324pt-787mature_hiseq_miR_annotation.csv")
a = colSums(TotalTable[2:788]!=0)
b = a/324 ##Getting the percentage of rows that are nonzero for each
c = which(b<0.9) 
TotalTable2 = TotalTable1[,-c]
write.csv(TotalTable2,"324pt-274mature_hiseq_miR.csv")
