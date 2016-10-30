> newtest1
    A   B  C  D
a1  1  46 26 26
a2 34 786 26 55
a3 46  58 75 77
a4  5  83 84 56
> newtest2
     A  B  C  D
a1   8 35 56 86
a2 568 34 86 34
a3 568 75 34 86
a4   8 34 24 25



results=list()
for (i in 1:ncol(newtest1)) {
  c.test=cor.test(newtest1[,i],newtest2[,i],method="pearson")
results <- rbind(results, data.frame(R = c.test$estimate, PValue = c.test$p.value, row.names = names(newtest1)[i]))
}
write.csv(results, "result.csv")
