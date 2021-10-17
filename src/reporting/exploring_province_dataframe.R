#####################################################
####Scraped province-level data Huizenzoeker#########
#####################################################

# GOAL: MAKING OUR SCRAPED PROVICNE DATA A FUNCTIONAL DATASET. 

## Loading packages and data 
library(readr)
library(dplyr)
huizenzoeker1 <- read_csv("huizenzoeker_province_data.csv")
huizenzoeker1<-huizenzoeker1[2:14] #delete the first row with indices (not needed)
View(huizenzoeker1)
summary(huizenzoeker1)
head(huizenzoeker1)

## 1: Transforming data
#Correcting classes
sapply(huizenzoeker1,class) #most of the columns' values are seen as characters, while they should be numeric. 

# QUADRANT 1
#Gemiddelde vraagprijs column 
huizenzoeker1$gem_vraagprijs<-gsub('[€]','', huizenzoeker1$'Gem. vraagprijs') 
huizenzoeker1$gem_vraagprijs<-parse_number(huizenzoeker1$gem_vraagprijs) 
huizenzoeker1$gem_vraagprijs<-as.numeric(huizenzoeker1$gem_vraagprijs)
#Perc verandering vraagprijs column
huizenzoeker1$perc_ver_vraagprijs<-gsub('[%]','',huizenzoeker1$'%Δ Vraagprijs (t.o.v vorige maand)')
huizenzoeker1$perc_ver_vraagprijs<-parse_number(huizenzoeker1$perc_ver_vraagprijs)
huizenzoeker1$perc_ver_vraagprijs<-as.numeric(huizenzoeker1$perc_ver_vraagprijs)

# QUADRANT 2
#Verkochte woningen column 
huizenzoeker1$verk_woningen<-huizenzoeker1$'Verkochte woningen'
huizenzoeker1$verk_woningen<-as.numeric(huizenzoeker1$verk_woningen)
#Perc verandering verkochte woningen column
huizenzoeker1$perc_ver_verkocht<-gsub('[%]','',huizenzoeker1$'%Δ Verkochte woningen (t.o.v vorige maand)')
huizenzoeker1$perc_ver_verkocht<-parse_number(huizenzoeker1$perc_ver_verkocht)
huizenzoeker1$perc_ver_verkocht<-as.numeric(huizenzoeker1$perc_ver_verkocht)

# QUADRANT 3
#Gemiddelde m2 prijs column 
huizenzoeker1$gem_m2prijs<-gsub('[€]','', huizenzoeker1$'Gem. m2 prijs')
huizenzoeker1$gem_m2prijs<-parse_number(huizenzoeker1$gem_m2prijs)
huizenzoeker1$gem_m2prijs<-as.numeric(huizenzoeker1$gem_m2prijs)
#Perc verandering gemiddelde m2 prijs column 
huizenzoeker1$perc_ver_m2prijs<-gsub('[%]','',huizenzoeker1$'%Δ M2 prijs (t.o.v vorige maand)')
huizenzoeker1$perc_ver_m2prijs<-parse_number(huizenzoeker1$perc_ver_m2prijs)
huizenzoeker1$perc_ver_m2prijs<-as.numeric(huizenzoeker1$perc_ver_m2prijs)

# QUADRANT 4
#Gemiddeld percentage overboden column
huizenzoeker1$perc_overboden<-gsub('[%]','', huizenzoeker1$'% Vraagprijs overboden') 
huizenzoeker1$perc_overboden<-parse_number(huizenzoeker1$perc_overboden)
huizenzoeker1$perc_overboden<-as.numeric(huizenzoeker1$perc_overboden)
#Perc verandering percentage overboden column
huizenzoeker1$perc_ver_overboden<-gsub('[%]','', huizenzoeker1$'%Δ Overboden (t.o.v vorige maand)') 
huizenzoeker1$perc_ver_overboden<-parse_number(huizenzoeker1$perc_ver_overboden)
huizenzoeker1$perc_ver_overboden<-as.numeric(huizenzoeker1$perc_ver_overboden)

# BESTEEDBAAR INKOMEN
huizenzoeker1$best_inkomen<-gsub('[€]','', huizenzoeker1$'Besteedbaar inkomen (per huishouden)')
huizenzoeker1$best_inkomen<-parse_number(huizenzoeker1$best_inkomen) 
huizenzoeker1$best_inkomen<-as.numeric(huizenzoeker1$best_inkomen)

# INWONERS
#Aantal inwoners column
huizenzoeker1$n_inwoners<-huizenzoeker1$'Aantal inwoners'
#Perc populatie stijging of daling columns
huizenzoeker1$perc_pop_stijging<-gsub('[%]','', huizenzoeker1$'% Populatie stijging') 
huizenzoeker1$perc_pop_stijging<-parse_number(huizenzoeker1$perc_pop_stijging)
huizenzoeker1$perc_pop_stijging<-as.numeric(huizenzoeker1$perc_pop_stijging)
huizenzoeker1$perc_pop_daling<-gsub('[%]','', huizenzoeker1$'% Populatie daling') 
huizenzoeker1$perc_pop_daling<-parse_number(huizenzoeker1$perc_pop_daling)
huizenzoeker1$perc_pop_daling<-as.numeric(huizenzoeker1$perc_pop_daling)

#Remove the old unnecessary columns
huizenzoeker_province_data1<-huizenzoeker1%>%select(-c('Gem. vraagprijs','%Δ Vraagprijs (t.o.v vorige maand)', 'Verkochte woningen','%Δ Verkochte woningen (t.o.v vorige maand)','Gem. m2 prijs','%Δ M2 prijs (t.o.v vorige maand)','% Vraagprijs overboden','%Δ Overboden (t.o.v vorige maand)','Besteedbaar inkomen (per huishouden)', 'Aantal inwoners', '% Populatie stijging', '% Populatie daling'))
#Explore summary statistics dataset
View(huizenzoeker_province_data1)
summary(huizenzoeker_province_data1)

#Convert dataset to CSV (to import into Jupyter Notebooks)
write.csv(huizenzoeker_province_data1, "huizenzoeker_province.csv",row.names=FALSE)


## 2: Visualisations data

#Loading packages
library(ggplot2)
library(maps)
library(viridis)
library(tibble) #for better printing properties
library(sp) #needed to work with SpatialPolygons
library(mapproj)
library(extrafont)

#Visualisations of the average % outbid for each province in the Netherlands
NL <- map_data("world", region = "Netherlands")
ggplot(NL, aes(x = long, y = lat)) +
  geom_polygon(aes( group = group, fill = region))+
  theme(legend.position = "none")

NLD <- readRDS("gadm36_NLD_2_sp.rds")
NLD_data <- NLD@data
plot(NLD)

ggplot(data = NLD, aes(x = long, y = lat))+
  geom_polygon( ) +
  coord_fixed()
ggplot()+
  geom_polygon(data = NLD, aes(x = long, y = lat, group = group)) +
  coord_map()

NLD_fixed <- subset(NLD, !NLD$NAME_1  %in% c("Veldhoven"))
NLD_f<- fortify(NLD)

names_and_numbers <- data_frame(id=rownames(NLD_data),
                                Province=NLD_data$NAME_1) %>% 
  left_join(huizenzoeker_province_data1, by = "Province")

final_map <- left_join(NLD_f, names_and_numbers, by = "id") 

ggplot(final_map) +
  theme_minimal() +
  geom_polygon(aes(x = long, y = lat, group = group, fill= perc_overboden)) +
  labs(x="", y="", title="Dutch Housing Crisis: Which Areas Are Most Outbid?",
       subtitle = "Concerning Provinces in the Netherlands") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        legend.position = "bottom") +
  coord_map()+
  scale_fill_distiller(name = "% outbid", 
                       palette = "Reds",
                       direction = 1) +
  theme(legend.position = "right",
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank()) 








