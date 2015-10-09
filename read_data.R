## read_data.R
## Read in the data for this assignment.
## In addition:
## * only the read the data in once (because the data file has >2M rows)
## * store the data in a new environment, so as not to pollute the user's
##   current environment or collide with any working variables in their
##   current environment.
## REQUIRES: data.table
## EXPORTS: plotEnv (new environment for data),
##          plotEnv$dt (complete data table),
##          plotEnv$dtSub (data table for 2007-02-01 to 2007-02-02),
##          plotEnv$datetime (vector of POSIXlt dates and times from dtSub)

## if the new environment doesn't exist, create it and attach it to
## the search path
plotEnv <- tryCatch(as.environment("plotEnv"),
                    error = function(e) { attach(NULL, name = "plotEnv") })

## check to see if we've already created our variables in the new environment,
## and if not, read in the data, prep it, and store it in the new environment.
if (!("dt" %in% ls("plotEnv"))) {
    stopifnot(require(data.table))
    with(plotEnv, {
        dt <- fread("household_power_consumption.txt", na.strings = "?")
        dtSub <- dt[Date == "1/2/2007" | Date == "2/2/2007"]
        dtSub$Date <- as.Date(dtSub$Date, format = "%d/%m/%Y")
        datetime <- as.POSIXlt(paste(dtSub$Date, dtSub$Time))
    })
}
