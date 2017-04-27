# reading JSON files
install.packages("jsonlite")
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login

# writing dataframes to JSON
myJSON <- toJSON(iris, pretty = TRUE)
cat(myJSON)
iris2 <- fromJSON(myJSON)
head(iris)
