grad=read.csv("Admission_Predict.csv")
View(grad)

str(grad)

#Slice the dataset
gre=grad[,2]
coa=grad[,9]

#Converting into dataframe
data=data.frame(gre,coa)
View(data)

#Install packages
install.packages("caTools") #Data Splitting
library(caTools)

#Generating random numbers
set.seed(42)

#data splitting
split = sample.split(data$coa,SplitRatio = 0.8)
View(split)
print(split)

#Training data
training_set = subset(data,split==TRUE)
View(training_set)

#testing data
testing_set = subset(data,split==FALSE)
View(testing_set)

#apply regression
regressor = lm(formula = coa~gre, data = training_set)
View(regressor)

#Prediction
y_pred=predict(regressor,newdata = testing_set)
View(y_pred)

data1=data.frame(testing_set$coa, y_pred)
View(data1)

library(ggplot2)
plot(testing_set$gre,testing_set$coa, type='p', col='blue', xlab='GRE',ylab='COA')

lines(testing_set$gre,y_pred,type = 'o', col='red')

#visualization
ggplot(testing_set, aes(x = gre))+
geom_point(aes(y = coa, color = 'Actual')) + 
  geom_line(aes(y = y_pred, color = 'Predicted'))
