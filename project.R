this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
df=read.csv("mcmcforstudent.csv")
df = subset(df, select = -c(Convience,Nightime,China.Mobile,
                            China.United.Network,China.Telecommunications.Corporation) )#Single value
df = subset(df, select = -c(Daytime,theater) )#Single value
X=df[c(2:23)]
Y=df[24]
logy=log(Y)
col=colnames(X)
t=1
#t=0
bestcol=colnames(X)
for (i in 1:21)
{
  fit=lm(logy$the.eletricity.sell.amount.per.day~.,data=X[col])
  coeff<- coef(summary(fit))
  f=(summary(fit)$fstatistic)
  tempt=pf(f[1],f[2],f[3],lower.tail=F)
  #tempt=(summary(fit)$adj.r.squared)
  if(tempt<t){
    t=tempt
    bestcol=col
  }
  worst=which.max(coeff[,"Pr(>|t|)"])-1
  col=col[-c(worst)]
    
}
fit=lm(logy$the.eletricity.sell.amount.per.day~.,data=X[bestcol])