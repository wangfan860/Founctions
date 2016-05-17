library("fdrtool") # load "fdrtool" library and p-values
data(pvalues)
pval = read.table("pvaluemirmrna.txt",sep='\t', header=T, quote = "\"", stringsAsFactors = F)
pvalues= pval[,1]
fdr = fdrtool(pvalues, statistic="pvalue") # estimate fdr and Fdr from p-values
fdr$lfdr # estimated local fdr
write.csv(fdr$lfdr, file="FDR.csv")
