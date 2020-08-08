# Extracting the data
getwd()
unzip("./Datos/R/exdata_data_NEI_data.zip", exdir = "./Datos/R/air_pollution")

# Reading the data
summary <- readRDS("./Datos/R/air_pollution/summarySCC_PM25.rds")}
source <- readRDS("./Datos/R/air_pollution/Source_Classification_Code.rds")

# Loading ggplot2 Package
library(ggplot2)

# Opening a png file
png(filename = "plot4.png", width = 480, height = 480)

# Question 4
coal <- source[grepl("Coal", source$Short.Name, ignore.case = TRUE), ]
coalSCC <- summary[summary$SCC %in% coal$SCC, ]
coalEmissions <- aggregate(Emissions ~ year + type, coalSCC, sum)
ggplot(coalEmissions, aes(year, Emissions, color = type)) + 
	geom_line() + 
	geom_point() + 
	labs(title = "Total Emissions of PM2.5 from Coal combustion by year and type", x = "Year", y = "Total Emissions of PM2.5") + 
	scale_color_discrete(name = "Types of sources") + 
	theme_classic()

# Close png file
dev.off()
