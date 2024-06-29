Titanic=read.csv("titanic.csv", stringsAsFactors = FALSE)
View(Titanic)
str(Titanic)

#Converting data types
Titanic$pclass=as.factor(Titanic$pclass)
Titanic$survived=as.factor(Titanic$survived)
Titanic$sex=as.factor(Titanic$sex)
Titanic$embarked=as.factor(Titanic$embarked)

str(Titanic)

#Express the table
prop.table(table(Titanic$survived))

library(ggplot2)

ggplot(Titanic, aes(x = survived))+ 
  theme_classic()+geom_bar()+
  labs(y = "PassengerCount",title= "Titanic Survival Count")

ggplot(Titanic, aes(x = sex, fill= survived))+ 
  theme_light()+geom_bar()+
  labs(y = "PassengerCount",title= "Titanic Survival Count")

ggplot(Titanic, aes(x = pclass, fill= survived))+
  theme_light()+geom_bar()+
  labs(y = "PassengerCount",title= "Titanic Survival Count")

#Facet grid
ggplot(Titanic, aes(x = sex, fill= survived))+ 
  theme_light()+
  facet_grid(~pclass)+
  geom_bar()+
  labs(y = "PassengerCount",title= "Titanic Survival Count")

#Pie chart
ggplot(Titanic, aes(x = "", fill= survived))+
  facet_grid(~pclass)+
  geom_bar(position = "fill")+
  coord_polar(theta = "y")
ggplot(Titanic,aes(x = age))+
  theme_bw()+geom_histogram(binwidth = 5)+
  labs(y = "passenger count", x = "age",
  title = "Titanic Age distribution")
ggplot(Titanic,aes(x = age, fill=survived))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(y = "passenger count", x = "age",title = "Titanic Age distribution")

#Box plot
ggplot(Titanic,aes(x = survived,y=age))+
  theme_bw()+
  geom_boxplot()+
  labs(y = "age", x = "survived",title = "Titanic survival rate")

#Density plot
ggplot(Titanic,aes(x = age, fill=survived))+
  theme_bw()+
  facet_wrap(sex~pclass)+
  geom_density(alpha = 0.75)+
  labs(y = "age", x = "survived",title = "Titanic survival rate")
  
