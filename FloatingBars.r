d = data.frame(x  = c(1:116), y  = runif(116, min=0, max=100), z=runif(116, min=0, max=134),a=runif(116, min=0, max=60))

df  = transform(d, mean=rowMeans(d), sd=apply(d,1, sd))
x=df[1]
mean=df[5]
sd=df[6]
qplot(x,mean)+geom_errorbar(aes(x=x, ymin=mean-sd, ymax=mean+sd), width=0.25)
