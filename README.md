# Scraping Huizenzoeker.nl to analyse the Dutch Housing Market 

__Which places in the Netherlands are hit hardest by the Dutch Housing crisis, and which the least?__

Huizenzoeker data used is available at [Huizenzoeker.nl](https://www.huizenzoeker.nl/).

![Huizenzoeker Logo](https://www.makelaartips.nl/wp-content/uploads/2019/07/Huizenzoeker-logo-klein-1-300x150.png)

## Repository overview

* readme.txt = documentation project. 
* docs/ = stores any supporting files for the documentation 
* data/ = stores the raw data files. 
* src/ = stores the files source codes for collecting the data, and used to generate statistics/insights documented in the readme

## Contributors

This is the repository for the course [Online Data Collection and Management](https://odcm.hannesdatta.com) at Tilburg University as part of the Master's program 'Marketing Analytics', used for the team project of group 3. 

Members of our team: 

* [Lesley Haerkens](https://github.com/lesleyhaerkens), l.w.g.haerkens@tilburguniversity.edu

* [Mila Gargiulo](https://github.com/MilaGargiulo), m.r.e.m.gargiulo@tilburguniversity.edu

* [Anouk Bor](https://github.com/AnoukBor), a.m.bor@tilburguniversity.edu

* [Mandana Khabbazi](https://github.com/Mandanakhabbazi), m.i.khabbazi@tilburguniversity.edu

* [Daniëlle van Bruggen](https://github.com/daniellevb00), d.m.vanbruggen@tilburguniversity.edu

# 1 Documentation

## 1.1 Motivation (needs update)

### Motivation for data context 

The housing crisis is one of the most prominent societal challenges in the Netherlands momentarily. The transaction prices of the houses in the Netherlands were 11,3% higher in the first quarter of 2021 than in the first quarter of 2020 (CBR, 2021). This means that the housing prices in the Netherlands have increased more than the European average. The housing market is at the moment very competitive as well as inaccessible. Due to the supply shortage, the rising house prices and the long waiting list on social housing, the housing market is overloaded. Many prospective buyers have to overbid in order to ensure the success of their purchase. However, the amount of mortgage is determined by the appraisal value of a house, so many buyers have to put their own capital into the purchase of a house.This makes it very challenging for first-time buyers and young professionals to purchase their first owner-occupied home or rent a house, because they have often a high student debt which is not paid off yet. Only 3% of first-time buyers are financially able to buy a home without getting in financial trouble afterwards. The housing shortage differs per municipality, so therefore it is interesting to look into the different municipalities and where houses are overbid the most. Our aim is to facilitate the first-time buyers and young professionals in terms of their search for buying or renting a house, by establishing a dataset which allows us to clarify which places in the Netherlands are hit hardest by the housing crisis and which the least. There are some datasets available about the housing market in the Netherlands, however they don’t focus on the overbidding of houses which is essential for our research. Besides that, the data we will retrieve will focus on all the municipalities in the Netherlands as a whole, while a lot of datasets will only research certain parts of the Netherlands.  

### Motivation for choice of website/API 

 There are a few housing websites that offer different houses which are for sale in The Netherlands. However, not all of them are as easy to scrape. First, we looked at Funda.nl, the largest provider of houses in The Netherlands, but we found out that a lot of the data on this website seemed protected for scraping. This is the reason we looked for another website which was accessible to conduct our research. Firstly, we looked at the website remax.nl, but found out that this website mainly focuses on houses in other countries, like Spain or Belgium. The goal of this research is to find data on the housing prices in the Netherlands, so this website gave us a lot of information that we could not use. After that, we looked at Zoekallehuizen.nl, which also offers a lot of houses that are for sale. However, we did not find all the information that we needed. We were specifically looking for information on how much people overbid on houses. Eventually we found the website Huizenzoeker.nl, which also offered a wide range of houses that are for sale and for rent. Huizenzoeker is independent and does not relate to any real estate agency. The range of houses for sale and for rent come from the housing website JAAP.nl. However, in addition to the sale and rental information, you can find information about every home in the Netherlands and their estimated sales value, which could not be found on the website JAAP.nl. The website offers information on the housing market for every municipality. For example, there is information about the average asking price, the average price per m2 and the average percentage of money that is outbitted per house. There is also a possibility to see how these averages have changed over time. This is very useful information, because with this information it is possible to see how the housing prices have fluctuated and developed in different municipalities over the last months or years. Because Huizenzoeker.nl offers more information about the statements stated above than on the other websites we found, this seemed like the best fit for scraping data and facilitating a dataset with useful information to first-time buyers and young professionals. 

## 1.2 Composition

### Entities, linkages, timeframe and algorithmic biases

...

### Sampling, construct measurement and data structure

...

### Data inspection per entity

...

## 1.3 Collection process

### Technical extraction plan

...

### Legal and ethical concerns

...

## 1.4 Preprocessing

### Preprocessing

...

### Accessibility, and structure of final data files

...

## 1.5 Uses

### Users of the data learn about tasks the data set could be used for 

...




