## read the unzipped data if it hasn't already been read before
source("read_data.R")

## function to plot the layered line graph of the 3 submetering data
## I re-use this function in plot4, setting plotnum = 4 in that file
plot_submetering <- function(plotnum = 3) {
    boxtype = "o"
    if (plotnum == 4)
        boxtype = "n"
    
    with(dtSub, plot(datetime, Sub_metering_1,
                        type = "n",
                        xlab="", 
                        ylab="Energy sub metering"))
    with(dtSub, lines(datetime, Sub_metering_1, col = "black"))
    with(dtSub, lines(datetime, Sub_metering_2, col = "red"))
    with(dtSub, lines(datetime, Sub_metering_3, col = "blue"))
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"),
           lty = "solid",
           bty = boxtype)
}

## function to generate the PNG for the plot function above
plot3 <- function() {
    png("plot3.png")
        plot_submetering()
    dev.off()
}

## bit of helper code to execute the plot generator if the file is sourced
## by itself
if (!exists("run_plot"))
    run_plot = T
if (run_plot == T)
    plot3()
