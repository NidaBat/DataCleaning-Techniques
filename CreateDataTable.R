# create data table just like data frames
install.packages("data.table")
library(data.table)
DF <- data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each =3), z = rnorm(9))
head(DF)
DT <- data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each =3), z = rnorm(9))
head(DT)
# see all tables in memory
tables()
# subsetting rows
DT[2,]
DT[DT$y == "a",]
DT[c(2, 3)]
# subsetting columns
DT[, c(2, 3)]
{
    x = 1
    y = 2
}
k = {print(10): 5}
print(k)

# calculating values for variables with expressions
DT[, list(mean(x), sum(z))]
DT[, table(y)]

# adding new columns
DT[, w:= z^2] #new copy of data is not created
DT
DT2 <- DT
DT[, y:=2]
head(DT)
head(DT2) #use copy function explicitly to create a copy

# multiple operations
DT[, m:= {tmp <- (x+z); log2(tmp+5)}]
DT
#plyr like operations
DT[, a:=x>0]
DT
DT[, b:=mean(x+w),by=a]
DT

#special variables
#n an integer, length 1 containing the number R
set.seed(1, 2, 3)
DT <- data.table(x = sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]
DT <- data.table(x = rep(c("a", "b", "c"), each = 100), y = rnorm(300))
setkey(DT, x)
DT['a'] #key: to sort or subset the data.table
#keys: joins
DT1 <- data.table(x = rep(c('a', 'a', 'b', 'dt1')), y = 1:4)
DT2 <- data.table(x = rep(c('a','b', 'dt2')), z = 5:7)
setkey(DT, x); setkey(DT2, x)
merge(DT, DT2)

# fast reading
big_df <- data.frame(x = rnorm(1E6), y = rnorm(1E6))
file <- tempfile()
write.table(big_df, file = file, row.names = FALSE, col.names = TRUE, sep = "\t", quote = FALSE)
system.time(fread(file))
system.time(read.table(file, header = TRUE, sep = "\t"))

# 5 American Community Survey distributes
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "ACS.csv")
DT <- fread("ACS.csv", sep = ",")
??fread
