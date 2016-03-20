pollutantmean <- function(directory, pollutant, id = 1:332){
    ## "directory" is a character vector of lenght 1 indicating
    ## the location of the CSV files
    
    ## "pollutant" is a character vector of lenght 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## "id" is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## GOAL: return the mean of the pollutant across all monitors list
    ## in the "id" vector (ignoring NA values)
    
    dir <- paste("/home/pedro/Documentos/coursera-R-Programming/", directory, sep = "")
    setwd(dir)
    all_files <- c(list.files())
    mean_p <- c()
    for (i in id){
        table <- read.csv(all_files[i])
        na_removed <- table[!is.na(table[, pollutant]), pollutant]
        mean_p <- c(mean_p, na_removed)
    }
    mean_p <- mean(mean_p)
    return(round(mean_p, 3))
}