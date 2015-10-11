## read the unzipped data if it hasn't already been read before
source("read_data.R")

## because plot4 re-draws versions of plots 2 & 3, source those files here
run_plot = F ## don't re-run plots 2 & 3; just include their plotting functions
source("plot2.R")
source("plot3.R")

## function to draw the line graph for voltage
plot_voltage <- function() {
    with(dtSub, plot(datetime, Voltage, type = "l"))
}

## function to draw the line graph for global reactive power
plot_GRP <- function() {
    with(dtSub, plot(datetime, Global_reactive_power, type = "l"))
}

## function to generate the PDF for the required plots
plot4 <- function() {
    png("plot4.png")
        curr_mfcol <- par("mfcol") ## store our current mfcol to restore later
        par(mfcol = c(2,2)) # need to set this for the current graphics device
        plot_GAP(plotnum = 4) ## from plot2
        plot_submetering(plotnum = 4) ## from plot3
        plot_voltage()
        plot_GRP()
        par(mfcol = curr_mfcol) ## restore the previous mfcol
    dev.off()
}

## bit of helper code to execute the plot generator if the file is sourced
## by itself (included here mostly for consistency with the previous plots)
run_plot = T
if (run_plot == T)
    plot4()
