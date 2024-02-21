getwd()
setwd("C:/Users/91902/Desktop/Documents/Nuleran IIM Rohtak DA/Group Project 2")
getwd()
covid19<-read.csv("covid_19_india.csv")
library(VIM)
aggr(covid19)
library(stringr)
covid19$ConfirmedIndianNational <- str_replace_all(covid19$ConfirmedIndianNational,'-','0')
covid19$ConfirmedForeignNational <- str_replace_all(covid19$ConfirmedForeignNational,'-','0')
View(covid19)
library(dplyr)
View(covid19)
covid19 %>% select(Date,Time,State.UnionTerritory,Cured,Deaths,Confirmed) -> covid19
covid19 %>% rename(State.Union=State.UnionTerritory,Sum.of.Confirmed=Confirmed) -> covid19
covid19 %>% filter(Date=="24-06-2021") -> latest_cases
latest_cases %>% arrange(desc(Sum.of.Confirmed)) -> latest_cases_descending
View(latest_cases_descending)
latest_cases_descending[0:5,] -> Top_5_cases
View(Top_5_cases)
library(ggplot2)
ggplot(data = Top_5_cases,aes(x=State.Union,y=Sum.of.Confirmed)) + geom_bar(stat = "identity")
ggplot(data = Top_5_cases,aes(x=State.Union,y=Sum.of.Confirmed,fill=State.Union))+geom_bar(stat = "identity")
ggplot(data = Top_5_cases,aes(x=reorder(State.Union,Sum.of.Confirmed),y=Sum.of.Confirmed,fill=State.Union))+geom_bar(stat = "identity")
ggplot(data = Top_5_cases,aes(x=reorder(State.Union,-Sum.of.Confirmed),y=Sum.of.Confirmed,fill=State.Union))+geom_bar(stat = "identity")      
              