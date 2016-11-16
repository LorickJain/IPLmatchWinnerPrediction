di<-read.table("rcb.csv",header=T,sep=",")
head(di)
set.seed(1020)
part<-sample(1:nrow(di),ceiling(2/3*nrow(di)),replace=F)
val<-di[-part,]
trn<-di[part,]
trn$runstotal <- as.factor(trn$runstotal)
val$runstotal <- as.factor(val$runstotal)
m.tr<-NaiveBayes(runstotal~.,dat=trn)
trn$runsbatsman <- as.factor(trn$runsbatsman)
val$runsbatsman <- as.factor(val$runsbatsman)
val$runsextras <- as.factor(val$runsextras)
trn$runsextras <- as.factor(trn$runsextras)
m.tr<-NaiveBayes(runstotal~.,dat=trn)
plot(m.tr)
m.vl<-predict(m.tr,dat=trn)
print(table(trn$runstotal,m.vl$class))
m.vl<-predict(m.tr,val)
print(table(val$runstotal,m.vl$class))
m.vl$class

