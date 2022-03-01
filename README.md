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

ifri_car_liv <- read_csv("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/carbon_livelihoods_dataset1.zip Folder/ifri_car_liv.csv")

Some basic commands in R are displayed:

**head** - it looks at the top rows of the dataset;

head(ifri_car_liv)

**brackets** [] - it chooses specific rows and columns;

**str** - it displays the structure of the data.

str(ifri_car_liv)

### 2. Graddy (2006) Data

This dataset is about the prices paid by individual buyers at the Fulton fish market in New York.

Fulton <- read_table2("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/fulton.zip Folder/Fulton.txt")

head(Fulton)

str(Fulton)

### 3. Crude Oil Price Data

This dataset brings oil crude prices since 1861.

Oil_prices <- read_excel("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/Crude Oil Price Data/bp-stats-review-2021-all-data.xlsx", sheet = "Oil - Crude prices since 1861", skip = 3)

head(Oil_prices)

str(Oil_prices)

**Warning**: *it's necessary to convert the "Year" column from character to numeric:*

Oil_prices$Year \<- lapply(Oil_prices$Year, as.integer)

Oil_prices$Year \<- as.numeric(Oil_prices$Year)

# Chapter Four - Supply and Demand

In this chapter, demand and supply functions are mathematical and graphical treated with the mosaic package. Also in this chapter, the equilibrium between supply and demand is calculated.

### 1. A little bit of theory

#### 1.1 Demand function

The demand is usually defined as a schedule of quantities that buyers are willing and able to purchase at a schedule of prices in a given time interval, ceteris paribus.

Actually, the demand function is influenced by many variables: the price of the good, the prices of related goods (compliments and substitutes), incomes of the buyers, the tastes and preferences of the buyers, the period of time and a variety of other possible variables.

Indeed, an individual's demand function for a good (good X) might be written as:

Qx = f(Px, P(related goods), income (M), preferences, . . . )

• Qx = the quantity of good X demanded

• Px = the price of demand for the good X

• P(related goods) = the prices of compliments or substitutes

• Income(M) = the income of the buyers

• Preferences = the preferences or tastes of the buyers

For the sake of simplicity, the demand function is based on an inverse or negative relationship between the price and quantity of a good purchased. Thus, let the quantity demanded Qx be given by:

Qx = αd − βd.Px

#### 1.2 Supply function

On the other side, supply is a schedule of quantities that will be produced and offered for sale at a schedule of prices in a given time period, ceteris paribus.

A supply function is a model that represents the behavior of the producers and/or sellers in a market.

Indeed, an individual's supply function of a good (good X) might be written as:

Qx = f(Px, P(inputs), technology, number of sellers, laws, taxes, expectations . . . #S)

• Qx = quantity of the good X supplied

• Px = price of supply of the good X

• P(inputs) = prices of the inputs (factors of production used)

• Technology is the method of production (a production function), laws and regulations may impose more costly methods of production

• taxes and subsidies alter the costs of production

• #S represents the number of sellers in the market

For the sake of simplicity, the supply function is based on a direct or positive relationship between the price and quantity of a good supplied. Thus, let the quantity demanded Qx be given by:

Qx = αs + βs.Px

#### 1.3 Supply and demand law

The price of any good adjusts to bring the quantity supplied and the quantity demanded of the good into equilibrium.

At equilibrium, demand = supply, i.e. D = S. This gives us the equilibrium price:

Px = (αd − αs)/(βd + βs)

### 2. Loading the Mosaic Package

install.packages("mosaic")

library(mosaic)
