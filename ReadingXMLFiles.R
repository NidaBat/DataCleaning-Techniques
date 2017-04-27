#Reading XML files

install.packages("XML")
library(XML)
install.packages("RCurl")
library(RCurl) # get url function
fileUrl <- "https://www.w3schools.com/xml/simple.xml"
xData <- getURL(fileUrl)
doc <- xmlParse(xData, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]

# Programatically extract parts of xml file
xmlSApply(rootNode, xmlValue)

## get items in the menu and prices
xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)

# html parsing
fileURL <- "http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileURL, useInternal = TRUE)
ranking <- xpathSApply(doc, "//li[@class= 'ranking']", xmlValue)
teams <- xpathSApply(doc, "//li[@class= 'team-name']", xmlValue)
ranking
scores
teams

# 4 XML data on Baltimore restaurants
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData <- getURL(fileUrl)
doc <- xmlParse(xData, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode) # just displays top root node name
# one version, no data frame required - no need for zips, zips_dt 
sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")
