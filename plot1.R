## read the unzipped data if it hasn't already been read before
source("read_data.R")

## function to plot the required histogram
hist_GAP <- function() {
    hist(dtSub$Global_active_power, 
         col="red", 
         main="Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
}

## generate the PNG for the histogram
plot1 <- function() {
    png("plot1.png") ## defaults to 480px x 480px
        hist_GAP()
    dev.off()
}

## bit of helper code to execute the plot generator if the file is sourced
## by itself
if (!exists("run_plot"))
    run_plot = T
if (run_plot == T)
    plot1()
