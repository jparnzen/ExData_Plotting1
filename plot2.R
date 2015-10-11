## read the unzipped data if it hasn't already been read before
source("read_data.R")

## function to plot the line graph for global active power
## I re-use this function for plot4, setting plotnum = 4 in that file
plot_GAP <- function(plotnum = 2) {
    ylabel = "Global Active Power (kilowatts)"
    if (plotnum == 4)
        ylabel = "Global Active Power"
    
    with(dtSub, plot(datetime, Global_active_power, 
         type = "l",
         main = "",
         xlab = "",
         ylab = ylabel))
}

## function to generate the PNG for the plot above
plot2 <- function() {
    png("plot2.png")
        plot_GAP()
    dev.off()
}

## bit of helper code to execute the plot generator if the file is sourced
## by itself
if (!exists("run_plot"))
    run_plot = T
if (run_plot == T)
    plot2()
