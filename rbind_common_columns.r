predict=read.csv("normal-predicted-36pt-9355gene.csv", header=T)
measured=read.csv("normal-measured_36pt_2050gene.csv", header=T)


common_cols <- intersect(colnames(predict), colnames(measured))
totalTable=rbind(subset(predict, select = common_cols), subset(measured, select = common_cols))
