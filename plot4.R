## read the unzipped data if it hasn't already been read before
source("read_data.R")

run_plot = F ## don't re-run plots 2 & 3; just include their plotting functions
source("plot2.R")
source("plot3.R")

plot_voltage <- function() {
    with(dtSub, plot(datetime, Voltage, type = "l"))
}

plot_GRP <- function() {
    with(dtSub, plot(datetime, Global_reactive_power, type = "l"))
}

plot4 <- function() {
    png("plot4.png")
        curr_mfcol <- par("mfcol")
        par(mfcol = c(2,2)) # need to set this for the current graphics device
        plot_GAP(plotnum = 4)
        plot_submetering(plotnum = 4)
        plot_voltage()
        plot_GRP()
        par(mfcol = curr_mfcol)
    dev.off()
}

run_plot = T
if (run_plot == T)
    plot4()
