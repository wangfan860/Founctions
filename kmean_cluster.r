m <- data.frame(read.csv("expression285.csv"))
n=t(m)

n[1:5,1:5]
colnames(n) <- n[1,]
n[1:5,1:5]
q=n[2:286,]
q[1:5,1:5]
result=kmeans(q,6)
result$cluster
write.csv(result$cluster,"cluster2.csv")
