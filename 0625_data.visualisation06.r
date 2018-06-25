install.packages('RgoogleMaps')
library(ggplot2)
library(RgoogleMaps)
library(ggmap)
library(stringi)
install.packages('stringi') # to correct the error of ggmap installation


# Top 10 touristic area in Seoul

# 1. 동대문 쇼핑타운 서울 중구 장충단로 253
# 2. 명동            서울 중구 명동8길 27
# 3. 경복궁          서울 종로구 사직로 161
# 4. 남산서울타워    서울 용산구 남산공원길 105
# 5. 인사동길        서울 종로구 인사동길 39-1
# 6. 남대문시장      서울 중구 남대문시장4길 21

names <- c('1. 동대문 쇼핑타운', 
           '2. 명동', 
           '3. 경복궁', 
           '4. 남산서울타워', 
           '5. 인사동길', 
           '6. 남대문시장')

addr <- c("서울 중구 장충단로 253",
          "서울 중구 명동8길 27",
          "서울 종로구 사직로 161",
          "서울 용산구 남산공원길 105",
          "서울 종로구 인사동길 39-1",
          "서울 중구 남대문시장4길 21")

str(addr)
gc <- geocode(enc2utf8(addr)) # geocode: converting the address to lap, lon information
gc

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df


cen <- c(mean(df$lon), mean(df$lat))
cen


map = get_googlemap(center=cen, maptype='roadmap', zoom=13, marker=gc)

ggmap(map, fullpage=TRUE) + # fullpage=TRUE: without axis, it shows the map bigger
  geom_text(data=df, aes(x=lon, y=lat+0.006, label=name), size=3, color='blue')


