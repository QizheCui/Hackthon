#Italian tourism revenue


counts<-c(5945,4828,4033,2330,2414,2264,1674,431,318,482,880)

Date<-c("Aug 2019","Sep 2019","Oct 2019","Nov 2019","Dec 2019","Jan 2020","Feb 2020","Mar 2020","Apr 2020","May 2020","June 2020")

barplot(counts,names.arg = Date,xlab = "Month",ylab = "Revenue",main = "Tourism revenue of Italy",col = "blue",legend="EUR million")
