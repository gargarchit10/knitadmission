library(arules)
library(stringi)
library(arulesViz)
library(ggplot2)

setwd('C:/Users/Jain/Desktop/R')
marks<-read.csv("list.csv")
newmarks=marks
newmarks$Roll.No.<-NULL
newmarks$Name.of.Student<-NULL
newmarks$Obtained.Marks<-NULL
newmarks$X12th....<-NULL
newmarks$X<-NULL
newmarks$Branch.Course.Name<-gsub(" ","",newmarks$Branch.Course.Name)
newmarks$Grade<-paste(newmarks$Grade,newmarks$Range,sep="")
newmarks$Grade<-paste(newmarks$Grade,newmarks$Branch.Course.Name,sep=" ")
write.csv(newmarks,"new1.csv")


res<-read.transactions("new1.csv",sep=" ")

starttimeap1<-Sys.time()
final<-apriori(res,parameter=list(supp=0.1,conf=0.61),appearance = list(lhs=c("AX","BY","AY","BX"),rhs=c("B.Tech.ComputerScienceandEngineering","B.Tech.ElectricalEngineering")))
enap1<-Sys.time()
xap1<-enap1-starttimeap1
sizeap<-object.size(final)
sizeap
xap1

inspect(final)
final


starttimeap2<-Sys.time()
final<-apriori(res,parameter=list(supp=0.2,conf=0.8),appearance = list(lhs=c("AX","BY","AY","BX"),rhs=c("B.Tech.ComputerScienceandEngineering","B.Tech.ElectricalEngineering")))
enap2<-Sys.time()
xap2<-enap2-starttimeap2
xap2



starttimeap3<-Sys.time()
final<-apriori(res,parameter=list(supp=0.3,conf=0.9),appearance = list(lhs=c("AX","BY","AY","BX"),rhs=c("B.Tech.ComputerScienceandEngineering","B.Tech.ElectricalEngineering")))
enap3<-Sys.time()
xap3<-enap3-starttimeap3
xap3


starttimeap4<-Sys.time()
final<-apriori(res,parameter=list(supp=0.4,conf=1.5),appearance = list(lhs=c("AX","BY","AY","BX"),rhs=c("B.Tech.ComputerScienceandEngineering","B.Tech.ElectricalEngineering")))
enap4<-Sys.time()
xap4<-enap4-starttimeap4
xap4


res2<-res[c(2:400),]
finalap1<-apriori(res2,parameter=list(supp=0.1,conf=0.2))
finallengthap1<-length(finalap1)
sizeap1<-object.size(res2)
sizeap1
convictionap1=interestMeasure(finalap1, "conviction", res2)
cap1<-length(subset(finalap1,convictionap1==1))
cap1
laplaceap1=interestMeasure(finalap1, "laplace", res2)
lap1<-length(subset(finalap1,laplaceap1>=0))
lap1
finalap1<-apriori(res2,parameter=list(supp=0.1,conf=1.0))
conf1<-length(finalap1)
finalap1<-apriori(res2,parameter=list(supp=0.1,conf=0.2))
convictionap1=interestMeasure(finalap1, "lift", res2)
lift1<-length(subset(finalap1,convictionap1>=1))
lift1


res2<-res[c(2:800),]
finalap2<-apriori(res2,parameter=list(supp=0.1,conf=0.4))
finallengthap2<-length(finalap2)
sizeap2<-object.size(res2)
sizeap2
convictionap2=interestMeasure(finalap2, "conviction", res2)
cap2<-length(subset(finalap2,convictionap2==1))
cap2
laplaceap2=interestMeasure(finalap2, "laplace", res2)
lap2<-length(subset(finalap2,laplaceap2>=0))
lap2
finalap2<-apriori(res2,parameter=list(supp=0.1,conf=1.0))
conf2<-length(finalap2)
finalap2<-apriori(res2,parameter=list(supp=0.1,conf=0.4))
convictionap2=interestMeasure(finalap2, "lift", res2)
lift2<-length(subset(finalap2,convictionap2>=1))
lift2



res2<-res[c(2:1600),]
finalap3<-apriori(res2,parameter=list(supp=0.1,conf=0.61))
finallengthap3<-length(finalap3)
sizeap3<-object.size(res2)
sizeap3
convictionap3=interestMeasure(finalap3, "conviction", res2)
cap3<-length(subset(finalap3,convictionap3==1))
cap3
laplaceap3=interestMeasure(finalap3, "laplace", res2)
lap3<-length(subset(finalap3,laplaceap3>=0))
lap3
finalap3<-apriori(res2,parameter=list(supp=0.1,conf=1.0))
conf3<-length(finalap3)
finalap3<-apriori(res2,parameter=list(supp=0.1,conf=0.61))
convictionap3=interestMeasure(finalap3, "lift", res2)
lift3<-length(subset(finalap3,convictionap3>=1))
lift3

res2<-res[c(2:3200),]
finalap4<-apriori(res2,parameter=list(supp=0.1,conf=0.4))
finallengthap4<-length(finalap4)
sizeap4<-object.size(res2)
sizeap4
convictionap4=interestMeasure(finalap4, "conviction", res2)
cap4<-length(subset(finalap4,convictionap4==1))
cap4
laplaceap4=interestMeasure(finalap4, "laplace", res2)
lap4<-length(subset(finalap4,laplaceap4>=0))
finalap4<-apriori(res2,parameter=list(supp=0.1,conf=0.96))
conf4<-length(finalap4)
finalap4<-apriori(res2,parameter=list(supp=0.1,conf=0.4))
convictionap4=interestMeasure(finalap4, "lift", res2)
lift4<-length(subset(finalap4,convictionap4>=1))
lift4

trialap1<-matrix(c(xap1,xap2,xap3,xap4),ncol=4)
colnames(trialap1)<-c(0.1,0.2,0.3,0.4)
rownames(trialap1)<-'TIME'
trialap1.table<-as.table(trialap1)


trialapmem1<-matrix(c(sizeap1,sizeap2,sizeap3,sizeap4),ncol=4)
colnames(trialapmem1)<-c(400,800,1600,3200)
rownames(trialapmem1)<-'MEMORY'
trialapmem1.table<-as.table(trialapmem1)

barplot(trialap1.table, main="Comparison For Apriori Algorithm", ylab="TIME in seconds",xlab="Minimum SUPPORT")

barplot(trialapmem1.table, main="Comparison For Apriori Algorithm", ylab="MEMORY in Bytes",xlab="Number of Sequence")



trialaprule<-matrix(c(finallengthap1,finallengthap2,finallengthap3,finallengthap4),ncol=4)
colnames(trialaprule)<-c(400,800,1600,3200)
rownames(trialaprule)<-'No of Rules with minsup>0.1 & conf>40'
trialaprule.table <- as.table(trialaprule)


barplot(trialaprule.table, main="Comparison", ylab="No of Rules with minsup>0.1 & conf>20",xlab="Number of Sequences")



trialapruleconviction<-matrix(c(cap1,cap2,cap3,cap4),ncol=4)
colnames(trialapruleconviction)<-c(400,800,1600,3200)
rownames(trialapruleconviction)<-'No of Rules with conviction=1'
trialapruleconviction.table <- as.table(trialapruleconviction)


barplot(trialapruleconviction.table, main="Comparison", ylab="No of Rules with conviction=1",xlab="Number of Sequences")



trialaprulelaplace<-matrix(c(lap1,lap2,lap3,lap4),ncol=4)
colnames(trialaprulelaplace)<-c(400,800,1600,3200)
rownames(trialaprulelaplace)<-'No of Rules with Laplace>=0'
trialaprulelaplace.table <- as.table(trialaprulelaplace)

barplot(trialaprulelaplace.table, main="Comparison", ylab="No of Rules with Laplace >=0",xlab="Number of Sequences")


trialapruleconf<-matrix(c(conf1,conf2,conf3,conf4),ncol=4)
colnames(trialapruleconf)<-c(400,800,1600,3200)
rownames(trialapruleconf)<-'No of Rules with Confidence=1'
trialapruleconf.table <- as.table(trialapruleconf)

barplot(trialapruleconf.table, main="Comparison", ylab="No of Rules with Confidence=1",xlab="Number of Sequences")


trialaprulelift<-matrix(c(lift1,lift2,lift3,lift4),ncol=4)
colnames(trialaprulelift)<-c(400,800,1600,3200)
rownames(trialaprulelift)<-'No of Rules with Lift>=1'
trialaprulelift.table <- as.table(trialaprulelift)


barplot(trialaprulelift.table, main="Comparison", ylab="No of Rules with Lift>=1",xlab="Number of Sequences")


