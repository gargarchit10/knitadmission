setwd('C:/Users/Jain/Desktop/R')
library(e1071)
dataset<-read.csv("list.csv")

train<-dataset[c(2:1500),c(1,5,7)]
train$Grade<-paste(train$Grade,train$Range,sep="")
train$Range<-NULL
test<-dataset[c(1501:3249),c(1,5,7)]
test$Grade<-paste(test$Grade,test$Range,sep="")
test$Range<-NULL
new2<-dataset[c(2:1500),1]

starttime3<-Sys.time()
nb_default<-naiveBayes(new2~., data=train)
default_pred<-predict(nb_default,test)
en3<-Sys.time()
x3<-en3-starttime3
x3
sizeny<-object.size(nb_default)
sizeny
table(default_pred,test[,2])

train1<-train[c(2:200),]
test1<-test[c(2:200),]
new2<-dataset[c(2:200),1]
starttimeny1<-Sys.time()
nb_default<-naiveBayes(new2~., data=train1)
default_pred<-predict(nb_default,test1)
enny1<-Sys.time()
xny1<-enny1-starttimeny1
sizeny1<-object.size(train1)
sizeny1
xny1

train2<-train[c(2:400),]
test2<-test[c(2:400),]
new2<-dataset[c(2:400),1]
starttimeny2<-Sys.time()
nb_default<-naiveBayes(new2~., data=train2)
default_pred<-predict(nb_default,test2)
enny2<-Sys.time()
xny2<-enny2-starttimeny2
sizeny2<-object.size(train2)
sizeny2
xny2

train3<-train[c(2:800),]
test3<-test[c(2:800),]
new2<-dataset[c(2:800),1]
starttimeny3<-Sys.time()
nb_default<-naiveBayes(new2~., data=train3)
default_pred<-predict(nb_default,test3)
enny3<-Sys.time()
xny3<-enny3-starttimeny3
sizeny3<-object.size(train3)
sizeny3
xny3


train4<-train[c(2:1500),]
test4<-test[c(2:1500),]
new2<-dataset[c(2:1500),1]
starttimeny4<-Sys.time()
nb_default<-naiveBayes(new2~., data=train4)
default_pred<-predict(nb_default,test4)
enny4<-Sys.time()
xny4<-enny4-starttimeny4
sizeny4<-object.size(train4)
sizeny4
xny4



trialny1<-matrix(c(xny1,xny2,xny3,xny4),ncol=4)
colnames(trialny1)<-c(200,400,800,1500)
rownames(trialny1)<-'TIME'
trialny1.table<-as.table(trialny1)


trialnymem1<-matrix(c(sizeny1,sizeny2,sizeny3,sizeny4),ncol=4)
colnames(trialnymem1)<-c(200,400,800,1500)
rownames(trialnymem1)<-'MEMORY'
trialnymem1.table<-as.table(trialnymem1)


barplot(trialny1.table, main="Comparison For Naive Bayes Algorithm", ylab="TIME in seconds",xlab="Number of Sequence")


barplot(trialnymem1.table, main="Comparison For Naive Bayes Algorithm", ylab="MEMORY in Bytes",xlab="Number of Sequence")