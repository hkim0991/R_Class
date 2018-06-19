## 01. Call the necessary libraries
library(ggplot2)
library(dplyr)
library(caret)
library(gridExtra)

## 02. Designate the working directory
getwd()
setwd(C:\\Users\\202-22\\Documents\\R\\R2_Project\\R_Studio_exercise)

## 03. Read the dataset
tr <- read.csv("C:\\Users\\202-22\\Documents\\R\\R2_Project\\R_Studio_exercise\\data\\Ad_tracking\\train_sample.csv", stringsAsFactors = F, na.string=c("", NA))
ts <- read.csv("C:\\Users\\202-22\\Documents\\R\\R2_Project\\R_Studio_exercise\\data\\Ad_tracking\\test.csv", stringsAsFactors = F)

## Plot
plot(tr$ip, main="IP")

## Q. ip 에 대해 아래와 같이 점 그래프를 작성해 보자.
## (2) 색은 is_attribute로 구분되어 진다.
## (3) alpha = 0.1로 지정했다. 점의 크기는 0.05이다.
## (4) x축의 축이름은 : index로 지정했다.

ggplot(tr,aes(x=rownames(tr), y=ip)) +
  geom_point(aes(color=tr$is_attributed, size=0.05, alpha=0.1)) + # alpha= 점의 진한 정도
  xlab("index")

ggplot(tr, aes(x=seq_along(ip), y=ip)) + 
  geom_point(aes(col=factor(is_attributed)), alpha=0.1, size=0.05) +
  scale_x_continuous(name="is_attributed") + 
  guides(col=guide_legend("is_attributed"))


p1 = ggplot(tr, aes(x=seq_along(app), y=app)) + 
  geom_point(aes(col=factor(is_attributed)), alpha=0.1, size=0.05) +
  scale_x_continuous(name="index") +            # label for x 
  guides(col=guide_legend("is_attributed")) +   # legend 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

p2 = ggplot(tr, aes(x=seq_along(os), y=os)) + 
  geom_point(aes(col=factor(is_attributed)), alpha=0.1, size=0.05) +
  scale_x_continuous(name="index") + 
  guides(col=guide_legend("is_attributed")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

p3 = ggplot(tr, aes(x=seq_along(channel), y=channel)) + 
  geom_point(aes(col=factor(is_attributed)), alpha=0.1, size=0.05) +
  scale_x_continuous(name="index") + 
  guides(col=guide_legend("is_attributed")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

p4 = ggplot(tr, aes(x=seq_along(device), y=device)) + 
  geom_point(aes(col=factor(is_attributed)), alpha=0.1, size=0.05) +
  scale_x_continuous(name="index") + 
  guides(col=guide_legend("is_attributed")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



grid.arrange(p1, p2, ncol=2)
grid.arrange(p3, p4, ncol=2)
#grid.arrange(p1, p2,p3,p4 ncol=2)


tr1 <- read.csv("C:\\Users\\202-22\\Documents\\R\\R2_Project\\R_Studio_exercise\\data\\Ad_tracking\\practice\\tr_5m_st4_1.csv", stringsAsFactors = F, na.string=c("", NA))

install.packages("sampling")
library(sampling)

set.seed(0)
idx1 = strata("is_attributed", size=c(7000, 3000), method="srswor", data=tr1)
tr11 <- getdata(tr1, idx1)
?getdata

dim(tr11)
head(tr11)
table(tr11$is_attributed)
tr11[,c(2,9)]
