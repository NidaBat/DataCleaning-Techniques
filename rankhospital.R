## 3. Create  a function to rank hospitals by outcome in state

rankhospital <- function(state, outcome, num = "best"){
    
    ## Read the file outcome
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    if(!state %in% outcome_data$State){
        stop("invalid state")
    } 
    else{
        if (outcome == "heart attack"){
            colnum <- 11
        }
        else if (outcome == "heart failure"){
            colnum <- 17
        }
        else if (outcome == "pneumonia"){
            colnum <- 23
        }
        else{
            stop("invalid outcome")
        }
        
        ## determing the colnum
        ## omit the "Not Available" (NA) value for the next length function
        
        outcome_data1 <- subset(outcome_data, State == state & outcome_data[,colnum]!= "Not Available")
        
        if (num == "best"){
            rank <- 1
        }
        else if (num == "worst"){
            rank <- length(outcome_data1[,colnum])
        }
        else if (num > nrow(outcome_data1)){
            return(NA)
        }
        else{
            rank <- num
        }
        hos_num <- sort(as.numeric(outcome_data1[,colnum]))
        hos_name <- subset(outcome_data1, as.numeric(outcome_data1[,colnum]) == hos_num[rank])
##death rate has to be numeric
        
        return(hos_name[1,2]) ##If 2 value exist, just return the first
    }
}

## sample inputs:
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
