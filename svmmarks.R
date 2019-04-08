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
starttime2<-Sys.time()
sv1<-svm(new2 ~.,data=train,cost=100)
pred<-predict(sv1,test)
pred
en2<-Sys.time()
x2<-en2-starttime2
x2
sizesv<-object.size(pred)
sizesv
table(pred,test[,2])



train1<-train[c(2:200),]
test1<-test[c(2:200),]
new2<-dataset[c(2:200),1]
starttimesv1<-Sys.time()
sv1<-svm(new2 ~.,data=train1,cost=100)
pred<-predict(sv1,test1)
ensv1<-Sys.time()
xsv1<-ensv1-starttimesv1
sizesv1<-object.size(train1)
sizesv1
xsv1

train2<-train[c(2:400),]
test2<-test[c(2:400),]
new2<-dataset[c(2:400),1]
starttimesv2<-Sys.time()
sv1<-svm(new2 ~.,data=train2,cost=100)
pred<-predict(sv1,test2)
ensv2<-Sys.time()
xsv2<-ensv2-starttimesv2
sizesv2<-object.size(train2)
sizesv2
xsv2

train3<-train[c(2:800),]
test3<-test[c(2:800),]
new2<-dataset[c(2:800),1]
starttimesv3<-Sys.time()
sv1<-svm(new2 ~.,data=train3,cost=200)
pred<-predict(sv1,test3)
ensv3<-Sys.time()
xsv3<-ensv3-starttimesv3
sizesv3<-object.size(train3)
sizesv3
xsv3

train4<-train[c(2:1500),]
test4<-test[c(2:1500),]
new2<-dataset[c(2:1500),1]
starttimesv4<-Sys.time()
sv1<-svm(new2 ~.,data=train4,cost=100)
pred<-predict(sv1,test4)
ensv4<-Sys.time()
xsv4<-ensv4-starttimesv4
sizesv4<-object.size(train4)
sizesv4
xsv4




trialsv1<-matrix(c(xsv1,xsv2,xsv3,xsv4),ncol=4)
colnames(trialsv1)<-c(200,400,800,1500)
rownames(trialsv1)<-'TIME'
trialsv1.table<-as.table(trialsv1)


trialsvmem1<-matrix(c(sizesv1,sizesv2,sizesv3,sizesv4),ncol=4)
colnames(trialsvmem1)<-c(200,400,800,1500)
rownames(trialsvmem1)<-'MEMORY'
trialsvmem1.table<-as.table(trialsvmem1)

barplot(trialsv1.table, main="Comparison For SVM Algorithm", ylab="TIME in seconds",xlab="Number of Sequence")

barplot(trialsvmem1.table, main="Comparison For SVM Algorithm", ylab="MEMORY in Bytes",xlab="Number of Sequence")
