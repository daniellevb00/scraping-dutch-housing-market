##ODCM project - team 3 - Huizenzoeker.nl
##Script to make the scraped data work as a dataset: province_dataframe
setwd("C:/Users/danie/OneDrive/Documents/Repositories/ODCM-project-team-3/src/collection")

##loading the exported data from Jupyter Notebook
library(readr)
library(dplyr)
huizenzoeker1 <- read_csv("huizenzoeker_province_data.csv")
View(huizenzoeker1)
summary(huizenzoeker1)
head(huizenzoeker1)
#UPDATE: I changed the thousands delimiters in Python to , and in R this removes the thousand delimiter, I dont know if we should add it for clarity? but this already returns better summary statistics I think)

##checking classes variables
#correcting the classes of the variables
lapply(huizenzoeker1, class) #initially they are all seen as characters, so we need to adjust this: 
#QUADRANT 1
#gemiddelde vraagprijs 
huizenzoeker1$gem_vraagprijs<-huizenzoeker1$'Gem. vraagprijs'
huizenzoeker1$gem_vraagprijs<-gsub('[£á]','', huizenzoeker1$gem_vraagprijs) #remove euro signs
huizenzoeker1$gem_vraagprijs<-parse_number(huizenzoeker1$gem_vraagprijs) #PROBLEM: 1 average above 1 million, is seen as 2000 instead of 2,000,000!! 
huizenzoeker1$gem_vraagprijs<-as.numeric(huizenzoeker1$gem_vraagprijs)
#verandering 
huizenzoeker1$perc_ver_vraagprijs<-huizenzoeker1$'%£G Vraagprijs (t.o.v vorige maand)'
huizenzoeker1$perc_ver_vraagprijs<-gsub('[£á]','',huizenzoeker1$perc_ver_vraagprijs)
huizenzoeker1$perc_ver_vraagprijs<-parse_number(huizenzoeker1$perc_ver_vraagprijs)
huizenzoeker1$perc_ver_vraagprijs<-as.numeric(huizenzoeker1$perc_ver_vraagprijs)

#QUADRANT 2
#verkochte woningen
huizenzoeker1$verk_woningen<-huizenzoeker1$'Verkochte woningen'
huizenzoeker1$verk_woningen<-as.numeric(huizenzoeker1$verk_woningen)
#verandering
huizenzoeker1$perc_ver_verkocht<-huizenzoeker1$'%£G Verkochte woningen (t.o.v vorige maand)'
huizenzoeker1$perc_ver_verkocht<-gsub('[%]','',huizenzoeker1$perc_ver_verkocht)
huizenzoeker1$perc_ver_verkocht<-parse_number(huizenzoeker1$perc_ver_verkocht)
huizenzoeker1$perc_ver_verkocht<-as.numeric(huizenzoeker1$perc_ver_verkocht)

#QUADRANT 3
#gemiddelde m2 prijs 
huizenzoeker1$gem_m2prijs<-gsub('[£á]','', huizenzoeker1$`Gem. m2 prijs`) #remove euro signs
huizenzoeker1$gem_m2prijs<-parse_number(huizenzoeker1$gem_m2prijs)
huizenzoeker1$gem_m2prijs<-as.numeric(huizenzoeker1$gem_m2prijs)
#verandering
huizenzoeker1$perc_ver_m2prijs<-huizenzoeker1$'%£G M2 prijs (t.o.v vorige maand)'
huizenzoeker1$perc_ver_m2prijs<-gsub('[%]','',huizenzoeker1$perc_ver_m2prijs)
huizenzoeker1$perc_ver_m2prijs<-parse_number(huizenzoeker1$perc_ver_m2prijs)
huizenzoeker1$perc_ver_m2prijs<-as.numeric(huizenzoeker1$perc_ver_m2prijs)

#QUADRANT 4
#percentage overboden
huizenzoeker1$perc_overboden<-gsub('[%]','', huizenzoeker1$`% Vraagprijs overboden`) 
huizenzoeker1$perc_overboden<-parse_number(huizenzoeker1$perc_overboden)
huizenzoeker1$perc_overboden<-as.numeric(huizenzoeker1$perc_overboden)
#verandering
huizenzoeker1$perc_ver_overboden<-huizenzoeker1$'%£G Overboden (t.o.v vorige maand)'
huizenzoeker1$perc_ver_overboden<-gsub('[%]','', huizenzoeker1$perc_ver_overboden) 
huizenzoeker1$perc_ver_overboden<-parse_number(huizenzoeker1$perc_ver_overboden)
huizenzoeker1$perc_ver_overboden<-as.numeric(huizenzoeker1$perc_ver_overboden)

#BESTEEDBAAR INKOMEN
huizenzoeker1$best_inkomen<-gsub('[£á]','', huizenzoeker1$'Besteedbaar inkomen (per huishouden)') #remove euro signs
huizenzoeker1$best_inkomen<-parse_number(huizenzoeker1$best_inkomen) #UPDATE: HERE NOW RETURNS ERROR: 3 PARSING FAILURES: because here are NA's
huizenzoeker1$best_inkomen<-as.numeric(huizenzoeker1$best_inkomen)

#INWONERS
#add code if finished

#now we remove the old columns that we don't need anymore
huizenzoeker_province_data1<-huizenzoeker1%>%select(-c('Gem. vraagprijs','%£G Vraagprijs (t.o.v vorige maand)', 'Verkochte woningen','%£G Verkochte woningen (t.o.v vorige maand)','Gem. m2 prijs','%£G M2 prijs (t.o.v vorige maand)','% Vraagprijs overboden','%£G Overboden (t.o.v vorige maand)','Besteedbaar inkomen (per huishouden)'))

#now we can explore the summary statistics for all our variables for the province Noord-Brabant
View(huizenzoeker_province_data1)
summary(huizenzoeker_province_data1)
#now convert the dataframe to a CSV file to import it into Jupyter to there see the summary statistics too
write.csv(huizenzoeker_province_data1, "C:\\Users\\danie\\OneDrive\\Documents\\Repositories\\oDCM-project-team-3\\src\\collection\\huizenzoeker_province_data1.csv",row.names=FALSE)

##Now we can use this dataset to visualise our scraped data and create graphs if we want. 