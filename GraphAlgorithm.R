trial<-matrix(c(xap1,xec,x2,x3),ncol=4)
colnames(trial)<-c('APRIORI','ECLAT','SVM','BAYES')
rownames(trial)<-'TIME'
trial.table <- as.table(trial)


barplot(trial.table, main="Comparison", ylab="TIME in seconds",xlab="Algorithms")



trialmem<-matrix(c(sizeap,sizeec,sizesv,sizeny),ncol=4)
colnames(trialmem)<-c('APRIORI','ECLAT','SVM','BAYES')
rownames(trialmem)<-'MEMORY'
trialmem.table <- as.table(trialmem)


barplot(trialmem.table, main="Comparison", ylab="MEMORY in  Bytes",xlab="Algorithms")




trialapruleparameter<-matrix(c(lift4,conf4,lap4,cap4,finallengthap4),ncol=5)
colnames(trialapruleparameter)<-c('Lift>=1','Confidence=1','Laplace>=0','Conviction=1','Minsupp>0.1&Conf>20')
rownames(trialapruleparameter)<-'No of Rules'
trialapruleparameter.table<-as.table(trialapruleparameter)



barplot(trialapruleparameter.table, main="Comparison for Apriori", ylab="No of Rules ",xlab="Parameters")