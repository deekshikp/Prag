#Dataset
data("iris")
iris
str(iris)

library(ggplot2)

qplot(Petal.Length, Petal.Width, data=iris, color=Species)

qplot(Sepal.Length, Sepal.Width, data=iris, color=Species)

install.packages("e1071")
library(e1071)

mymodel <-svm(Species~.,data=iris, kernel="radial")

summary(mymodel)

plot(mymodel,data=iris, Petal.Width~Petal.Length, slice=list(Sepal.Width=3,Sepal.Length=4))

pred=predict(mymodel,iris)
pred

#confusion matrix
tab = table(Predicted = pred,
            Actual = iris$Species)
View(tab)
tab
