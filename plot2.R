## read the unzipped data if it hasn't already been read before
source("read_data.R")

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

plot2 <- function() {
    png("plot2.png")
        plot_GAP()
    dev.off()
}

if (!exists("run_plot"))
    run_plot = T
if (run_plot == T)
    plot2()
