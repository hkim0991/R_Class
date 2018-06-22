
## 
# Load package
library(networkD3)

# Create fake data
src <- c("A", "A", "A", "A",
         "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)

# Plot
simpleNetwork(networkData)


## forceNetwork
# Load data
data(MisLinks)
data(MisNodes)

MisLinks
MisNodes


# > MisNodes
#                name   group   size
# 1             Myriel     1     15
# 2           Napoleon     1     20
# 3    Mlle.Baptistine     1     23

# Source
# character string naming the network source variable in the Links data frame.


# Target
# character string naming the network target variable in the Links data frame.



# Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8, zoom= T)


# Load energy projection data
URL <- paste0(
  "https://cdn.rawgit.com/christophergandrud/networkD3/",
  "master/JSONdata/energy.json")

# data : https://cdn.rawgit.com/christophergandrud/networkD3/master/JSONdata/energy.json
# 

Energy <- jsonlite::fromJSON(URL)
Energy

#
#$nodes
#                                 name
#1                Agricultural 'waste'
#2                      Bio-conversion
#3                              Liquid
#4                              Losses

# $links
#     source target   value
#1       0      1     124.729
#2       1      2       0.597
#3       1      3      26.862
#4       1      4     280.322


# Plot
sankeyNetwork(Links = Energy$links, Nodes = Energy$nodes, Source = "source",
              Target = "target", Value = "value", NodeID = "name",
              units = "TWh", fontSize = 12, nodeWidth = 30)

# radialNetwork
URL <- paste0(
  "https://cdn.rawgit.com/christophergandrud/networkD3/",
  "master/JSONdata//flare.json")

## Convert to list format
Flare <- jsonlite::fromJSON(URL, simplifyDataFrame = FALSE)
Flare
search()
# Use subset of data for more readable diagram
Flare$children = Flare$children[1:3]

radialNetwork(List = Flare, fontSize = 10, opacity = 0.9)

##
diagonalNetwork(List = Flare, fontSize = 10, opacity = 0.9)


## dendroNetwork
hc <- hclust(dist(USArrests), "ave")

dendroNetwork(hc, height = 600)


### REF : https://christophergandrud.github.io/networkD3/
