# **Scraping Huizenzoeker.nl to Analyse the Dutch Housing Market**

### Which places in the Netherlands are hit hardest by the Dutch Housing crisis, and which the least?

Currently, the housing crisis is one of the most prominent societal challenges in the Netherlands. The Dutch housing market is both very competitive as well as inaccessible as it must deal with a supply shortage, which in turn leads to long waiting lists for social housing. The transaction prices of houses are going through the roof, as CBS (Centraal Planbureau voor Statistiek, 2021) revealed that prices in the first quarter of 2021 were 11,3% higher compared to a year before, which is way above the average increase in Europe. Many prospective buyers have to overbid on the listings in order to ensure a place to live. A huge problem is that the amount of mortage is determined by the appraisal value of the house, which causes many to put their own capital into the purchase. This makes it very challenging for new entrants on the market (think of first-time buyers, young professionals) to succeed in renting or buying a house or appartment, especially as many are still paying off large amounts of student debt. It appears that only 3% of first-time buyers are financially able to buy a home without getting themselves into serious financial trouble. 

We have considered a few multiple housing sites to incorporate into our project, where [Huizenzoeker.nl](https://www.huizenzoeker.nl/) appeared to be the most suitable option. This website offers a clear view of the Dutch housing market with a wide range of listings, displaying an extensive amount of information (per listing and neighbourhood). Funda.nl currently is the largest housing provider in the Netherlands, however, the site is not useful for this project. Funda installed secure protection for its data to brace for competitor sites. Similarly, Zoekallehuizen.nl offers a large range of listings too, but could not provide us with important information needed to research the housing crisis, e.g. overbidding percentages. Similarly, Remax.nl, is a large housing website, yet, mainly focusing on houses in other countries, like Spain and Belgium. As we are determined to analyse the Dutch housing market by cause of the severe current crisis, Remax.nl has not sufficed to our needs.

Huizenzoeker data used is available at [Huizenzoeker.nl](https://www.huizenzoeker.nl/).

<img width="769" alt="Screenshot 2021-10-12 at 17 12 43" src="https://user-images.githubusercontent.com/90346612/136982742-0a414a2f-5358-44e2-af6d-2b07320f9bc6.png">





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





# Documentation



## 1 Motivation



### 1.1 For what purpose was the dataset created? Was there a specific task in mind? Was there a specific gap that needed to be filled? Please provide a description. 

As the seriousness of the housing crisis and the shortage of listings differs across the country, we aimed to create a dataset which represented the current housing market for each municipality in every province of the Netherlands. It would clarify which places are hit hardest by the crisis and which the least. With this dataset, we may faciliate these first-time buyers and young professionals in terms of their search to buy or a rent a house by showing them where they would have the highest chances. Furthermore, it would provide them with insights on recent price developments of listings in a certain area, which helps them in negotiations about the purhcase price. Therefore, this dataset provides consumers with other data in addition to what information is offered by their broker (e.g. direct information from the Kadaster). There were already some datasets available on the Dutch housing market, however these did not specifically focus on the overbidding aspect of the current crisis which forms an essential part of our research. Besides that, instead of only focussing on certain parts of the Netherlands we preferred to focus on all municipalities in the Netherlands to get a more complete picture of the current state of the housing crisis. By focusing on municipalities, the units we are analyzing are small enough to deeply dive into the housing market of the Netherlands locally (as opposed to only focusing on provinces), yet, the units are large enough to maintain order and control in our dataset (as opposed to focusing on every house that is for sale in the Netherlands).



### 1.2 Who created this dataset (e.g. which team, research group) and on behalf of which entity (e.g., company, institution, organization)?

Huizenzoeker.nl is an independent platform which is not influenced or moderated by estate agents, as it aims to inform its clients in a honest manner with reliable information. It is perceived as an aggregate site which collects information from public different sources, such as JAAP.nl. However, as Huizenzoeker.nl is owned by Spotzi, a big data visualizations specialist that focuses on the visualizing and analysing of spatial data, The Huizenzoeker team also provides much data themselves. From Spotzi, they retrieve much data on, for example, the value of the listings and development of housing prices. This is beneficial to our scraping project as this resulted in longs lists of information present for each listing, municipality, province etc. Therefore, it does not only provide specifics on the houses themselves like every other site, but also on the neighbourhood, the mean income in the municipality, the distance to the closest supermarket, etc. The platform states that it is a partner of JAAP.nl and Huislijn.nl, however it does not have explicit consent from JAAP.NL to show all information that is displayed on JAAP.nl (which seems quite contradictionary). In turn, databanks like JAAP.nl get their data from other sites, such as Funda.nl.  



### 1.3 Who funded the creation of the dataset? If there is an associated grant, please provide the name of the grantor and the grant name and number. 

The dataset is funded by advertisers on the site. Advertisers can target vistors on the site through the filter options, which allows advertisers to target based on different home characteristics or on region and price range. As Spotzi created various profiles from the data they compiled, e.g. starters (young and ambitious), families with children (nest builder), kids away from home (thriving fifties); advertisers can target very specifically to a certain audience within a certain zip code. These profiles can also be used on external sites through the Rearch extension function. 





## 2 Composition



### 2.1 What do instances that comprise the dataset represent (e.g. documents, photos, people, countries)? Are there multiple types of in-stances (e.g. movies, users, ratings; people and interactions between them; nodes and edges)? Please provide a description. 

The instances that comprise the dataset represent houses. However, in our dataset housing data is grouped at muncipality-level, where values represent the average number per municipality (step 3 of navigation path below). In turn, all municipalities belong to a larger type of instance, the provinces (step 2 of navigation path below). 

The following screenshots represent a brief navigation path:

1. The homepage of [Huizenzoeker.nl](https://www.huizenzoeker.nl/). From here, one can scroll down to the 'Woningmarkt'-section and navigate to one of the province pages.

<img width="1434" alt="Screenshot 2021-10-12 at 11 11 32" src="https://user-images.githubusercontent.com/90346612/136928729-9d3855b9-4699-430e-abf7-2a1299c79af3.png">

2. This is an example of a province page. This particular one considers the provinde Noord-Brabant. Notice how the url got extended with 'woningmarkt/noord-brabant/'. From this page, one can scroll down and select one of the municipality-pages that exist for the province in question.

<img width="1440" alt="Screenshot 2021-10-12 at 11 11 44" src="https://user-images.githubusercontent.com/90346612/136928426-035806a6-3463-43d5-9679-d50e31fcb37d.png">

3. This is an example of a municipality page within the province Noord-Brabant. This particular one considers the municipality Tilburg. Notice how the url got extended with 'tilburg/'.

<img width="1437" alt="Screenshot 2021-10-12 at 11 12 02" src="https://user-images.githubusercontent.com/90346612/136928508-388a21c2-885b-4ea7-9a8b-4deb02a84c7e.png">

The goal of this project has been to scrape information per municipality and per province (for completeness). Therefore, pages like the ones displayed under step 2 and 3 have been utilized to obtain statistical housing-related measures per municipality and province.



### 2.2 How many instances are there in total (of each type, if appropriate?)

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



### 2.3 Does the dataset contain all possible instances or is it a sample (not necessarily random) of instances from a larger set? If the dataset is a sample, then what is the larger set? Is the sample representative of the larger set (e.g., geographic coverage)? If so, please describe how this representativeness was validated/verified. If it is not representative of the larger set, please describe why not (e.g. to cover a more diverse range of instances, because instances were withheld or unavailable). 

It is a sample in the sense that all house-listings in the Netherlands are included (which is the full population), but are grouped and displayed as averages of their municipality. As every listing is located in a municipality, the sample is certainly representative of the larger set. Thus, our sample knows full geographic coverage. 



### 2.4 What data does each instance consist of? 'Raw' data (e.g. unprocessed text or images) or features? In either case, please provide a description. 

To clarify, each province, or instance, knows its own page, but next to that, also is the parent of several municipality pages (as described in question 2.2). However, the structure of this province and municipality page are almost identical. For this question, illustration is based on one of the municipality pages, Tilburg (Noord-Brabant).

First, all pages display a map of the Netherlands and their specific location on the map. Next, all contain a link to all the houses that are for sale followed by a link for all houses that are for rent. Furthermore, a subsequent link directs to themost expensive houses of the munucipality/province in question. 

<img width="952" alt="Screenshot 2021-10-12 at 12 24 53" src="https://user-images.githubusercontent.com/90346612/136939007-d8b99988-5057-4bc2-ab8f-0d8e9c7d262a.png">

Next, each page displays 4 'trend' statistics. Each of the 4 numbers contains a related percentual number, reflecting the percentual difference of the statistic compared to the month before. The first trend refers to the average selling price of a house within the municipality/province. The second trend refers to the number of houses sold in the past month. The third trend refelcts the average selling price per squared meter. And the fourth trend indicates what the average outbidding percentage is within the municipality/province in question. These trends will be of high importance during our project.

<img width="584" alt="Screenshot 2021-10-12 at 12 27 31" src="https://user-images.githubusercontent.com/90346612/136939330-9f742c7a-599a-4292-93e6-ec4dd43d66ab.png">

Moreover, all pages cover histograms that show price and housing supply trends. Additionally, a link is included to access more information about the housing market in question.

<img width="591" alt="Screenshot 2021-10-12 at 12 35 16" src="https://user-images.githubusercontent.com/90346612/136940387-2b280819-d4e4-49e2-99ed-f7545e79eafe.png">

Next, a section is shown in which several questions are answered in unprocessed text. The first questions, cover the exact same as the first 4 trend statistics. However, the last ones cover the population number and population growth/decline compared to the year before. This population-related information, again, will be of high relevance later in our project. 

<img width="570" alt="Screenshot 2021-10-12 at 12 36 56" src="https://user-images.githubusercontent.com/90346612/136940621-9fc2e4d0-7f6c-4afb-a07e-96fd890118fc.png">

Furthermore, a pie chart showing the average age distribution in the province/municipality is included. Moreover, a statistic on average disposable income is included, which again will be important later in our project.

<img width="586" alt="Screenshot 2021-10-12 at 12 41 48" src="https://user-images.githubusercontent.com/90346612/136941544-e1f6e1c2-2aa7-4946-9457-d5534044846f.png">

Finally, at the bottom of the page random houses that are for sale/rent are displayed, followed by links that navigate to a 'child'-page (e.g. from province page to municipality page).

### 2.5 Is there a label or target associated with each instance? If so, please provide a description. 



From each province in the Netherlands, we intend to scrape all corresponding municipalities. For the provinces an associated URL is for example 'https://www.huizenzoeker.nl/woningmarkt/noord-brabant/', which changes to 'https://www.huizenzoeker.nl/woningmarkt/noord-brabant/tilburg/' for Tilburg. So, each instance that we want to scrape corresponds to their own URL. 

Moreover, within the code we wrote, we extracted the municipality or province name for each of these URLs, by scraping the title and removing the word 'Woningmarkt' from it. Therefore, we changed the official label to an artificial one for clarity purposes, e.g. now the municipality Tilburg can be identified through the label 'Tilburg', instead of its URL.



### 2.6 Is any information missing from individual instances? If so, provide a description, explaining why this information is missing (e.g., because it was unavailable). This does not include intentionally removed information, but might include, e.g. redacted text. 

For our purposes of scraping Huizenzoeker.nl, there is no information missing that we wanted to include in our dataset.



### 2.7 Are relationships between individual instances made explicit (e.g., user's movie ratings, social network links)? If so, please describe how these relationships are made explicit. 

Yes, the municipalities are related to eachother by the province they are in. When running our code for all municipality URLs in a certain province, all information for every municipality within that province will be the output. The parent URL (province) and child URL (municipality) are **always** connected. This is explicitly visible in the URL names too. For every municipality, the municipality name in the link follows the province name. E.g. 'tilburg/' always follows 'noord-brabant/: 'https://www.huizenzoeker.nl/woningmarkt/noord-brabant/tilburg/'



### 2.8 Are there recommended data splits (e.g. training,development/validation, testing)? If so, please provide a description of these splits, explaining the rationale behind them. 

The data that is present on every province and municipality page has a similar structure. Due to this structure we were able to split the data into multiple variables. This is recommended as it allows for quicker comparing and interpreting of certain statistics among provinces and among municipalities.

The first variable we split off is the average selling price of a house for every page. Additionally, the percentual difference of this average price compared to the last month is extracted. These numbers allow for comparing in which municipalities the most expensive/cheap houses are located on average, and in which municipalities the growth in price is the deepest/slowest.

Furthermore, the next variable is the number of houses sold within a month. Next to that, the percentual difference in this number compared to the month before has been added as well. This data is relevent as it indicates which municipalities are most popular among the population of the Netherlands, and which municipalities are becoming more and more popular by cause of large growth in house sales. In the future, it might me relevant to expand this project to find out why these regions sell the most houses. Is the price the lowest? Are the overall home features superior? 

Next up, we split the average price per square meter for every municipality into a variable. And again, another number indicating the percentual difference compared to last month is included.  These numbers are important, as this information contains a measure of price relative to a certain size. It can be difficult to compare value-for-money by just looking at the absolute average selling price of a house. Certain houses are larger, and thus, are sold for a higher price. Within the average selling price per square metre we control for this issue.

The next split represents a percentual number on how much is outbid per municipality on average. Again, the percentual difference of this number compared to the month before is included. This number is important as it indicates in which regions buyers are willing to pay the highest 'extra' amount of money for a house. This might translate in where the competition for a house is the highest on average or how bad buyers want to be secure to attain the house. 

Furthermore, we scraped and split the average disposable income per municipality into a variable as well. The average disposable income is an important measure as it tells us how much inhabitants of a certain municipality are able to spend on a house. Thus, to match supply to demand, this variable might have an impact on the level of housing prices. 

Lastly, several measures in number of inhabitants have been split off. Firstly, the number of inhabitants. Secondly, the percentual number of inhabitant growth over the past year if applicable. And thirdly, if the population growth is not applicable, a percentual number of inhabitant decline is included. 

The paragraphs above simply clarify what the all variables entail, which ones belong together, and why they are important to include in our dataset. However, within the jupyter script, all the above-mentioned variables have been included into one table. We chose to display everything together to make all the information quickly accessible. We think it is no problem to consider all the variables into code like we do now because of the following reason. [Huizenzoeker.nl](https://www.huizenzoeker.nl/) updates its content each month automatically. The structure and the urls stay exactly the same, yet, the statistical numbers change per month. We designed our code in a way that it captures every number that is present at the moment, regardless of whether we run it in September versus October for example.



### 2.9 Is the dataset self-contained, or does it link to or otherwise rely on external resources (e.g. websites, tweets, other datasets)? If it links to or relies on external resources: 
### a) are there guarantees that they will exist and remain constant over time; 

[Huizenzoeker.nl](https://www.huizenzoeker.nl/) states that, for over 10 years, they have made every effort possible to ensure that this website functions properly and is kept permanently accessible for reputational reasons. Huizenzoeker.nl edits the information offered on its site with the greatest possible care and devotes the same care to the composition of the site. However, it legally cannot guarantee the correctness and completeness of the data shown as a result of imperfections that may occur. Moreover, Huizenzoeker is able to adapt the website where and whenever they please. No restrictions hold. This information has been retrieved from the [disclaimer](https://www.huizenzoeker.nl/over-ons/disclaimer/) section on the officiel Huizenzoeker website.

### b) are there official arhival versions of the complete datasets (i.e. including the external resources as they existed at the time the dataset was created).

Possibly for own utilization. However, no official arcihval versions of the complete datasets are available to us as the public of [Huizenzoeker.nl](https://www.huizenzoeker.nl/).

### c) are there any restrictions (e.g., licenses, fees) associated with any of the external resources that might apply to a future user? Please provide descriptions of all external resources and any restrictions associated with them, as well as links or other access points, as appropriate.

The external resources include [JAAP.nl](https://www.jaap.nl/) and [Huislijn.nl](https://www.huislijn.nl/), who in turn extract data from other sites such as [Funda.nl](https://www.funda.nl/). These sites are all available for free, thus, no restrictions are present in the form of licenses and fees for future users. There is a premium (under ['Abonnementen'](https://www.huizenzoeker.nl/woningmarkt-dashboard/))part of Huizenzoeker.nl for which you do need to pay to access it. For our project, the premium information was irrelevant. 



### 2.10 Does the dataset contain data that might be considered confidential (e.g. data that is protected by legal priviledge or by doctorpatient confidentiality, data that includes the content of individuals non-public communications)? If so, please provide a description. 

No, the data is not confidential. Therefore users do not have any rights to remove listings from the Huizenzoeker site. Only if their house is no longer for sale/rent on JAAP.nl, their listing will be removed. However, information on the house itself such as its value, year of construction, property size, will remain available. This information is considered as public. 



### 2.11 Does the dataset contain data that, if viewed directly, might be offensive, insulting, threatening, or might otherwise cause anxiety? If so, please describe why. 

No the data is not in any way offensive, insulting, or threatening. 



### 2.12 Does the dataset relate to people? If not, you may skip the remaining questions in this section. 

Not applicable. 



### 2.13 Does the dataset identify any subpopulations (e.g., by age, gender)? If so, please describe how these subpopulations are identified and provide a description of their respective distributions within the dataset. 

Within out dataset we only scrape the number of inhabitants per municipality/province, and the average disposable income per municipality/province. Therefore, one subpopulation in terms of different levels of average disposable income can considered to be present. 

LOOK FOR DISTRIBUTIONS FOR THIS SUBPOPULATION !!!!!  



### 2.14 Is it possible to identify individuals (i.e., one or more natural persons), either directly or indirectly (i.e., in combination with other data) from the dataset? If so, please describe how. 

Not applicable. 



### 2.15 Does the dataset contain data that might be considered sensitive in any way (e.g. data that reveals racial or ethnic origins, sexual orientations, religious beliefs, political opinions or union memberships, or locations; financial or health data; biometric or genetic data; forms of government identification, such as social security numbers; criminal history)? If so, please provide a description. 

Not applicable. 





## 3 Collection process 



### 3.1 How was the data associated with each instance acquired? Was the data directly observable (e.g., raw text, movie ratings), reported by subjects (e.g., survey responses), or indirectly inferred/derived from other data (e.g., part-of-speech tags, model-based guesses for age or language)? If data was reported by subjects or indirectly inferred/derived from other data, was the data validated/verified? If so, please describe how.

Via the selenium package we accessed ChromeDriverManager. Using this webdriver we were eventually able to scrape all the possible municipality links for the entire Huizenzoeker website. At first, we wanted to work with BeautifulSoup only, as the package is user friendly and works quickly. Yet, despite the benefits, this package was only able to extract the municipality links for one province at the time, as opposed to all links for all 12 provinces at once. On the other hand, Selenium is designed to automate test for Web Applications, and made it possible for us to finish the job. 

The next step was to extract all the variables desribed in question 2.8. One gigant code has been created for this step. At the beginning of this code, we made sure all the output got saved into a json file. Next, one big for-loop is created that will loop through all of the munucipality pages, making sure the code gets 5 seconds of sleep. Within the loop we loaded the BeautifulSoup package. This time, BeautifulSoup worked just fine for extracting the variables. And as BeautifulSoup is the simpler and quicker method, we chose to stick with this package at this step. Then we defined the first variable intended identification purposes: the municipality name. These were all the steps that needed to be completed in order to scrape all the variables we wanted from the municipality pages. These variables have been created using many 'if' - 'else' statements, tailoring each variable to its corresponding html output that can be accessed when inspecting the municipality webpage. Furthermore, irrelevent characters/words have been dropped to make output  better understandable. At the bottom of the code all the variables are appended into a list.

Using the 'pandas' package we were able to convert this list with variables into a large table (dataframe) containing all variables per municipality. This dataframe, in turn, is converted into a csv file. 

To obtain summary statistics we did the following. As most variables were seen as characters, while they should have been numerics, we exported the final dataframe to R to change these datatypes. After that, we exported it again, but as a CSV, to then use it to generate some summary statistics: count, mean, std, min, max, 25%, 50%, 75%.

The last part of the jupyter script shows how the same steps as described above are used to scrape the URLs on province level, as opposed to municipality level.

All the data we scraped from the Huizenzoeker platform was data that was directly observable in the form of raw text.



### 3.2 What mechanisms or procedures were used to collect the data (e.g., hardware apparatus or sensor, manual human curation, software program, software API)? How were these mechanisms or procedures validated?

We scraped the data using Python's programming software in Jupyter Notebooks. By loading the packages BeautifulSoup, Selenium, requests, re, pandas, time, webdriver manager, and json, we were able to use functions allowing for our specific webscraping steps.

Huizenzoeker.nl does not provide an official software API (anymore), so we scraped the data by writing code ourselves.



### 3.3 If the dataset is a sample from a larger set, what was the sampling strategy (e.g., deterministic, probabilistic with specific sampling probabilities)?

Technically, we have taken the entire population, and no sample, to conduct our project with. We took all the municipality pages as input, an not a portion of them.

Yet, logically, we have taken a sample. Namely, a single unit would represent a single house in logical terms. However, as the statistics we were after were only available on an average-level on the municipality pages, we took the municipality pages as single units. A municipality page consists of average numbers from all the single houses present in that region. Thus, that is the sampling strategy applied. 



### 3.4 Who was involved in the data collection process (e.g., students, crowdworkers, contractors) and how were they compensated (e.g., how much were crowdworkers paid)?

In the data collection process solely the team members of this project were involved.



### 3.5 Over what timeframe was the data collected? Does this timeframe match the creation timeframe of the data associated with the instances (e.g., recent crawl of old news articles)? If not, please describe the time-frame in which the data associated with the instances was created.

Huizenzoeker.nl covers the housing market data of October 2021. This is the most recent housing market data. Huizenzoeker.nl shows this most-recent data because the housing market changes every month (e.g., houses are sold, new houses are offered, the asking price may be more extremely outbid in one month than in the other month, etc.).



### 3.6 Were any ethical review processes conducted (e.g., by an institutional review board)? If so, please provide a description of these review processes, including the outcomes, as well as a link or other access point to any supporting documentation.

Not applicable.



### 3.7 Does the dataset relate to people? If not, you may skip the remaining questions in this section.

Not applicable. 



### 3.8 Did you collect the data from the individuals in question directly, or obtain it via third parties or other sources (e.g., websites)?

Not applicable. 



### 3.9 Were the individuals in question notified about the data collection? If so, please describe (or show with screenshots or other information) how notice was provided, and provide a link or other access point to, or other- wise reproduce, the exact language of the notification itself.

Not applicable. 



### 3.10 Did the individuals in question consent to the collection and use of their data? If so, please describe (or show with screenshots or other information) how consent was requested and provided, and provide a link or other access point to, or otherwise reproduce, the exact language to which the individuals consented.

Not applicable. 



### 3.11 If consent was obtained, were the consenting individuals provided with a mechanism to revoke their consent in the future or for certain uses? If so, please provide a description, as well as a link or other access point to the mechanism (if appropriate).

Not applicable. 



### 3.12 Has an analysis of the potential impact of the dataset and its use on data subjects (e.g., a data protection impact analysis) been conducted? If so, please provide a description of this analysis, including the outcomes, as well as a link or other access point to any supporting documentation.

Not appliable. 





## 4 Preprocessing, cleaning, labeling 



### 4.1 Was any preprocessing/cleaning/labeling of the data done (e.g., discretization or bucketing, tokenization, part-of-speech tagging, SIFT feature extraction, removal of instances, processing of missing values)? If so, please provide a description. If not, you may skip the remainder of the questions in this section. 

First of all, all the values of the variables have been cleaned in a way that they only give a certain numeric value or percentage as output (no additional words, and only consistent punctuation). When no numeric value exists for a specific municipality, we encoded that 'NA' will result as output for the variable in question. Furthermore, all the variables have been assigned a clear label, such that the numeric values are given a meaning. Additionally, all the variables have been displayed in a table against all the municipalities/provinces as a small start in preprocessing. 

ARE WE GOING TO DO MORE DPREP FOR ODCM ?????



### 4.2 Was the “raw” data saved in addition to the preprocessed/cleaned/labeled data (e.g., to support unanticipated future uses)? If so, please provide a link or other access point to the “raw” data.

Yes. Raw output is being saved in a json file automatically, as part of our coding script. The json file can be accessed by running our Scraping Woningmarkt (Final Code) jupyter script. 



### 4.3 Is the software used to preprocess/clean/label the instances available? If so, please provide a link or other access point.

We solely used Python and RStudio.

MIS IK IETS HIER????? 





## 5 Uses



### 5.1 Has the dataset been used for any tasks already? If so, please provide a description. 

We used our dataset in RStudio to create some plots and figures of the data we collected. We did this to give insights into how we would compare the municipalities for each province, and the data between the provinces. 



### 5.2 Is there a repository that links to any or all papers or systems that use the dataset? If so, please provide a link or other access point.

This repository.

MOETEN WE DIT NOG DOEN????



### 5.3 What (other) tasks could the dataset be used for?

Boradly speaking, a suitable task this dataset can be used for is helping (future) inhabitants of the Netherlands find their ideal home. By accessing our data, a person could find the best municipality to live in for this person's specific circumstances (e.g. specific disposable income level), find a region where the value-for-money seems to be of high standard, to help them in negotiations on the price, to help them find out what is the norm in terms of overbidding for each municipality, and more.



### 5.4 Is there anything about the composition of the dataset or the way it was collected and preprocessed/cleaned/labeled that might impact future uses? For example, is there anything that a future user might need to know to avoid uses that could result in unfair treatment of individuals or groups (e.g., stereotyping, quality of service issues) or other undesirable harms (e.g., financial harms, legal risks) If so, please provide a description. Is there anything a future user could do to mitigate these undesirable harms?

The only harms that could be done in the case of Huizenzoeker relates to financial harms, e.g. when one is misinformed about housing prices due to our dataset. 

However, as long as Huizenzoeker does not incur drastic changes, no undesirable harms will arise. 

Future users of the dataset could decide to implement more variables, or kick certain variables out. As long as this is done following the same steps as in our coding script, no harm can be done. 



### 5.5 Are there tasks for which the dataset should not be used? If so, please provide a description.

The dataset can be used for any matters regarding the housing market in the Netherlands. For anything outside of this topic, the dataset has no use.





