a=read.csv("100genes.csv")
rownames(a)=a[,1]

b=read.csv("520OV__broad.mit.edu__ht_hg-u133a__gene.quantification__Apr-07-2016.csv")
rownames(b)=b[,1]

TotalTable=merge(a, b, by="row.names")
write.csv(TotalTable,"100gene_expression.csv")
