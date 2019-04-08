library(arules)
setwd('C:/Users/Jain/Desktop/R')
res1<-read.transactions("new1.csv",sep=" ")

starttimeec<-Sys.time()
final1<-eclat(res1,parameter=list(supp=0.1))
rules1<-ruleInduction(final1,res1,confidence=0.7)
rules1
enec<-Sys.time()
xec<-enec-starttimeec
sizeec<-object.size(final1)
sizeec
xec

inspect(rules1)

starttimeec1<-Sys.time()
final2<-eclat(res1,parameter=list(supp=0.2))
enec1<-Sys.time()
xec1<-enec1-starttimeec1
xec1


starttimeec2<-Sys.time()
final3<-eclat(res1,parameter=list(supp=0.3))
enec2<-Sys.time()
xec2<-enec2-starttimeec2
xec2


starttimeec3<-Sys.time()
final4<-eclat(res1,parameter=list(supp=0.4))
enec3<-Sys.time()
xec3<-enec3-starttimeec3
xec3




trial1<-matrix(c(xec,xec1,xec2,xec3),ncol=4)
colnames(trial1)<-c(0.1,0.2,0.3,0.4)
rownames(trial1)<-'TIME'
trial1.table<-as.table(trial1)



barplot(trial1.table, main="Comparison For Eclat Algorithm", ylab="TIME in seconds",xlab="Minimum SUPPORT")


res2<-res[c(2:400),]
sizeec1<-object.size(res2)
sizeec1


res2<-res[c(2:800),]
sizeec2<-object.size(res2)
sizeec2


res2<-res[c(2:1600),]
sizeec3<-object.size(res2)
sizeec3


res2<-res[c(2:3200),]
sizeec4<-object.size(res2)
sizeec4
finalec4<-eclat(res2,parameter=list(supp=0.1))
rulesec4<-ruleInduction(finalec4,res2,confidence=0.4)
finallengthec4<-length(rulesec4)
convictionec4=interestMeasure(rulesec4, "conviction", res2)
cec4<-length(subset(rulesec4,convictionec4==1))
cec4
laplaceec4=interestMeasure(rulesec4, "laplace", res2)
lec4<-length(subset(rulesec4,laplaceec4>=0))
lec4
finalec4<-eclat(res2,parameter=list(supp=0.1))
rulesec4<-ruleInduction(finalec4,res2,confidence=0.96)
confec4<-length(rulesec4)
finalec4<-eclat(res2,parameter=list(supp=0.1))
rulesec4<-ruleInduction(finalec4,res2,confidence=0.4)
convictionec4=interestMeasure(rulesec4, "lift", res2)
liftec4<-length(subset(rulesec4,convictionec4>=1))
liftec4

trialecmem1<-matrix(c(sizeec1,sizeec2,sizeec3,sizeec4),ncol=4)
colnames(trialecmem1)<-c(400,800,1600,3200)
rownames(trialecmem1)<-'MEMORY'
trialecmem1.table<-as.table(trialecmem1)


barplot(trialecmem1.table, main="Comparison For Eclat Algorithm", ylab="MEMORY in Bytes",xlab="Number of Sequence")


trialecruleparameter<-matrix(c(liftec4,confec4,lec4,cec4,finallengthec4),ncol=5)
colnames(trialecruleparameter)<-c('Lift>=1','Confidence=1','Laplace>=0','Conviction=1','Minsupp>0.1&Conf>20')
rownames(trialecruleparameter)<-'No of Rules'
trialecruleparameter.table<-as.table(trialecruleparameter)


barplot(trialecruleparameter.table, main="Comparison for Eclat", ylab="No of Rules ",xlab="Parameters")
