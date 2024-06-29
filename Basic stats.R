neo=read.csv("neo.csv")
View(neo)
str(neo)

#mean
dist_nom_mn=mean(neo$CA.Distance.Nominal..au.)
dist_min_mn=mean(neo$CA.Distance.Minimum..au.)
vrel_mean=mn(neo$Vrelative..km.s.)
v_inf_mean=mn(neo$V.infinity..km.s.)
Hmag_mean=mn(neo$H..mag.)
print(dist_nom_mn)
print(dist_min_mn)
print(vrel_mean)
ripnt(v_inf_mean)

#median
meedian=median(neo$Estimated.Diameter.minimum..m.)
print(meedian)

#mode
mode1=mode(neo$H..mag.)
print(mode1)

library(modeest)
library(moments)

#SD
sdofvel= sd(neo$Vrelative..km.s.)
print(sdofvel)

#var
varofvel=var(neo$Vrelative..km.s.)
print(varofvel)

#skewness
skew=skewness(neo$CA.Distance.Minimum..au.)
print(skew)

#kurtosis
kurt=kurtosis(neo$CA.Distance.Minimum..au.)
print(kurt)
