attach(HCdata)
hcdata=HCdata
index=rowMeans(hcdata[,c(30,31,32)])
hcdata=cbind(hcdata,index)
names(hcdata)

table(hcdata$Specialty)
table(hcdata$Group)
table(hcdata$Group,hcdata$Specialty)

?tapply

###  Check Descriptives
tapply(hcdata$index,hcdata$Specialty,summary)
tapply(hcdata$index,hcdata$Group,summary)

boxplot(hcdata$index~hcdata$Group, main="Loyalty Index by Group")
boxplot(hcdata$index~hcdata$Specialty, main="Loyalty Index by Specialty")

hcdata$Group=as.factor(hcdata$Group)
hcdata$Specialty=as.factor(hcdata$Specialty)

result2=aov(index ~ Group + Specialty + Group:Specialty, data=hcdata)
summary(result2)


library(ggplot2)