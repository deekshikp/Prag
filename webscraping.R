library(rvest)
library(robotstxt)

url="https://www.moviecrow.com/tamil/top-100-movies"

check=paths_allowed(url)
web=read_html(url)
View(web)

#Scrapping Names
names=web %>%
  html_nodes(".film_name a") %>%
  html_text()
View(names)

#Scraping release date
release_date=web %>%
  html_nodes("h6") %>%
  html_text()
View(release_date)

#Scraping ratings
ratings=web %>%
  html_nodes(".movies_rating span") %>%
  html_text()
View(ratings)

#Scraping reviews
reviews=web %>%
  html_nodes(".movies_rating p") %>%
  html_text()
View(reviews)

#Creating a data frame
movies.data = data.frame(names,release_date,ratings,reviews)
View(movies.data)

#Saving into csv file
write.csv(movies.data,"movies.csv")

