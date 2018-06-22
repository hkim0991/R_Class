install.packages("igraph") 
install.packages("network") 
install.packages("sna")
install.packages("visNetwork")
install.packages("threejs")
install.packages("networkD3")
install.packages("ndtv")

library(igraph)
library(network)
library(sna)
library(visNetwork)
library(threejs)
library(networkD3)
library(ndtv)

# Colors
plot(x=1:10, y=rep(5,10), pch=19, cex=3, col="dark red")
points(x=1:10, y=rep(6, 10), pch=19, cex=3, col="557799")  # cex=size
points(x=1:10, y=rep(4, 10), pch=19, cex=3, col=rgb(.25, .5, .3)) # pch=shape 

# Transparency - 'alpha'
plot(x=1:5, y=rep(5,5), pch=19, cex=20, col=rgb(.25, .5, .3, alpha=.3), xlim=c(0,6))

par(bg="gray40") # brackgroud color
col.tr <- grDevices::adjustcolor("557799", alpha=0.5) 
plot(x=1:5, y=rep(5,5), pch=19, cex=20, col=col.tr, xlim=c(0,6))
#dev.off()  - to remove the background color


colors()                          # List all named colors
grep("blue", colors(), value=T)   # Colors that have "blue" in the name

pal1 <- heat.colors(5, alpha=1)   #  5 colors from the heat palette, opaque
pal2 <- rainbow(5, alpha=.5)      #  5 colors from the rainbow palette + transparency level 0.5
plot(x=1:10, y=1:10, pch=19, cex=5, col=pal1)
plot(x=1:10, y=1:10, pch=19, cex=5, col=pal2)


palf <- colorRampPalette(c("gray70", "dark red", "orange"))  
plot(x=10:1, y=1:10, pch=19, cex=5, col=palf(10))  # 10 colors from palf palette


palf <- colorRampPalette(c(rgb(1,1,1, .2),rgb(.8,0,0, .7)), alpha=TRUE)
plot(x=10:1, y=1:10, pch=19, cex=5, col=palf(10))


install.packages("RColorBrewer")
library("RColorBrewer")
display.brewer.all()

display.brewer.pal(8, "Set3")
display.brewer.pal(8, "Spectral")