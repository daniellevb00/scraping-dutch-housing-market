##ODCM project - team 3 - Huizenzoeker.nl
##Script to make the scraped data work as a dataset: final_dataframe data
setwd("C:/Users/danie/OneDrive/Documents/Repositories/oDCM-project-team-3/src/collection")

##loading the exported data from Jupyter Notebook
library(readr)
library(dplyr)
huizenzoeker <- read_csv("huizenzoeker_scraper_data.csv")
View(huizenzoeker)
summary(huizenzoeker)
head(huizenzoeker)
huizenzoeker<-huizenzoeker%>%select(-'...1') #delete the first row with indices (not needed)
#UPDATE: I changed the thousands delimiters in Python to , and in R this removes the thousand delimiter, I dont know if we should add it for clarity? but this already returns better summary statistics I think)
#WARNING: the euro signs and delta's may change due to encoding erorrs when saving the file; if this happens, just replace the wierd signs with either the euro sign or the delta and youre fine
#Therefore try to save the file with Big5 encoding (then there likely isn't an error)

##checking classes variables
#correcting the classes of the variables
lapply(huizenzoeker, class) #initially they are all seen as characters, so we need to adjust this: 
#QUADRANT 1
#gemiddelde vraagprijs 
huizenzoeker$gem_vraagprijs<-huizenzoeker$'Gem. vraagprijs'
huizenzoeker$gem_vraagprijs<-gsub('[£á]','', huizenzoeker$gem_vraagprijs) #remove euro signs
huizenzoeker$gem_vraagprijs<-parse_number(huizenzoeker$gem_vraagprijs) #PROBLEM: 1 average above 1 million, is seen as 2000 instead of 2,000,000!! 
huizenzoeker$gem_vraagprijs<-as.numeric(huizenzoeker$gem_vraagprijs)
#verandering 
huizenzoeker$perc_ver_vraagprijs<-huizenzoeker$'%£G Vraagprijs (t.o.v vorige maand)'
huizenzoeker$perc_ver_vraagprijs<-gsub('[£á]','',huizenzoeker$perc_ver_vraagprijs)
huizenzoeker$perc_ver_vraagprijs<-parse_number(huizenzoeker$perc_ver_vraagprijs)
huizenzoeker$perc_ver_vraagprijs<-as.numeric(huizenzoeker$perc_ver_vraagprijs)

#QUADRANT 2
#verkochte woningen
huizenzoeker$verk_woningen<-huizenzoeker$'Verkochte woningen'
huizenzoeker$verk_woningen<-as.numeric(huizenzoeker$verk_woningen)
#verandering
huizenzoeker$perc_ver_verkocht<-huizenzoeker$'%£G Verkochte woningen (t.o.v vorige maand)'
huizenzoeker$perc_ver_verkocht<-gsub('[%]','',huizenzoeker$perc_ver_verkocht)
huizenzoeker$perc_ver_verkocht<-parse_number(huizenzoeker$perc_ver_verkocht)
huizenzoeker$perc_ver_verkocht<-as.numeric(huizenzoeker$perc_ver_verkocht)

#QUADRANT 3
#gemiddelde m2 prijs 
huizenzoeker$gem_m2prijs<-gsub('[£á]','', huizenzoeker$`Gem. m2 prijs`) #remove euro signs
huizenzoeker$gem_m2prijs<-parse_number(huizenzoeker$gem_m2prijs)
huizenzoeker$gem_m2prijs<-as.numeric(huizenzoeker$gem_m2prijs)
#verandering
huizenzoeker$perc_ver_m2prijs<-huizenzoeker$'%£G M2 prijs (t.o.v vorige maand)'
huizenzoeker$perc_ver_m2prijs<-gsub('[%]','',huizenzoeker$perc_ver_m2prijs)
huizenzoeker$perc_ver_m2prijs<-parse_number(huizenzoeker$perc_ver_m2prijs)
huizenzoeker$perc_ver_m2prijs<-as.numeric(huizenzoeker$perc_ver_m2prijs)

#QUADRANT 4
#percentage overboden
huizenzoeker$perc_overboden<-gsub('[%]','', huizenzoeker$`% Vraagprijs overboden`) 
huizenzoeker$perc_overboden<-parse_number(huizenzoeker$perc_overboden)
huizenzoeker$perc_overboden<-as.numeric(huizenzoeker$perc_overboden)
#verandering
huizenzoeker$perc_ver_overboden<-huizenzoeker$'%£G Overboden (t.o.v vorige maand)'
huizenzoeker$perc_ver_overboden<-gsub('[%]','', huizenzoeker$perc_ver_overboden) 
huizenzoeker$perc_ver_overboden<-parse_number(huizenzoeker$perc_ver_overboden)
huizenzoeker$perc_ver_overboden<-as.numeric(huizenzoeker$perc_ver_overboden)

#BESTEEDBAAR INKOMEN
huizenzoeker$best_inkomen<-gsub('[£á]','', huizenzoeker$'Besteedbaar inkomen (per huishouden)') #remove euro signs
huizenzoeker$best_inkomen<-parse_number(huizenzoeker$best_inkomen) #UPDATE: HERE NOW RETURNS ERROR: 3 PARSING FAILURES: because here are NA's
huizenzoeker$best_inkomen<-as.numeric(huizenzoeker$best_inkomen)

#INWONERS
#aantal inwoners
huizenzoeker$n_inwoners<-huizenzoeker$'Aantal inwoners'
#populatie stijging/daling
huizenzoeker$perc_pop_stijging<-huizenzoeker$'% Populatie stijging'
huizenzoeker$perc_pop_stijging<-gsub('[%]','', huizenzoeker$perc_pop_stijging) 
huizenzoeker$perc_pop_stijging<-parse_number(huizenzoeker$perc_pop_stijging)
huizenzoeker$perc_pop_stijging<-as.numeric(huizenzoeker$perc_pop_stijging)
huizenzoeker$perc_pop_daling<-huizenzoeker$'% Populatie daling'
huizenzoeker$perc_pop_daling<-gsub('[%]','', huizenzoeker$perc_pop_daling) 
huizenzoeker$perc_pop_daling<-parse_number(huizenzoeker$perc_pop_daling)
huizenzoeker$perc_pop_daling<-as.numeric(huizenzoeker$perc_pop_daling)

#now we remove the old columns that we don't need anymore
huizenzoeker_data2<-huizenzoeker%>%select(-c('Gem. vraagprijs','%£G Vraagprijs (t.o.v vorige maand)', 'Verkochte woningen','%£G Verkochte woningen (t.o.v vorige maand)','Gem. m2 prijs','%£G M2 prijs (t.o.v vorige maand)','% Vraagprijs overboden','%£G Overboden (t.o.v vorige maand)','Besteedbaar inkomen (per huishouden)', '% Populatie stijging','% Populatie daling', 'Aantal inwoners'))

#now we can explore the summary statistics for all our variables for the province Noord-Brabant
View(huizenzoeker_data2)
summary(huizenzoeker_data2)
#REMARKABLE FINDINGS (STILL TO SOLVE MAYBE?):
#Eemsdelta in groningen has no inwoners, inwoners = 0 ?? strange. 
#Why are there some NA's in besteedbaar_inkomen, is it not given for some municipalities? 

#now convert the dataframe to a CSV file to import it into Jupyter to there see the summary statistics too
write.csv(huizenzoeker_data2, "C:\\Users\\danie\\OneDrive\\Documents\\Repositories\\oDCM-project-team-3\\src\\collection\\huizenzoeker_data2.csv",row.names=FALSE)

##Now we can use this dataset to visualise our scraped data and create graphs if we want. 






