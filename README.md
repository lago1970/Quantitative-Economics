# Quantitative Economics

This is a repository about the book " An Introduction to R for Quantitative Economics" by Vikram Dayal.

![41Ul90JyzZL *SX313_BO1,204,203,200*](https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9788/1322/9788132223399.jpg)

# Chapter Three - Getting data into R

In this chapter, three datasets are described and made avalaible to further use in the next chapters.

First, we load the needed packages to read the three datasets:

library(readr)

library(readxl)

library(xlsx)

### 1. Chhatre and Agrawal (2009) Data

This dataset is about carbon storage and livelihood benefits from forest commons.

ifri_car_liv \<- read_csv("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/carbon_livelihoods_dataset1.zip Folder/ifri_car_liv.csv")

Some basic commands in R are displayed:

**head** - it looks at the top rows of the dataset;

head(ifri_car_liv)

**brackets** [] - it chooses specific rows and columns;

**str** - it displays the structure of the data.

str(ifri_car_liv)

### 2. Graddy (2006) Data

This dataset is about the prices paid by individual buyers at the Fulton fish market in New York.

Fulton \<- read_table2("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/fulton.zip Folder/Fulton.txt")

head(Fulton)

str(Fulton)

### 3. Crude Oil Price Data

This dataset brings oil crude prices since 1861.

Oil_prices \<- read_excel("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/Crude Oil Price Data/bp-stats-review-2021-all-data.xlsx", sheet = "Oil - Crude prices since 1861", skip = 3)

head(Oil_prices)

str(Oil_prices)

**Warning**: *it's necessary to convert the "Year" column from character to numeric:*

Oil_prices$Year \<- lapply(Oil_prices$Year, as.integer)

Oil_prices$Year \<- as.numeric(Oil_prices$Year)

# Chapter Four - Supply and Demand

In this chapter, demand and supply functions are mathematical and graphical treated with the mosaic package. Also in this chapter, the equilibrium between supply and demand is calculated.

### 1. A little bit of theory

Let the quantity demanded D be given by:

D = αD − βD P

Similarly for supply S:

S = αS + βS P

At equilibrium, demand = supply, i.e. D = S. This gives us the equilibrium price:

P∗ = (αD − αS)/(βD + βS)

### 2. Loading the Mosaic Package

install.packages("mosaic")

library(mosaic)


