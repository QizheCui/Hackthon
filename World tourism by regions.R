library(readxl)
library(data.table)
library(dplyr)
library(ggplot2)


#Source:https://ourworldindata.org/tourism
l<-read.csv("international-tourist-arrivals-by-world-region.csv")

l<-l[,-2]

colnames(l)<-c("Region","Year","Arrivals")

l$Arrivals<-l$Arrivals / 1000000

Africa<-filter(l,l$Region=="Africa")

Americas<-filter(l,l$Region=="Americas")

AP<-filter(l,l$Region=="Asia & Pacific")

Europe<-filter(l,l$Region=="Europe")

ME<-filter(l,l$Region=="Middle East")


ggplot(data=ME,aes(x=Year))+
  geom_line(aes(y=Africa$Arrivals,color="Africa"),size=1.5)+
  geom_line(aes(y=Americas$Arrivals,color="Americas"),size=1.5)+
  geom_line(aes(y=AP$Arrivals,color="Asia & Pacific"),size=1.5)+
  geom_line(aes(y=Europe$Arrivals,color="Europe"),size=1.5)+
  geom_line(aes(y=ME$Arrivals,color="Middle East"),size=1.5)+
  xlab("Year")+
  ylab("International Arrivals by million")+
  scale_color_manual(name="Countries",values = c("Africa"="red","Americas"="yellow","Asia & Pacific"="green","Europe"="blue","Middle East"="black"))+
  theme_minimal()+
  theme(axis.text.x = element_text(angle=45,hjust = 1))
  

  
  

