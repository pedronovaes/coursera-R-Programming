complete <- function(directory, id = 1:332){
    ## "directory" is a character vector of lenght 1 indicating
    ## the location of the CSV files
    
    ## "id" is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## GOAL: return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where "id" is the monitor ID number and "nobs" is the
    ## number of complete cases
    
    dir <- paste("/home/pedro/Documentos/coursera-R-Programming/", directory, sep = "")
    setwd(dir)
    all_files <- c(list.files())
    cases <- c()
    j <- 1
    for (i in id){
        table <- read.csv(all_files[i])
        cases[j] <- sum(complete.cases(table))
        j <- j + 1
    }
    return(data.frame(id = id, nobs = cases))
}