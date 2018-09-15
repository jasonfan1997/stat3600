this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
df=read.csv("mcmcforstudent.csv")
df = subset(df, select = -c(Convience,Nightime,China.Mobile,
                            China.United.Network,China.Telecommunications.Corporation) )#Single value
df = subset(df, select = -c(Daytime,theater) )#Single value
X=df[c(2:23)]
Y=df[24]
fit=lm(Y$the.eletricity.sell.amount.per.day~.,data = X)
