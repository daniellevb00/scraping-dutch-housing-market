##ODCM project - team 3 - Huizenzoeker.nl
##Script to make the scraped data work as a dataset (here for the data from all municipalities in Noord-Brabant)

##loading the exported data from Jupyter Notebook
library(readr)
library(dplyr)
Huizenzoeker_NB <- read_csv("Huizenzoeker_NB_data1.csv")
View(Huizenzoeker_NB)

#save as new dataset
huizen_NB<-Huizenzoeker_NB
View(huizen_NB)
summary(huizen_NB)
head(huizen_NB)

#PROBLEM: Huizenzoeker.nl uses '.' to indicate both decimals and thousand limiters; so for R it isn't clear whether its 2000 or 2.00 e.g. 
#(PROBLEM FIXED :), I changed the thousands delimiters in Python to , and in R this removes the thousand delimiter, I dont know if we should add it for clarity? but this already returns better summary statistics I think)

##checking classes variables
#correcting the classes of the variables
lapply(huizen_NB, class) #initially they are all seen as characters, so we need to adjust this: 
#QUADRANT 1
#gemiddelde vraagprijs 
huizen_NB$gem_vraagprijs<-huizen_NB$'Gem. vraagprijs'
huizen_NB$gem_vraagprijs<-gsub('[???]','', huizen_NB$gem_vraagprijs) #remove euro signs
huizen_NB$gem_vraagprijs<-parse_number(huizen_NB$gem_vraagprijs) #PROBLEM: 1 average above 1 million, is seen as 2000 instead of 2,000,000!! 
huizen_NB$gem_vraagprijs<-as.numeric(huizen_NB$gem_vraagprijs)
#verandering 
huizen_NB$perc_ver_vraagprijs<-huizen_NB$'%?? Vraagprijs (t.o.v vorige maand)'
huizen_NB$perc_ver_vraagprijs<-gsub('[???]','',huizen_NB$perc_ver_vraagprijs)
huizen_NB$perc_ver_vraagprijs<-parse_number(huizen_NB$perc_ver_vraagprijs)
huizen_NB$perc_ver_vraagprijs<-as.numeric(huizen_NB$perc_ver_vraagprijs)

#QUADRANT 2
#verkochte woningen
huizen_NB$verk_woningen<-huizen_NB$'Verkochte woningen'
huizen_NB$verk_woningen<-as.numeric(huizen_NB$verk_woningen)
#verandering
huizen_NB$perc_ver_verkocht<-huizen_NB$'%?? Verkocht (t.o.v vorige maand)'
huizen_NB$perc_ver_verkocht<-gsub('[%]','',huizen_NB$perc_ver_verkocht)
huizen_NB$perc_ver_verkocht<-parse_number(huizen_NB$perc_ver_verkocht)
huizen_NB$perc_ver_verkocht<-as.numeric(huizen_NB$perc_ver_verkocht)

#QUADRANT 3
#gemiddelde m2 prijs 
huizen_NB$gem_m2prijs<-gsub('[???]','', huizen_NB$`Gem. m2 prijs`) #remove euro signs
huizen_NB$gem_m2prijs<-parse_number(huizen_NB$gem_m2prijs)
huizen_NB$gem_m2prijs<-as.numeric(huizen_NB$gem_m2prijs)
#verandering
huizen_NB$perc_ver_m2prijs<-huizen_NB$'%?? M2 prijs (t.o.v vorige maand)'
huizen_NB$perc_ver_m2prijs<-gsub('[%]','',huizen_NB$perc_ver_m2prijs)
huizen_NB$perc_ver_m2prijs<-parse_number(huizen_NB$perc_ver_m2prijs)
huizen_NB$perc_ver_m2prijs<-as.numeric(huizen_NB$perc_ver_m2prijs)

#QUADRANT 4
#percentage overboden
huizen_NB$perc_overboden<-gsub('[%]','', huizen_NB$`% Vraagprijs overboden`) 
huizen_NB$perc_overboden<-parse_number(huizen_NB$perc_overboden)
huizen_NB$perc_overboden<-as.numeric(huizen_NB$perc_overboden)
#verandering
huizen_NB$perc_ver_overboden<-huizen_NB$'%?? Overboden (t.o.v vorige maand)'
huizen_NB$perc_ver_overboden<-gsub('[%]','', huizen_NB$perc_ver_overboden) 
huizen_NB$perc_ver_overboden<-parse_number(huizen_NB$perc_ver_overboden)
huizen_NB$perc_ver_overboden<-as.numeric(huizen_NB$perc_ver_overboden)

#BESTEEDBAAR INKOMEN
huizen_NB$best_inkomen<-gsub('[???]','', huizen_NB$'Besteedbaar inkomen (per huishouden)') #remove euro signs
huizen_NB$best_inkomen<-parse_number(huizen_NB$best_inkomen)
huizen_NB$best_inkomen<-as.numeric(huizen_NB$best_inkomen)

#INWONERS
#add code if finished

#now we remove the old columns that we don't need anymore
huizen_NB1<-huizen_NB%>%select(-c('Gem. vraagprijs','%?? Vraagprijs (t.o.v vorige maand)', 'Verkochte woningen','%?? Verkocht (t.o.v vorige maand)','Gem. m2 prijs','%?? M2 prijs (t.o.v vorige maand)','% Vraagprijs overboden','%?? Overboden (t.o.v vorige maand)','Besteedbaar inkomen (per huishouden)'))

#now we can explore the summary statistics for all our variables for the province Noord-Brabant
View(huizen_NB1)
summary(huizen_NB1)
#now convert the dataframe to a CSV file to import it into Jupyter to there see the summary statistics too
write.csv(huizen_NB1, "C:\\Users\\danie\\OneDrive\\Documents\\Repositories\\oDCM-project-team-3\\src\\collection\\huizen_NB1.csv",row.names=FALSE)

##Now we can use this dataset to visualise our scraped data and create graphs if we want. 






