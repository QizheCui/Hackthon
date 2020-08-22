#Manipulating data with Europe 5 countries
#data sourselink: https://www.statista.com/statistics/1115043/coronavirus-deaths-timeline-in-the-eu-5/
Europe<-read_xlsx("Europe 5 countries.xlsx",sheet = "Data")
Europe<-data.table(Europe)


Europe[,3:6]<-lapply(Europe[,3:6],as.numeric)

Europe<-na.omit(Europe)

colnames(Europe)[1]<-"Date" #Change the first column name to date

day<-as.Date("2020-08-20")-163:0


#Europe$Date<-lapply(Europe$Date, function(x) strptime(x,"%B %d"))

#we can change the date format as abbreviation if we want 

p<-ggplot(data = Europe,aes(x=day,color=Countries))+
  geom_line(aes(y=France,color="France"))+
  geom_line(aes(y=Germany,color="Germany"))+
  geom_line(aes(y=Italy,color="Italy"))+
  geom_line(aes(y=`United Kingdom`,color="United Kingdom"))+
  geom_line(aes(y=Spain,color="Spain"))+
  scale_x_date(date_labels = "%b %d",date_breaks = "3 weeks",date_minor_breaks = "1 week")+
  xlab("Date")+ylab("Cumulative Death")+
  scale_y_continuous(limits=c(0,50000),breaks = seq(0,50000,5000))+
  theme(axis.text.x = element_text(angle=45,hjust = 1)+
          theme_minimal()

#we use axis.test.x = element_text(angle=45)
  





