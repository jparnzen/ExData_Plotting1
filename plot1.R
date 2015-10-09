## read the unzipped data if it hasn't already been read before
source("read_data.R")

hist_GAP <- function() {
    hist(dtSub$Global_active_power, 
         col="red", 
         main="Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
}

plot1 <- function() {
    png("plot1.png")
        hist_GAP()
    dev.off()
}

if (!exists("run_plot"))
    run_plot = T
if (run_plot == T)
    plot1()
