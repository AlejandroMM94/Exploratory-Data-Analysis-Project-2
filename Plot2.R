# Extracting the data
getwd()
unzip("./Datos/R/exdata_data_NEI_data.zip", exdir = "./Datos/R/air_pollution")

# Reading the data
summary <- readRDS("./Datos/R/air_pollution/summarySCC_PM25.rds")}
source <- readRDS("./Datos/R/air_pollution/Source_Classification_Code.rds")

# # Opening a png file
png(filename = "plot2.png", width = 480, height = 480)

# Question 2
baltimore <- subset(summary, summary$fips == "24510")
baltimoreEmissions <- aggregate(Emissions ~ year, baltimore, sum)
with(baltimoreEmissions, plot(year, Emissions, type = "b", 
main = "Total Emissions of PM2.5 per Year in Baltimore City", xlab = "Year", 
ylab = "Total Emissions of PM2.5 in Baltimore City", col = "red"))

# Close png file
dev.off()
