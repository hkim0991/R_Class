install.packages('networkD3')
install.packages('d3Network')
library('networkD3')
library('d3Network')

source = c("A", "A", "A", "A", "B", "B", "B", "C", "C")
target = c("B", "C", "D", "J", "E", "F", "G", "H", "I")

networkData = data.frame(source, target)
networkData

simpleNetwork(networkData, fontFamily = "sans-serif")


group1 = c('철수', '철수', '철수', '수철', '수철','기수', '기수')
friends = c('영희', '민희', '수철', '수진', '희수', '영희', '수철')

facebook = data.frame(group1, friends)
facebook

simpleNetwork(facebook, height=800, width=600, fontFamily = "sans-serif", zoom=T)
