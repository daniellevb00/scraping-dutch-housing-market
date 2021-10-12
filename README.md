# Scraping Huizenzoeker.nl to analyse the Dutch Housing Market 

__Which places in the Netherlands are hit hardest by the Dutch Housing crisis, and which the least?__

Momentarily, its housing crisis is one of the most prominent societal challenges in the Netherlands. The Dutch housing market is both very competitive as well as inaccessible as it must deal with a supply shortage, which in turn leads to long waiting lists for social housing. The transaction prices of houses are going through the roof, as CBS (Centraal Planbureau voor Statistiek, 2021) revealed that prices in the first quarter of 2021 were 11,3% higher compared to a year before, which is way above the average increase in Europe. Many prospective buyers have to overbid on the listings in order to ensure a place to live. However, the problem is that the amount of mortage is determined by the appraisal value of the house, which causes many to put their own capital into the purchase. This makes it very challenging for new entrants on the market (think of first-time buyers, young professionals) to succeed in renting or buying a house or appartment, especially as many are still paying off large amounts of student debt. It appears that only 3% of first-time buyers are financially able to buy a home without getting themselves into serious financial trouble. 

We have considered a few other housing sites, but Huizenzoeker.nl seemed like the best option as it offers a clear view of the Dutch housing market, with a wide range of listings and more information than the other sites we came across (both on the houses themselves, but also the neighbourhood). Other sides we considered include Funda.nl, which is the largest housing provider in the Netherlands, however the site as not the best to use for our scraping project as Funda does a good job at protecting its data to brace themselves for competitor sites. Similarly, Zoekallehuizen.nl also offers a large range of listings, but could not provide us with all information needed to research the housing crisis (it especially missed important data on overbidding). Remax.nl is also a large site which mainly focuses on houses in other countries, like Spain and Belgium. However, we were set on the idea to analyse the Dutch housing market because of this ' trend' of a supply shortage which makes the data a lot more interesting to research. 

Huizenzoeker data used is available at [Huizenzoeker.nl](https://www.huizenzoeker.nl/).

![Huizenzoeker Logo](https://www.makelaartips.nl/wp-content/uploads/2019/07/Huizenzoeker-logo-klein-1-300x150.png)

## Repository overview

* readme.txt = documentation project. 
* docs/ = stores any supporting files for the documentation. 
* data/ = stores the raw data files. 
* src/ = stores the files source codes for collecting the data, and used to generate statistics/insights documented in the README.

## Contributors

This is a repository for the course [Online Data Collection and Management](https://odcm.hannesdatta.com) at Tilburg University as part of the Master's program 'Marketing Analytics', used for the team project of group 3. 

Members of our team: 

* [Lesley Haerkens](https://github.com/lesleyhaerkens), l.w.g.haerkens@tilburguniversity.edu

* [Mila Gargiulo](https://github.com/MilaGargiulo), m.r.e.m.gargiulo@tilburguniversity.edu

* [Anouk Bor](https://github.com/AnoukBor), a.m.bor@tilburguniversity.edu

* [Mandana Khabbazi](https://github.com/Mandanakhabbazi), m.i.khabbazi@tilburguniversity.edu

* [Daniëlle van Bruggen](https://github.com/daniellevb00), d.m.vanbruggen@tilburguniversity.edu

## Documentation

### 1 Motivation

#### 1.1 For what purpose was the dataset created? Was there a specific task in mind? Was there a specific gap that needed to be filled? Please provide a description. 

As the seriousness of the housing crisis and the shortage of listings differs across the country, we aimed to create a dataset which represented the current housing market for each municipality in every province of the Netherlands. It would clarify which places are hit hardest by the crisis and which the least. With this dataset, we may faciliate these first-time buyers and young professionals in terms of their search to buy or a rent a place by showing them where they would have the highest chances. Furthermore, it would provide them with insights on recent price developments of listings in a certain area, which helps them in negotiations about the purhcase price. Therefore, this dataset provides consumers with other data in addition to what information is offered by their broker (e.g. direct information from the Kadaster). There were already some datasets available on the Dutch housing market, however these did not specifically focus on the overbidding aspect of the current crisis which forms an essential part of our research. Besides that, instead of only focussing on certain parts of the Netherlands we preferred to focus on all municipalities in the Netherlands to get a more complete picture of the current state of the housing crisis. 

#### 1.2 Who created this dataset (e.g. which team, research group) and on behalf of which entity (e.g., company, institution, organization)?

Huizenzoeker.nl is an independent platform which is not influenced or moderated by estate agents, as it aims to inform its clients in a honest manner with reliable information. It is perceived as an aggregate site which collects information from public different sources, such as JAAP.nl. However, as Huizenzoeker.nl is owned by Spotzi, a big data visualizations specialist that focuses on the visualizing and analysing of spatial data, The Huizenzoeker team also provides much data themselves. From Spotzi, they retrieve much data on, for example, the value of the listings and development of housing prices. This is beneficial to our scraping project as this resulted in longs lists of information present for each listing, municipality, province etc. Therefore, it does not only provide specifics on the houses themselves like every other site, but also on the neighbourhood, the mean income in the municipality, and the distance to the closest supermarket. The platform states that it is a partner of JAAP.nl and Huislijn.nl, however it does not have explicit consent from JAAP.NL to show all information that is displayed on JAAP.nl (which seems quite contradictionary). These databanks also get their data from other sites, such as Funda.nl.  

#### 1.3 Who funded the creation of the dataset? If there is an associated grant, please provide the name of the grantor and the grant name and number. 
The dataset is funded by advertisers on the site. Advertisers can target vistors on the site through the filter options, which allows advertisers to target based on different home characteristics or on region and price range. As Spotzi created various profiles from the data they compiled, e.g. starters (young and ambitious), families with children (nest builder), kids away from home (thriving fifties); advertisers can target very specifically to a certain audience within a certain zip code. These profiles can also be used on external sites through the Rearch extension function. 

### 2 Composition

#### 2.1 What do instances that comprise the dataset represent (e.g. documents, photos, people, countries)? Are there multiple types of in-stances (e.g. movies, users, ratings; people and interactions between them; nodes and edges)? Please provide a description. 

The instances that comprise the dataset represent houses. However, in our dataset housing data is grouped at muncipality-level, where values represent the average number per municipality (step 3 of navigation path below). In turn, all municipalities belong to a larger type of instance, the provinces (step 2 of navigation path below). 

The following screenshots represent a brief navigation path:

1. The homepage of [Huizenzoeker.nl](https://www.huizenzoeker.nl/). From here, one can scroll down to the 'Woningmarkt'-section and navigate to on of the province pages.

<img width="1434" alt="Screenshot 2021-10-12 at 11 11 32" src="https://user-images.githubusercontent.com/90346612/136928729-9d3855b9-4699-430e-abf7-2a1299c79af3.png">

2. This is an example of a province page. This particular one considers the provinde Noord-Brabant. Notice how the url got extended with 'woningmarkt/noord-brabant/'. From this page, one can scroll down and select one of the municipality-pages that exist for the province in question.

<img width="1440" alt="Screenshot 2021-10-12 at 11 11 44" src="https://user-images.githubusercontent.com/90346612/136928426-035806a6-3463-43d5-9679-d50e31fcb37d.png">

3. This is an example of a municipality page within the province Noord-Brabant. This particular one considers the municipality Tilburg.

<img width="1437" alt="Screenshot 2021-10-12 at 11 12 02" src="https://user-images.githubusercontent.com/90346612/136928508-388a21c2-885b-4ea7-9a8b-4deb02a84c7e.png">

The goal of this project has been to scrape information per municipality (and later per province too). Therefore, pages like the ones displayed under step 2 and 3 have been utilized to obtain statistical housing-related measures per municipality (and province).

#### 2.2 How many instances are there in total (of each type, if appropriate?)

In total there are 12 provinces, each with their own municipalities: 
* Groningen = 10 municipalities
* Friesland = 18 municipalities
* Drenthe = 12 municipalities
* Overijssel = 25 municipalities
* Flevoland = 6 municipalities
* Gelderland = 51 municipalities
* Noord-Holland = 47 municipalities
* Zuid-Holland = 52 municipalities
* Utrecht = 26 municipalities
* Limburg = 31 municipalities
* Noord-Brabant = 61 municipalities
* Zeeland = 13 municipalities
Total = 352 municipalities.

#### 2.3 Does the dataset contain all possible instances or is it a sample (not necessarily random) of instances from a larger set? If the dataset is a sample, then what is the larger set? Is the sample representative of the larger set (e.g., geographic coverage)? If so, please describe how this representativeness was validated/verified. If it is not representative of the larger set, please describe why not (e.g. to cover a more diverse range of instances, because instances were withheld or unavailable). 

It is a sample in the sense that all listings are included but as averages of their municipality. Therefore it is certainly representative of the larger set as it covers the whole country. 

#### 2.4 What data does each instance consist of? 'Raw' data (e.g. unprocessed text or images) or features? In either case, please provide a description. 

Each instance contains a 'number of trends' page, which provides data such as the trends in average asking price and outbid percentage. The page also covers figures such as histograms that show price trends and a pie chart that shows the average age distribution in the province or municipality.

#### 2.5 Is there a label or target associated with each instance? If so, please provide a description. 

From each province in the Netherlands, we intend to scrape all corresponding municipalities. For the provinces an associated URL is for example 'https://www.huizenzoeker.nl/woningmarkt/noord-brabant/', which changes to 'https://www.huizenzoeker.nl/woningmarkt/noord-brabant/tilburg/' for Tilburg. So, each instance that we want to scrape corresponds to their own URL and site, in which we navigate to the municipalities URLs through each province URL.

#### 2.6 Is any information missing from individual instances? If so, provide a description, explaining why this information is missing (e.g., because it was unavailable). This does not include intentionally removed information, but might include, e.g. redacted text. 

For our purposes of scraping Huizenzoeker.nl, there is no information missing that we wanted to include in our dataset.

#### 2.7 Are relationships between individual instances made explicit (e.g., user's movie ratings, social network links)? If so, please describe how these relationships are made explicit. 

Yes, the municipalities are related to eachother by the province they are in. This is made explicit by the dataset by municipalities having the same value in the 'Province' column. 

#### 2.8 Are there recommended data splits (e.g. training,development/validation, testing)? If so, please provide a description of these splits, explaining the rationale behind them. 

The data that is present on every province and municipality page has a similar structure. Due to this structure we were able to split the data into multiple variables. This is recommended as it allows for quicker comparing and interpreting of certain statistics among provinces and among municipalities.

Within the first split the average selling price of a house is extracted for every page. Additionally, the percentual difference of this average price compared to the last month is extracted. These numbers allow for comparing in which municipalities the most expensive/cheap houses are located on average, and in which municipalities the growth in price is the deepest/slowest.

Furthermore, we have split the data to obtain the number of houses sold within a month. Next to that, the percentual difference in this number compared to the month before has been added as well. This data is relevent as it indicates which municipalities are most popular among the population of the Netherlands, and which municipalities are becoming more and more popular by cause of large growth in house sales. In the future, it might me relevant to expand this project to find out why these regions sell the most houses. Is the price the lowest? Are the overall home features superior? 

Next up, we split the average price per square metre for every municipality into a variable. And again, another number indicating the percentual difference compared to last month is included.  These numbers are important, as this information contains a measure of price relative to a certain size. It can be difficult to compare value-for-money by just looking at the absolute average selling price of a house. Certain houses are larger, and thus, are sold for a higher price. Within the average selling price per square metre we control for this issue.

The next split represents a percentual number on how much is overbid per municipality on average. Again, the percentual difference of this number compared to the month before is included. This number is important as it indicates in which regions buyers are willing to pay the highest 'extra' amount of money for a house. This might translate in where the competition for a house is the highest on average or how bad buyers want to be secure to attain the house. 

Furthermore, we scraped and split the average disposable income per municipality into a variable as well. The average disposable income is an important measure as it tells us how much inhabitants of a certain municipality are able to spend on a house. Thus, to match supply to demand, this variable might have an impact on the level of housing prices. 

Lastly, several measures in number of inhabitants have been split off. Firstly, the number of inhabitants. Secondly, the percentual number of inhabitant growth over the past year if applicable. And thirdly, if the population growth is not applicable, a percentual number of inhabitant decline is included. 

The paragraphs above simply clarify what the all variables entail, which ones belong together, and why they are important to include in our dataset. However, within the jupyter script, all the above-mentioned variables have been included into one table. We chose to display everything together to make all the information quickly accessible. We think it is no problem to consider all the variables into code like we do now because of the following reason. [Huizenzoeker.nl](https://www.huizenzoeker.nl/) updates its content each month automatically. The structure and the urls stay exactly the same, yet, the statistical numbers change per month. We designed our code in a way that it captures every number that is present at the moment, regardless of whether we run it in September versus October for example.

#### 2.9 Is the dataset self-contained, or does it link to or otherwise rely on external resources (e.g. websites, tweets, other datasets)? If it links to or relies on external resources: 
#### a) are there guarantees that they will exist and remain constant over time; 

Huizenzoeker.nl makes every effort to ensure that this website functions properly and to keep it permanently accessible. However, legally the site can not guarantee that the website is accessible or functions properly at all times. Huizenzoeker.nl edits the information offered on its site with the greatest possible care and devotes the same care to the composition of the site. However, it legally cannot guarantee the correctness and completeness of the data shown as a result of imperfections that may occur. 

#### b) are there official arhival versions of the complete datasets (i.e. including the external resources as they existed at the time the dataset was created.
Not sure... I don't think so... 

#### c) are there any restrictions (e.g., licenses, fees) associated with any of the external resources that might apply to a future user? Please provide descriptions of all external resources and any restrictions associated with them, as well as links or other access points, as appropriate.

The external resources include [JAAP.nl](https://www.jaap.nl/) and [Huislijn.nl](https://www.huislijn.nl/), which also extract data from other sites such as [Funda.nl](https://www.funda.nl/). These sites are all available for free, so there are not any restrictions in the form of licenses and fees for future users. There is a premium part of Huizenzoeker.nl for which you do need to pay to access it, but we did not use the data on that part of the platform. 

#### 2.10 Does the dataset contain data that might be considered confidential (e.g. data that is protected by legal priviledge or by doctorpatient confidentiality, data that includes the content of individuals non-public communications)? If so, please provide a description. 
No the data is not confidential as this information should be publically available. Therefore users do not have any rights to remove listings from the Huizenzoeker site, only if their house is no longer for sale/rent on JAAP.nl the listing will be removed. However, information about the house itself such as its value, year of construction, property size, will remain available and this is seen as public information that can not be removed. 

#### 2.11 Does the dataset contain data that, if viewed directly, might be offensive, insulting, threatening, or might otherwise cause anxiety? If so, please describe why. 
No the data is not in any way offensive, insulting, or threatening. 

#### 2.12 Does the dataset relate to people? If not, you may skip the remaining questions in this section. 

Not applicable. 

#### 2.13 Does the dataset identify any subpopulations (e.g., by age, gender)? If so, please describe how these subpopulations are identified and provide a description of their respective distributions within the dataset. 

Within out dataset we only scrape the number of inhabitants per municipality/province, and the average disposable income per municipality/province. Therefore, one subpopulation in terms of different levels of average disposable income can considered to be present. 

LOOK FOR DISTRIBUTIONS FOR THIS SUBPOPULATION !!!!!  

##### 2.14 Is it possible to identify individuals (i.e., one or more natural persons), either directly or indirectly (i.e., in combination with other data) from the dataset? If so, please describe how. 

Not applicable. 

#### 2.15 Does the dataset contain data that might be considered sensitive in any way (e.g. data that reveals racial or ethnic origins, sexual orientations, religious beliefs, political opinions or union memberships, or locations; financial or health data; biometric or genetic data; forms of government identification, such as social security numbers; criminal history)? If so, please provide a description. 

Not applicable. 

### 3 Collection process 

(I think it's a bit vague whether these questions are all about how we collected the data from the site, or how the site collected their data?)

#### 3.1 How was the data associated with each instance acquired? Was the data directly observable (e.g., raw text, movie ratings), reported by subjects (e.g., survey responses), or indirectly inferred/derived from other data (e.g., part-of-speech tags, model-based guesses for age or language)? If data was reported by subjects or indirectly inferred/derived from other data, was the data validated/verified? If so, please describe how.

Most of the data collected was directly observable from the huizenzoeker.nl/woningmarkt/ part of the platform. The 'woningmarkt' function shows for every municipality and province the average price, number of houses sold, average price per squared metre, percentage outbid, disposable income per household etc. 

#### 3.2 What mechanisms or procedures were used to collect the data (e.g., hardware apparatus or sensor, manual human curation, software program, software API)? How were these mechanisms or procedures validated?

We scraped the data using Python's programming software in Jupyter Notebooks, using different packages such as BeautifulSoup and Selenium. Huizenzoeker.nl does not provide an official software API, so we scraped the data by writing code ourselves.

#### 3.3 If the dataset is a sample from a larger set, what was the sampling strategy (e.g., deterministic, probabilistic with specific sampling probabilities)?

The dataset is from a larger set in the sense that the data (such as the outbid percentage) available on the Huizenzoeker.nl site is averaged across provinces and municipalities. However, we did not intend to create a sample set, since we scraped all municipaplity data (i.e., 351 municipalities in total) from each province in the Netherlands (i.e., 12 provinces in total).

#### 3.4 Who was involved in the data collection process (e.g., students, crowdworkers, contractors) and how were they compensated (e.g., how much were crowdworkers paid)?

In the data collection process merely the team members of this project were involved.

#### 3.5 Over what timeframe was the data collected? Does this timeframe match the creation timeframe of the data associated with the instances (e.g., recent crawl of old news articles)? If not, please describe the time-frame in which the data associated with the instances was created.

Huizenzoeker.nl covers the housing market data of September 2021. This is the most recent housing market data. Huizenzoeker.nl shows this most-recent data because the housing market changes every month (e.g., houses are sold, new houses are offered, the asking price may be more extremely outbid in one month than in the other month, etc.).

#### 3.6 Were any ethical review processes conducted (e.g., by an institutional review board)? If so, please provide a description of these review processes, including the outcomes, as well as a link or other access point to any supporting documentation.

Not applicable.

#### 3.7 Does the dataset relate to people? If not, you may skip the remaining questions in this section.

Not applicable. 

#### 3.8 Did you collect the data from the individuals in question directly, or obtain it via third parties or other sources (e.g., websites)?

Not applicable. 

#### 3.9 Were the individuals in question notified about the data collection? If so, please describe (or show with screenshots or other information) how notice was provided, and provide a link or other access point to, or other- wise reproduce, the exact language of the notification itself.

Not applicable. 

#### 3.10 Did the individuals in question consent to the collection and use of their data? If so, please describe (or show with screenshots or other information) how consent was requested and provided, and provide a link or other access point to, or otherwise reproduce, the exact language to which the individuals consented.

Not applicable. 

#### 3.11 If consent was obtained, were the consenting individuals provided with a mechanism to revoke their consent in the future or for certain uses? If so, please provide a description, as well as a link or other access point to the mechanism (if appropriate).

Not applicable. 

#### 3.12 Has an analysis of the potential impact of the dataset and its use on data subjects (e.g., a data protection impact analysis) been conducted? If so, please provide a description of this analysis, including the outcomes, as well as a link or other access point to any supporting documentation.

Not appliable. 

### 4 Preprocessing, cleaning, labeling 

#### 4.1 Was any preprocessing/cleaning/labeling of the data done (e.g., discretization or bucketing, tokenization, part-of-speech tagging, SIFT feature extraction, removal of instances, processing of missing values)? If so, please provide a description. If not, you may skip the remain- der of the questions in this section. 

...

#### 4.2 Was the “raw” data saved in addition to the preprocessed/cleaned/labeled data (e.g., to support unanticipated future uses)? If so, please provide a link or other access point to the “raw” data.

I do not this was possible for our project as the data on the site is updated every month. 

#### 4.3 Is the software used to preprocess/clean/label the instances available? If so, please provide a link or other access point.

Python? Rstudio? 

### 5 Uses

#### 5.1 Has the dataset been used for any tasks already? If so, please provide a description. 

We used our dataset in RStudio to create some plots and figures of the data we collected; to give insights into how we would compare the municipalities for each province, and the data between the provinces. 

#### 5.2 Is there a repository that links to any or all papers or systems that use the dataset? If so, please provide a link or other access point.

This repository? 

#### 5.3 What (other) tasks could the dataset be used for?

Helping users find the best municipality for them to live in (where they will have the highest chance of succeeding to find a house), to help them in negotiations on the price, and to help them find out what is the norm in terms of overbidding for each municipality. 

#### 5.4 Is there anything about the composition of the dataset or the way it was collected and preprocessed/cleaned/labeled that might impact future uses? For example, is there anything that a future user might need to know to avoid uses that could result in unfair treatment of individuals or groups (e.g., stereotyping, quality of service issues) or other undesirable harms (e.g., financial harms, legal risks) If so, please provide a description. Is there anything a future user could do to mitigate these undesirable harms?

...

#### 5.5 Are there tasks for which the dataset should not be used? If so, please provide a description.

...





