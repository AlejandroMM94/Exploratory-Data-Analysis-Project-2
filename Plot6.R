# Extracting the data
getwd()
unzip("./Datos/R/exdata_data_NEI_data.zip", exdir = "./Datos/R/air_pollution")

# Reading the data
summary <- readRDS("./Datos/R/air_pollution/summarySCC_PM25.rds")}
source <- readRDS("./Datos/R/air_pollution/Source_Classification_Code.rds")

# Loading ggplot2 Package
library(ggplot2)

# Opening a png file
png(filename = "plot6.png", width = 480, height = 480)

# Question 6
baltimoreLA <- subset(summary, summary$fips %in% c("24510" , "06037") & summary$type == "ON-ROAD")
baltimoreLAEmissions <- aggregate(Emissions ~ year + fips, baltimoreLA, sum)
ggplot(baltimoreLAEmissions, aes(year, Emissions, color = fips)) + 
	geom_line() + 
	geom_point() + 
	labs(title = "Total Emissions of PM2.5 from motor vehicle sources in Baltimore and L.A", x = "Year", y = "Total Emissions of PM2.5") + 
	scale_color_discrete(name = "City", labels = c("L.A", "Baltimore")) + 
	theme_classic()

# Close png file
dev.off()
