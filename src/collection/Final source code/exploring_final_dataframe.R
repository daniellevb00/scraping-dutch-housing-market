#####################################################
####Scraped municipality-level data Huizenzoeker#####
#####################################################

# GOAL: MAKING OUR SCRAPED MUNICIPALITY DATA A FUNCTIONAL DATASET. 

## Loading packages and data 
library(readr)
library(dplyr)
huizenzoeker <- read_csv("huizenzoeker_scraper_data.csv")
huizenzoeker<-huizenzoeker[2:15] #delete the first row with indices (not needed)
View(huizenzoeker)
summary(huizenzoeker)
head(huizenzoeker)

## 1: Transforming data
#Correcting classes
sapply(huizenzoeker,class) #most of the columns' values are seen as characters, while they should be numeric. 

huizenzoeker$province<-huizenzoeker$Province
huizenzoeker$city<-huizenzoeker$City

# QUADRANT 1
#Gemiddelde vraagprijs column
huizenzoeker$gem_vraagprijs<-gsub('[€]','', huizenzoeker$'Gem. vraagprijs') #rename column and remove euro signs
huizenzoeker$gem_vraagprijs<-parse_number(huizenzoeker$gem_vraagprijs) #make values numeric
huizenzoeker$gem_vraagprijs<-as.numeric(huizenzoeker$gem_vraagprijs)
#Perc verandering vraagprijs column 
huizenzoeker$perc_ver_vraagprijs<-gsub('[%]','',huizenzoeker$'%Δ Vraagprijs (t.o.v vorige maand)') #rename column and remove %
huizenzoeker$perc_ver_vraagprijs<-parse_number(huizenzoeker$perc_ver_vraagprijs) #make values numeric
huizenzoeker$perc_ver_vraagprijs<-as.numeric(huizenzoeker$perc_ver_vraagprijs)

# QUADRANT 2
#Verkochte woningen column
huizenzoeker$verk_woningen<-huizenzoeker$'Verkochte woningen' 
huizenzoeker$verk_woningen<-as.numeric(huizenzoeker$verk_woningen)
#Perc verandering verkochte woningen column 
huizenzoeker$perc_ver_verkocht<-gsub('[%]','',huizenzoeker$'%Δ Verkochte woningen (t.o.v vorige maand)')
huizenzoeker$perc_ver_verkocht<-parse_number(huizenzoeker$perc_ver_verkocht)
huizenzoeker$perc_ver_verkocht<-as.numeric(huizenzoeker$perc_ver_verkocht)

# QUADRANT 3
#Gemiddelde m2 prijs column
huizenzoeker$gem_m2prijs<-gsub('[€]','', huizenzoeker$'Gem. m2 prijs') 
huizenzoeker$gem_m2prijs<-parse_number(huizenzoeker$gem_m2prijs)
huizenzoeker$gem_m2prijs<-as.numeric(huizenzoeker$gem_m2prijs)
#Perc verandering gemiddelde m2 prijs column
huizenzoeker$perc_ver_m2prijs<-gsub('[%]','',huizenzoeker$'%Δ M2 prijs (t.o.v vorige maand)')
huizenzoeker$perc_ver_m2prijs<-parse_number(huizenzoeker$perc_ver_m2prijs)
huizenzoeker$perc_ver_m2prijs<-as.numeric(huizenzoeker$perc_ver_m2prijs)

# QUADRANT 4
#Gemiddelde percentage overboden column 
huizenzoeker$perc_overboden<-gsub('[%]','', huizenzoeker$'% Vraagprijs overboden') 
huizenzoeker$perc_overboden<-parse_number(huizenzoeker$perc_overboden)
huizenzoeker$perc_overboden<-as.numeric(huizenzoeker$perc_overboden)
#Perc verandering percentage overboden column 
huizenzoeker$perc_ver_overboden<-gsub('[%]','', huizenzoeker$'%Δ Overboden (t.o.v vorige maand)') 
huizenzoeker$perc_ver_overboden<-parse_number(huizenzoeker$perc_ver_overboden)
huizenzoeker$perc_ver_overboden<-as.numeric(huizenzoeker$perc_ver_overboden)

# BESTEEDBAAR INKOMEN
huizenzoeker$best_inkomen<-gsub('[€ ]','', huizenzoeker$'Besteedbaar inkomen (per huishouden)') 
huizenzoeker$best_inkomen<-parse_number(huizenzoeker$best_inkomen) 
huizenzoeker$best_inkomen<-as.numeric(huizenzoeker$best_inkomen)

# INWONERS
#Aantal inwoners column 
huizenzoeker$n_inwoners<-huizenzoeker$'Aantal inwoners'
#Perc populatie stijging of daling columns 
huizenzoeker$perc_pop_stijging<-gsub('[%]','', huizenzoeker$'% Populatie stijging') 
huizenzoeker$perc_pop_stijging<-parse_number(huizenzoeker$perc_pop_stijging)
huizenzoeker$perc_pop_stijging<-as.numeric(huizenzoeker$perc_pop_stijging)
huizenzoeker$perc_pop_daling<-gsub('[%]','', huizenzoeker$'% Populatie daling') 
huizenzoeker$perc_pop_daling<-parse_number(huizenzoeker$perc_pop_daling)
huizenzoeker$perc_pop_daling<-as.numeric(huizenzoeker$perc_pop_daling)

#Remove the old unnecessary columns
huizenzoeker_data2<-huizenzoeker%>%select(-c('Province', 'City', 'Gem. vraagprijs','%Δ Vraagprijs (t.o.v vorige maand)', 'Verkochte woningen','%Δ Verkochte woningen (t.o.v vorige maand)','Gem. m2 prijs','%Δ M2 prijs (t.o.v vorige maand)','% Vraagprijs overboden','%Δ Overboden (t.o.v vorige maand)','Besteedbaar inkomen (per huishouden)', '% Populatie stijging','% Populatie daling', 'Aantal inwoners'))
#Explore summary statistics dataset
View(huizenzoeker_data2)
summary(huizenzoeker_data2)

#Convert dataset to CSV (to import into Jupyter Notebooks)
write.csv(huizenzoeker_data2, "huizenzoeker_municipality.csv",row.names=FALSE)
