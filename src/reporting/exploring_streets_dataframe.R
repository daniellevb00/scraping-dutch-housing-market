#####################################################
####Scraped streets-level data Huizenzoeker##########
#####################################################

# GOAL: MAKING OUR SCRAPED STREETS DATA A FUNCTIONAL DATASET. 

## Loading packages and data 
library(readr)
library(dplyr)
huizenzoeker2 <- read_csv('../../data/huizenzoeker_street_data.csv')
View(huizenzoeker2)
huizenzoeker2<-huizenzoeker2[2:13] #delete the first row with indices (not needed)
summary(huizenzoeker2)
head(huizenzoeker2)

## 1: Transforming data
#Correcting classes
sapply(huizenzoeker2,class) #here most columns are already accurate, except for besteedbaar inkomen 

#Modifying column names
huizenzoeker2$straat<-huizenzoeker2$Straat
huizenzoeker2$woonplaats<-huizenzoeker2$Woonplaats
huizenzoeker2$n_woningen<-huizenzoeker2$'Aantal woningen'
huizenzoeker2$gem_bouwjaar<-huizenzoeker2$'Gem. bouwjaar'
huizenzoeker2$gem_woon_m2<-huizenzoeker2$'Gem. woonoppervlakte (m2)'
huizenzoeker2$bioscoop_m<-huizenzoeker2$'Bioscoop (m)'
huizenzoeker2$treinstation_m<-huizenzoeker2$'Treinstation (m)'
huizenzoeker2$busstation_m<-huizenzoeker2$'Busstation (m)'
huizenzoeker2$school_m<-huizenzoeker2$'School (m)'
huizenzoeker2$kinderopvang_m<-huizenzoeker2$'Kinderopvang (m)'
huizenzoeker2$supermarkt_m<-huizenzoeker2$'Supermarkt (m)'

# BESTEEDBAAR INKOMEN
huizenzoeker2$best_inkomen<-gsub('[£á ]','', huizenzoeker2$'Besteedbaar inkomen') 
huizenzoeker2$best_inkomen<-parse_number(huizenzoeker2$best_inkomen) 
huizenzoeker2$best_inkomen<-as.numeric(huizenzoeker2$best_inkomen)

#Remove the old unnecessary columns
huizenzoeker_data3<-huizenzoeker2%>%select(-c('Straat', 'Woonplaats','Aantal woningen', 'Gem. bouwjaar','Gem. woonoppervlakte (m2)', 'Bioscoop (m)','Treinstation (m)','Busstation (m)', 'School (m)', 'Kinderopvang (m)','Supermarkt (m)', 'Besteedbaar inkomen'))
#Explore summary statistics dataset
View(huizenzoeker_data3)
summary(huizenzoeker_data3)

#Convert dataset to CSV (to import into Jupyter Notebooks)
write.csv(huizenzoeker_data3, "huizenzoeker_streets.csv",row.names=FALSE)

