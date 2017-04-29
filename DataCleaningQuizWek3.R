# Install Packages
install.packages("jpeg")
library(jpeg)
install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)
install.pacckages("Hmisc")
library(Hmisc)

# 1:first 3 values that result
fileurl1 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileurl1, destfile="getdata%2Fdata%2Fss06hid.csv", method = 'curl')
data1 = read.csv("getdata%2Fdata%2Fss06hid.csv")
head(data1)
agricultureLogical = data1$ACR == 3 & data1$AGS == 6
head(which(agricultureLogical), 3)

# 2: picture of your instructor into R
fileurl2 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(fileurl2, destfile="getdata%2Fjeff.jpg", method = 'curl')
data2 = readJPEG("getdata%2Fjeff.jpg", native = TRUE)
head(data2)
quantile(data2, probs = c(0.3, 0.8))

#3: Load the Gross Domestic Product data
fileurl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl3, destfile = "getdata%2Fdata%2FGDP.csv", method = 'curl')
data3 <- read.csv("getdata%2Fdata%2FGDP.csv")

# Load educational data set
fileurl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileurl4, destfile = "getdata%2Fdata%2FEDSTATS_Country.csv", method = 'curl')
data4 <- read.csv("getdata%2Fdata%2FEDSTATS_Country.csv")

names(data3)
head(data3)
names(data4)
head(data4)

gdp = fread(data3, skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
edu = fread(data4)
merge = merge(gdp, edu, by = 'CountryCode')
nrow(merge)
View(merge())
?fread
arrange(merge, desc(Rank))[13, Economy]

# 4: What is the average GDP ranking 
tapply(merge$Rank, merge$`Income Group`, mean)

# Cut the GDP ranking into 5 separate quantile group
merge$RankGroups <- cut2(merge$Rank, g=5)
table(merge$RankGroups, merge$`Income Group`)
