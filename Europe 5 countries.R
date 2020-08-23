#Manipulating data with Europe 5 countries
#data sourselink: https://www.statista.com/statistics/1115043/coronavirus-deaths-timeline-in-the-eu-5/
library(readxl)
library(data.table)
library(dplyr)
library(ggplot2)

Europe<-read_xlsx("Europe 5 countries.xlsx",sheet = "Data",na="-")


Europe[,-1][is.na(Europe[,-1])]<-0 #Assign NA to 0
Europe<-Europe[1:188,]


colnames(Europe)[1]<-"Date" #Change the first column name to date

day<-as.Date("2020-08-20")-(nrow(Europe)-1):0



#Europe$Date<-lapply(Europe$Date, function(x) strptime(x,"%B %d"))

#we can change the date format as abbreviation if we want 

p<-ggplot(data = Europe,aes(x=day,color=Countries),size=2)+
  geom_line(aes(y=France,color="France"),size=2)+
  geom_line(aes(y=Germany,color="Germany"),size=2)+
  geom_line(aes(y=Italy,color="Italy"),size=2)+
  geom_line(aes(y=`United Kingdom`,color="United Kingdom"),size=2)+
  geom_line(aes(y=Spain,color="Spain"),size=2)+
  scale_x_date(date_labels = "%b %d",date_breaks = "2 weeks",date_minor_breaks = "1 week")+
  xlab("Date")+ylab("Cumulative Death")+
  scale_y_continuous(limits=c(0,50000),breaks = seq(0,50000,5000))+
  theme_minimal()+
  theme(axis.text.x = element_text(angle=45,hjust = 1))

#we use axis.test.x = element_text(angle=45)
  





