# Start with reshaping
install.packages("reshape2")
library(reshape2)
head(mtcars)

# Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

# Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

# Averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

# Another way - split
spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns

# Another way - apply
sprCount = lapply(spIns,sum)
sprCount

# Another way - combine
unlist(sprCount)
sapply(spIns,sum)

# Another way - plyr package
install.packages("plyr")
library(plyr)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

# Creating a new variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
