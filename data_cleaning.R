library(dplyr)

#import data
imdb=read.csv("imdb_movies.csv")
View(imdb)

#Removing special charecters
imdb$years=gsub("[()]","",imdb$years)
View(imdb)

imdb$time=gsub("[min]", "",imdb$time)
View(imdb)

typeof(imdb$names)


str(imdb)

#Converting Datatype
imdb$years=as.integer(imdb$years)
imdb$time=as.numeric(imdb$time)
str(imdb)

#Handling missing values
#Adding a column
set.seed(123)
imdb$Gross <- runif(50,min=100000,max=10000000)
View(imdb)

imdb$Gross_dollars <- runif(50,min=1000000,max=100000000)
View(imdb)

#Removing a column
imdb=subset(imdb,select = -(Gross))
View(imdb)

#Apply ranking & reorder
imdb$rank <- c(1:50)
View(imdb)

imdb<-imdb[c("rank","names","years","rating","time","Gross_dollars")]
View(imdb)

#invoking NA 
imdb[4,6]<- NA
imdb[1,6]<- NA
imdb[7,6]<- NA
imdb[42,6]<- NA
imdb[34,6]<- NA

View(imdb)

#Dealing with missing values
imdb$Gross_dollars=ifelse(is.na(imdb$Gross_dollars), 
                          ave(imdb$Gross_dollars, 
                              FUN = function(x) 
                                mean(x, na.rm = TRUE)), 
                              imdb$Gross_dollars)
View(imdb)                          

#Watchlist column ratings>8.6
imdb$Watch_list <- imdb$rating > 8.6
View(imdb)

str(imdb)

imdb$Watch_list <- as.factor(imdb$Watch_list)
str(imdb)

#Dealing with categorical data
imdb$Watch_list<- factor(imdb$Watch_list,
                         levels = c('TRUE','FALSE'),
                         labels = c(1,0))
View(imdb)
