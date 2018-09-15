df=read.csv("mcmcforstudent.csv")
df = subset(df, select = -c(Convience,Nightime,China.Mobile,
                            China.United.Network,China.Telecommunications.Corporation) )#Single value
df = subset(df, select = -c(Daytime,theater) )#Single value
X=df[c(2:23)]
Y=df[24]
