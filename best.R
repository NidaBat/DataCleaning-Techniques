# 2. Create function to search for the best hospitals in the state

best <- function(state, outcome){
    
    ## Read the data outcome
    
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")  
    
    ## Check the state and outcome are valid
    
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
        min_mort <- min(as.numeric(outcome_data1[,colnum]))
        lowest_mort <- subset(outcome_data1, as.numeric(outcome_data1[,colnum]) == min_mort)
        return(lowest_mort[,2])
    }
}

## Sample input data
best("IL", "heart attack")
best("IL", "heart failure")
best("IL", "pneumonia")
best("NY", "heart attack")
best("NY", "heart failure")
best("NY", "pneumonia")
best("TX", "heart attack")
best("BB", "heart failure")
best("NY", "hert attack")
best("SC", "heart attack")
best("AK", "pneumonia")
