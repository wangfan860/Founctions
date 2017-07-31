library(ggfortify)

gene=read.csv("574combined-OV__unc.edu__agilentg4502a_07_3__gene.quantification__Apr-07-2016.csv")
test1=t(gene)
expression <- data.frame(test1)

stage=read.csv("stage.csv")
rownames(stage)=stage[,1]

stageTable=merge(stage, expression, by="row.names")
df <- stageTable[4:17817]
dff=as.matrix(sapply(df, as.numeric))  
autoplot(prcomp(dff), data = stageTable, colour = 'clinical_stage')
