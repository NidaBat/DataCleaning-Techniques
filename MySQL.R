install.packages("RMySQL")
library(RMySQL)
#ucsc database
## connecting and listing databases
uscDB <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(uscDB, "show databases;"); dbDisconnect(uscDB);
result

#connecting to hg19 and listing tables
hg19 <-dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
hg19
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]
#get dimensions of a specific table
dbListFields(hg19, "tableName")
dbGetQuery(hg19, "select count (*) from tableName")

# read from the table
affyData <- dbReadTable(hg19, "tableName")
head(tableName)
#select a specific subset
query <- dbSendQuery(hg19, "select * from tableName where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
affyMisSmall <- fetch(query, n = 10); dbClearResult(query);
dim(affyMisSmall)

# dont forget to close the connection
dbDisconnect(hg19)