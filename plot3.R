## read the unzipped data if it hasn't already been read before
source("read_data.R")

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

plot3 <- function() {
    png("plot3.png")
        plot_submetering()
    dev.off()
}

if (!exists("run_plot"))
    run_plot = T
if (run_plot == T)
    plot3()
