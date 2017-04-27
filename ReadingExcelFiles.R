# Download baltimore camera data
if(!file.exists("data")){
    dir.create("data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.csv", method = "curl")
dateDownloaded <- date()

# Reading excel files
install.packages("xlsx")
library(xlsx)
### Coursera Data Manuplation Quiz 1 ###
# Download American Community Survey
if(!file.exists("data")){
    dir.create("data")
}
#install.packages("data.table")
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "getdata%2Fdata%2Fss06hid.csv", method = "curl")
dateDownloaded <- date()
dateDownloaded
data <- read.csv("getdata%2Fdata%2Fss06hid.csv")
head(data$VAL) # take a look at the contents of the VAL (property worth) variable
DT = data.table(data) # create data.table version of data
DT[, .N, by=VAL==24]  # use built-in ".N" function to find counts. 24 is $1M+ in lookup.
# ANSWER = 53 AT $1m+ (NUMBER 24)

head(DT$FES, 20)

#3 Reading excel files:  Natural Gas Aquisition
install.packages("xlsx")
library(xlsx)
fileXLS <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
# use mode = "wb" forces binary mode - doesn't read correctly without this!
download.file(fileXLS,destfile="getdata%2Fdata%2FDATA.gov_NGAP.xlsx", mode = "wb")
dateDownloadedXLS <- date() # if you want to store the date of download
colIndex <- 7:15 
rowIndex <- 18:23
dat <- read.xlsx("getdata%2Fdata%2FDATA.gov_NGAP.xlsx",sheetIndex=1, colIndex = colIndex, rowIndex = rowIndex) #select first sheet, specific col/rows.
sum(dat$Zip*dat$Ext,na.rm=T) # code lesson gives your to run

