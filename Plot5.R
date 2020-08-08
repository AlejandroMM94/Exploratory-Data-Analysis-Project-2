# Extracting the data
getwd()
unzip("./Datos/R/exdata_data_NEI_data.zip", exdir = "./Datos/R/air_pollution")

# Reading the data
summary <- readRDS("./Datos/R/air_pollution/summarySCC_PM25.rds")}
source <- readRDS("./Datos/R/air_pollution/Source_Classification_Code.rds")

# Loading ggplot2 Package
library(ggplot2)

# Opening a png file
png(filename = "plot5.png", width = 480, height = 480)

# Question 5
baltimoreOnroad <- subset(summary, summary$fips == "24510" & summary$type == "ON-ROAD")
baltimoreOnroadTypes <- aggregate(Emissions ~ year, baltimoreOnroad, sum)
ggplot(baltimoreOnroadTypes, aes(year, Emissions)) + 
	geom_line(col = "red") + 
	geom_point(col = "red") + 
	labs(title = "Total Emissions of PM2.5 from motor vehicle sources of Baltimore City", x = "Year", y = "Total Emissions of PM2.5") + 
	scale_color_discrete(name = "Types of sources") + 
	theme_classic()

# Close png file
dev.off()
