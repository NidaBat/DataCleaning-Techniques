# libraries
install.packages("httr")
library(httr)
install.packages("httpuv")
library(httpuv)
install.packages("jsonlite")
library(jsonlite)

#  1 register an application through https://github.com/settings/applications
#github API authorisation 
oauth_endpoints("github")

myapp <- oauth_app("Coursera Data cleaning Quiz2", 
                   key ="568152a5190f79e2c242", 
                   secret = "b016ed5d6d1998eee0a2d5e62b0982c73d638be1")

# get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# use API
req <- GET("https://api.github.com/users/jtleek/repos", 
           config(token = github_token))
stop_for_status(req)
output <- content(req)
jsondata <- fromJSON(toJSON(output))
subset(jsondata, name == "datasharing", select = c(created_at))

# 2 Install package “sqldf”, 
install.packages("sqldf")
library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileUrl,destfile="getdata.csv", method="curl")
acs <- read.csv("getdata.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")

# 3 different query, same result
sqldf("select distinct AGEP from acs")

# 4 No. of chars in 10th, 20th, 30th and 100th place

char <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(char)
close(char)

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

# 5 sum of the numbers in the fourth of the nine columns
## One function for Download and read
data <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
                 skip = 4,
                 widths = c(12, 7,4, 9,4, 9,4, 9,4))
head(data)
sum(data[, 4])
