install.packages("googleVis")
install.packages(c("devtools","jsonlite", "knitr", "shiny", "httpuv"))

library(devtools)
library(googleVis)

demo(googleVis)
install_github("mages/googleVis")

require(datasets)

states = data.frame(state.name, state.x77)
G3 = gvisGeoChart(states, 
                  locationvar = "state.name", 
                  colorvar = "Income",
                  options=list(region="US", 
                               displayMode="text", # 4 options: auto, regions, markers, text
                               resolution="provinces",
                               width=800, height=600))

plot(G3)

# gvisGeoChart -----------------------------------------------------------
library(XML)
eq <- read.csv("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv")

head(eq)
names(eq)
dim(eq)

eq$loc=paste(eq$latitude, eq$longitude, sep=":")
eq$loc

range(eq$mag)
range(eq$depth)

G = gvisGeoChart(eq, locationvar = "loc", colorvar = "depth", sizevar = "mag",
                 options=list(displayMode="Markers",
                              colorAxis="{colors:['purple', 'red', 'orange', 'grey']}",
                              backgroundColor="lightblue"), chartid="EQ")

plot(G)


# gvisOrgChart ----------------------------------------------------------
Regions
Org <- gvisOrgChart(Regions, options = list(width=600, height=250,
                                            size='large', allowCollapse=TRUE))
plot(Org)


# gvisTreeMap -----------------------------------------------------------
Tree <- gvisTreeMap(Regions, idvar = "Region", parentvar="Parent", sizevar = "Val",
                    colorvar="Fac", options=list(width=450, height=320))
plot(Tree)


telco <- read.csv('C:/Users/202-22/Documents/Python - Hyesu/Project/data/telco/telco_train.csv')
head(telco)


telco_vis <- gvisTreeMap(telco, idvar = "PhoneService", parentvar="InternetService")
org_telco <- gvisOrgChart(telco,  options = list(width=600, height=250,
                                                 size='large', allowCollapse=TRUE))
plot(org_telco)


names(telco)


# Practice ----------------------------------------------------------------
setwd('C:\\Users\\202-22\\Documents\\R\\R2_Project\\R_Studio_exercise\\data\\RLoveYou')
pp <- read.csv('지역별인구현황_2014_4월기준.csv')
head(pp)
pp$loc=paste(pp$LAT, pp$LON, sep=":")

p = gvisGeoChart(pp, locationvar = "loc", sizevar = "총인구수",
                 options=list(displayMode="Markers",
                              region="KR",  
                              colorAxis="{colors: ['#FF0000', '#00FF00']}",
                              backgroundColor="lightblue"), chartid="EQ")

# In this plot, Korean is not working
# to fix this problem: 
header <- p$html$header 
header <- gsub("charset=utf-8", "charset=euc-kr", header) 
p$html$header <- header

plot(p)

