boxplot(split(a$Paclitaxel,a$subtype),main="Paclitaxel",ylab="Predicted Sensitivity",col="green")
fita <- lm(Paclitaxel~subtype, data=a)
anova(fita)
