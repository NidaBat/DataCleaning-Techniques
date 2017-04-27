source("http://bioconductor.org/biocLite.R")
biocLite(rhdf5)
install.packages("rhdf5", repos="http://r-forge.r-project.org", type = "source")
library(rhdf5)
created <- h5reateFile("example.h5")
created

# create groups
created <- h5createGroup("example.h5", "foo")
h5ls("example.h5")

#write to groups
A <- matrix(1:10, nr = 5, nc = 2)
h5write(A, "example.h5", "foo/A")
B <- array(seq(0.1, 2.0, by = 0.1), dim = c(5, 5, 2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/B")
h5ls("example.h5")

# write a dataset
df = data.frame(1L:5L, seq(0,1, length.out = 5), c("ab", "cde", "fghi", "a", "s", stringAsFactor =  FALSE))
h5write(df, "example.h5", "df")
h5ls("example.h5")

# read a dataset
 readA <- h5read("example.h5", "foo/A") 
 readB <- h5read("example.h5", "foo/B") 
 readF <- h5read("example.h5", "df") 
 read
 # writing and reading in chunks
 h5write(c(12, 13, 14), "example.h5", "foo/A", index = list(1:3, 1))
 h5Read("example.h5", "foo/A")