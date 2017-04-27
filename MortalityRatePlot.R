# Set the workinng directory

getwd()
setwd("/Users/sarmadbatt/Desktop/coursera/rprog%2Fdata%2FProgAssignment3-data")

# Read the "Outcome of care measure" file

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# Explore the data in "Outcome of care measure" file

dim(outcome)
names(outcome)
str(outcome)
summary(outcome)
head(outcome)
tail(outcome)

# 1. Draw histogram for 30-day mortality for heart attacks (column 11)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
