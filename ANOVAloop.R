a=read.csv("SUBTYPE_expression.csv")
sink("AnovaTest.csv")
for(i in 3:137){
  columns <- names(a[i])
  anovaresult<- anova(aov(a[,i]~subtype,data=a)) 
  posthocresult <- TukeyHSD(aov(a[,i]~subtype,data=a))
  
  print(columns)
  print(anovaresult)
  print(posthocresult)
}
sink()        ###print all results including significant and non-significant###




sink("significantAnovaTest.csv")
for(i in 3:137){
  columns <- names(a[i])
  anovaresult<- anova(aov(a[,i]~subtype,data=a)) 
  if(anovaresult$Pr[1] < 0.05){ print(anovaresult) }
  posthocresult <- TukeyHSD(aov(a[,i]~subtype,data=a))
  
  print(columns)

  print(posthocresult)
}
sink()  ###print significant results including ###
