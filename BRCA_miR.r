miRHiSeq=read.csv("For R_3 miR_BRCA_miRNAseq_Illumina Hiseq.csv")
miRGA=read.csv("For R_3 miR_BRCA_miRNAseq_Illumina GA.csv")
geneRNAseqV1=read.csv("For R_BRCA_mRNAseq_RNAseq_777samples.csv")
geneRNAseqV2=read.csv("For_R_BRCA_mRNAseq_RNAseq_V2_1095samples.csv")
T_geneRNAseqV1=t(geneRNAseqV1)  ##transpose
T_geneRNAseqV2=t(geneRNAseqV2)
rownames(miRHiSeq)=miRHiSeq[,1]
rownames(miRGA)=miRGA[,1]
colnames(T_geneRNAseqV1)=T_geneRNAseqV1[1,]
colnames(T_geneRNAseqV2)=T_g11eneRNAseqV2[1,]
miRHiseq_RNAseqV1=merge(miRHiSeq, T_geneRNAseqV1, by="row.names")
miRHiseq_RNAseqV2=merge(miRHiSeq, T_geneRNAseqV2, by="row.names")
miRGA_RNAseqV1=merge(miRGA, T_geneRNAseqV1, by="row.names")
miRGA_RNAseqV2=merge(miRGA, T_geneRNAseqV2, by="row.names")
write.table(miRHiseq_RNAseqV1,"miRHiseq_RNAseqV1.txt")
write.csv(miRHiseq_RNAseqV2,"miRHiseq_RNAseqV2.csv")
write.csv(miRGA_RNAseqV1,"miRGA_RNAseqV1.csv")
write.csv(miRGA_RNAseqV2,"miRGA_RNAseqV2.csv")

##correlation


##multiple pair-wise LR
phenolist=names(miRHiseq_RNAseqV1)[3:5]
exprlist=names(miRHiseq_RNAseqV1)[6:17219]
results=data.frame()


for(cpheno in phenolist) {pheno = miRHiseq_RNAseqV1[,cpheno]
for(cexpr in exprlist) {expr = miRHiseq_RNAseqV1[,cexpr]
fit = lm(pheno ~ expr)
sumfit=summary(fit)   
results = rbind( results, data.frame(cexpr, cpheno, coef(sumfit) ) )                      
print(cpheno)
print(cexpr)                     
print(summary(fit))}}
write.csv(results,"correlation result_miRHiseq_RNAseqV1.csv")
