##ODCM project - team 3 - Huizenzoeker.nl
##Script to make the scraped data work as a dataset: province_dataframe
setwd("C:/Users/danie/OneDrive/Documents/Repositories/ODCM-project-team-3/src/collection")

##loading the exported data from Jupyter Notebook
library(readr)
library(dplyr)
huizenzoeker1 <- read_csv("huizenzoeker_province_data.csv")
huizenzoeker1 <- huizenzoeker_province_data
View(huizenzoeker1)
summary(huizenzoeker1)
head(huizenzoeker1)
huizenzoeker1<-huizenzoeker1[2:13] #delete the first row with indices (not needed)
#UPDATE: I changed the thousands delimiters in Python to , and in R this removes the thousand delimiter, I dont know if we should add it for clarity? but this already returns better summary statistics I think)
#SAME WARNING HERE: SAVE WITH BIG5 ENCODING SUCH THAT EURO SIGNS AND DELTA'S DON'T GET MIXED UP
#REMARKABLE: %POPULATIE DALING IS EMPTY, AS FOR EVERY PROVINCE THE NUMBER OF INHABITANTS HAS INCREASED (so we can get rid of this column)


##checking classes variables
#correcting the classes of the variables
lapply(huizenzoeker1, class) #initially they are all seen as characters, so we need to adjust this: 
#QUADRANT 1
#gemiddelde vraagprijs 
huizenzoeker1$gem_vraagprijs<-huizenzoeker1$'Gem. vraagprijs'
huizenzoeker1$gem_vraagprijs<-gsub('[€]','', huizenzoeker1$gem_vraagprijs) #remove euro signs
huizenzoeker1$gem_vraagprijs<-parse_number(huizenzoeker1$gem_vraagprijs) #PROBLEM: 1 average above 1 million, is seen as 2000 instead of 2,000,000!! 
huizenzoeker1$gem_vraagprijs<-as.numeric(huizenzoeker1$gem_vraagprijs)
#verandering 
huizenzoeker1$perc_ver_vraagprijs<-huizenzoeker1$'%Δ Vraagprijs (t.o.v vorige maand)'
huizenzoeker1$perc_ver_vraagprijs<-gsub('[%]','',huizenzoeker1$perc_ver_vraagprijs)
huizenzoeker1$perc_ver_vraagprijs<-parse_number(huizenzoeker1$perc_ver_vraagprijs)
huizenzoeker1$perc_ver_vraagprijs<-as.numeric(huizenzoeker1$perc_ver_vraagprijs)

#QUADRANT 2
#verkochte woningen
huizenzoeker1$verk_woningen<-huizenzoeker1$'Verkochte woningen'
huizenzoeker1$verk_woningen<-as.numeric(huizenzoeker1$verk_woningen)
#verandering
huizenzoeker1$perc_ver_verkocht<-huizenzoeker1$'%Δ Verkochte woningen (t.o.v vorige maand)'
huizenzoeker1$perc_ver_verkocht<-gsub('[%]','',huizenzoeker1$perc_ver_verkocht)
huizenzoeker1$perc_ver_verkocht<-parse_number(huizenzoeker1$perc_ver_verkocht)
huizenzoeker1$perc_ver_verkocht<-as.numeric(huizenzoeker1$perc_ver_verkocht)

#QUADRANT 3
#gemiddelde m2 prijs 
huizenzoeker1$gem_m2prijs<-gsub('[€]','', huizenzoeker1$`Gem. m2 prijs`) #remove euro signs
huizenzoeker1$gem_m2prijs<-parse_number(huizenzoeker1$gem_m2prijs)
huizenzoeker1$gem_m2prijs<-as.numeric(huizenzoeker1$gem_m2prijs)
#verandering
huizenzoeker1$perc_ver_m2prijs<-huizenzoeker1$'%Δ M2 prijs (t.o.v vorige maand)'
huizenzoeker1$perc_ver_m2prijs<-gsub('[%]','',huizenzoeker1$perc_ver_m2prijs)
huizenzoeker1$perc_ver_m2prijs<-parse_number(huizenzoeker1$perc_ver_m2prijs)
huizenzoeker1$perc_ver_m2prijs<-as.numeric(huizenzoeker1$perc_ver_m2prijs)

#QUADRANT 4
#percentage overboden
huizenzoeker1$perc_overboden<-gsub('[%]','', huizenzoeker1$`% Vraagprijs overboden`) 
huizenzoeker1$perc_overboden<-parse_number(huizenzoeker1$perc_overboden)
huizenzoeker1$perc_overboden<-as.numeric(huizenzoeker1$perc_overboden)
#verandering
huizenzoeker1$perc_ver_overboden<-huizenzoeker1$'%Δ Overboden (t.o.v vorige maand)'
huizenzoeker1$perc_ver_overboden<-gsub('[%]','', huizenzoeker1$perc_ver_overboden) 
huizenzoeker1$perc_ver_overboden<-parse_number(huizenzoeker1$perc_ver_overboden)
huizenzoeker1$perc_ver_overboden<-as.numeric(huizenzoeker1$perc_ver_overboden)

#BESTEEDBAAR INKOMEN
huizenzoeker1$best_inkomen<-gsub('[€]','', huizenzoeker1$'Besteedbaar inkomen (per huishouden)') #remove euro signs
huizenzoeker1$best_inkomen<-parse_number(huizenzoeker1$best_inkomen) #UPDATE: HERE NOW RETURNS ERROR: 3 PARSING FAILURES: because here are NA's
huizenzoeker1$best_inkomen<-as.numeric(huizenzoeker1$best_inkomen)

#INWONERS
#aantal inwoners
huizenzoeker1$n_inwoners<-huizenzoeker1$'Aantal inwoners'
#populatie stijging/daling
huizenzoeker1$perc_pop_stijging<-huizenzoeker1$'% Populatie stijging'
huizenzoeker1$perc_pop_stijging<-gsub('[%]','', huizenzoeker1$perc_pop_stijging) 
huizenzoeker1$perc_pop_stijging<-parse_number(huizenzoeker1$perc_pop_stijging)
huizenzoeker1$perc_pop_stijging<-as.numeric(huizenzoeker1$perc_pop_stijging)
#Here we leave out the perc pop daling because it only contains NA's (not valuable)

#now we remove the old columns that we don't need anymore
huizenzoeker_province_data1<-huizenzoeker1%>%select(-c('Gem. vraagprijs','%Δ Vraagprijs (t.o.v vorige maand)', 'Verkochte woningen','%Δ Verkochte woningen (t.o.v vorige maand)','Gem. m2 prijs','%Δ M2 prijs (t.o.v vorige maand)','% Vraagprijs overboden','%Δ Overboden (t.o.v vorige maand)','Besteedbaar inkomen (per huishouden)', 'Aantal inwoners', '% Populatie stijging'))

#now we can explore the summary statistics for all our variables for the province Noord-Brabant
View(huizenzoeker_province_data1)
summary(huizenzoeker_province_data1)
#now convert the dataframe to a CSV file to import it into Jupyter to there see the summary statistics too
write.csv(huizenzoeker_province_data1, "C:\\Users\\danie\\OneDrive\\Documents\\Repositories\\oDCM-project-team-3\\src\\collection\\huizenzoeker_province_data1.csv",row.names=FALSE)

##Now we can use this dataset to visualise our scraped data and create graphs if we want.

gem_vraagprijs %>%
  huizenzoeker_province_data1

library(ggplot2)
library(maps)
library(viridis)

NL <- map_data("world", region = "Netherlands")
ggplot(NL, aes(x = long, y = lat)) +
  geom_polygon(aes( group = group, fill = region))+
  theme(legend.position = "none")

library(sp)  # you need this library to work with SpatialPolygons
NLD <- readRDS("gadm36_NLD_2_sp.rds")
plot(NLD)

library(tibble) # better printing
library(dplyr)  # obviously
NLD@data %>% as_tibble()
NLD@data %>% tail(2)
ggplot(data = NLD, aes(x = long, y = lat))+
  geom_polygon( ) +
  coord_fixed()
ggplot()+
  geom_polygon(data = NLD, aes(x = long, y = lat, group = group)) +
  coord_map()


NLD_fixed <- subset(NLD, !NLD$NAME_1  %in% c("Zeeuwse meren", "IJsselmeer"))
NLD_fixed <- fortify(NLD_fixed)
ggplot(NLD_fixed) +
  geom_polygon( aes(x = long, y = lat, group = group))+
  coord_map()
ggplot(NLD_fixed) +
  theme_minimal()+  # no backgroundcolor
  geom_polygon( aes(x = long, y = lat, group = group),
                color = "white",   # color is the lines of the region
                fill = "#9C9797")+ # fill is the fill of every polygon.
  coord_map()

names_and_numbers <- data_frame(id=rownames(NLD@data),
                                Province=NLD@data$NAME_2) %>% 
  left_join(huizenzoeker_province_data1, by = "Province")

final_map <- left_join(NLD_fixed, names_and_numbers, by = "id")
final_map_na <- final_map %>%
  filter(!is.na(Province))

ggplot(final_map)+
  theme_minimal()+
  geom_polygon( aes(x = long, y = lat, group = group, fill= gem_vraagprijs)) +
  coord_map()+
  scale_fill_distiller(name = "Number of people in gemeente", # change titel legend
                       palette = "Spectral")+ # change the color scheme
  theme(legend.position = "bottom")  # chagne the legend position
