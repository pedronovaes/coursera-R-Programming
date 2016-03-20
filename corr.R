corr <- function(directory, threshold = 0){
    ## "directory" is a character vector of lenght 1 indicating
    ## the location of the CSV files
    
    ## "threshold" is a numeric vector of lenght 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## GOAL: return a numeric vector of correlations
    
    dir <- paste("/home/pedro/Documentos/coursera-R-Programming/", directory, sep = "")
    setwd(dir)
    complete_table <- complete("specdata", 1:332)
    ids <- complete_table$id[complete_table$nobs > threshold]
    cor_monitor <- c()
    all_files <- c(list.files())
    j <- 1
    for (i in ids){
        table <- read.csv(all_files[i])
        cor_monitor[j] <- cor(table$sulfate, table$nitrate, use = "complete.obs")
        j <- j + 1
    }
    #return(round(cor_monitor, 5))
    return(cor_monitor)
}