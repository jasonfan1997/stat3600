library(ggplot2)
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
df=read.csv("mcmcforstudent.csv")
df = subset(df, select = -c(Convience,Nightime,China.Mobile,
                            China.United.Network,China.Telecommunications.Corporation) )#Single value
df = subset(df, select = -c(Daytime,theater) )#Single value
X=df[c(2:23)]
Y=df[24]
df[24]=log(df[24])
logy=log(Y)
col=colnames(X)
for (i in col)
{
  temp=ggplot(df,aes_string(x=i, y="the.eletricity.sell.amount.per.day")) +
  geom_point(shape=1) +    #
  geom_smooth(method=lm)
  fit=lm(Y$the.eletricity.sell.amount.per.day~X[[i]])
  temp=temp+labs(title=paste("R squred=",(summary(fit))$r.squared))
  ggsave(paste(i,"log.png"), plot = last_plot(),path = "./plot/",units='cm',width = 16, height = 9,dpi=500)
}