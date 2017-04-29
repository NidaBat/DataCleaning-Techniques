# install package
install.packages("dplyr")
library(dplyr)

# select
chicago <- readRDS("chicago.rds")
dim(chicago)
names(chicago)[1:3]
head(select(chicago, city:dptp))
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

# filter
chic.f <- filter(chicago, pm25tmean2 > 30)
head(select(chic.f, 1:3, pm25tmean2), 10)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)


# arrange: sort
chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)

tail(select(chicago, date, pm25tmean2), 3)

chicago <- arrange(chicago, desc(date))
head(select(chicago, date, pm25tmean2), 3)

tail(select(chicago, date, pm25tmean2), 3)


# rename: add new variable
head(chicago[, 1:5], 3)
chicago <- rename(chicago, dewpoint = dptp, 
                  pm25 = pm25tmean2)
head(chicago[, 1:5], 3)


# mutate: add new variable
chicago <- mutate(chicago, 
                  pm25detrend=pm25-mean(pm25, na.rm=TRUE))
head(select(chicago, pm25, pm25detrend))

# group_by: spilits the data frame
chicago <- mutate(chicago, 
                  tempcat = factor(1 * (tmpd > 80), 
                                   labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)

# summarize
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2), 
          no2 = median(no2tmean2))

chicago <- mutate(chicago, 
                  year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)

# summarize
summarize(years, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2, na.rm = TRUE), 
          no2 = median(no2tmean2, na.rm = TRUE))


# %>% : pipeline operator: 1 operation then another operation ...in sequence
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), 
              o3 = max(o3tmean2, na.rm = TRUE), 
              no2 = median(no2tmean2, na.rm = TRUE))


