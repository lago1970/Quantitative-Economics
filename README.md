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

**brackets** [ ] - it chooses specific rows and columns;

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

Qx = f(Px, P(related goods), income (M), preferences, . . . ), where:

• Qx = the quantity of good X demanded  
• Px = the price of demand for the good X  
• P(related goods) = the prices of compliments or substitutes  
• Income(M) = the income of the buyers  
• Preferences = the preferences or tastes of the buyers

For the sake of simplicity, the demand function is based on an inverse or negative relationship between the price and quantity of a good purchased. Thus, let the quantity demanded Qx be given by:

Qx = αd − βd.Px, where:  
αd = all relevant non-specified factors that affect demand for the product; and  
βd = slope of the demand curve. The coefficient is negative in accordance with the law of demand. Actually, the related good may be either a complement or a substitute. If it is a complement, the coefficient of its price would be negative. If it is a substitute, the coefficient of its price would be positive.

#### 1.2 Supply function

On the other side, supply is a schedule of quantities that will be produced and offered for sale at a schedule of prices in a given time period, ceteris paribus.

A supply function is a model that represents the behavior of the producers and/or sellers in a market.

Indeed, an individual's supply function of a good (good X) might be written as:

Qx = f(Px, P(inputs), technology, number of sellers, laws, taxes, expectations . . . #S), where:

• Qx = quantity of the good X supplied  
• Px = price of supply of the good X  
• P(inputs) = prices of the inputs (factors of production used)  
• Technology is the method of production (a production function), laws and regulations may impose more costly methods of production  
• taxes and subsidies alter the costs of production  
• #S represents the number of sellers in the market

For the sake of simplicity, the supply function is based on a direct or positive relationship between the price and quantity of a good supplied. Thus, let the quantity demanded Qx be given by:

Qx = αs + βs.Px, where:  
αs = all relevant non-specified factors that affect demand for the product; and  
βs = slope of the supply curve. The coefficient of Px is positive following the general rule that price and quantity supplied are directly related.

#### 1.3 Supply and demand law

The price of any good adjusts to bring the quantity supplied and the quantity demanded of the good into equilibrium.

At equilibrium, demand = supply, i.e. D = S. This gives us the equilibrium price:

Px = (αd − αs)/(βd + βs)

### 2. Loading the Mosaic Package

The mosaic package is designed to facilitate the use of R in statistics and calculus instruction by providing a number of functions that *(a)* make many common tasks fit into a common template, and *(b)* simplify some tasks that would otherwise be too complicated for beginners.

install.packages("mosaic")

library(mosaic)

### 3. Plotting the demand curve

First of all, we set up an inverse demand function in order to place the independent variable on the y-axis and the dependent variable on the x-axis. So, let the price demanded be given by pD = (125 − 6q) / 8, where aD = 125, bD = 6 and cD = 8.

Next, we use the *makeFun* Mosaic function which creates the demand function below:

pD <- makeFun(( aD - ( bD * q ) ) / cD ~ q, aD = 125, bD = 6, cD = 8)

D denotes demand, p denotes price, q denotes quantity and a, b, and c are parameters; aD is the parameter related to the demand function. Note the use of the tilde (~): the expression to the left of it is a function of the variable on the right of it.

To see what price in the inverse demand function corresponds to a quantity of 20, we type in the value of q as follows:

pD(20)  
[1] 0.625

So, when q = 20, pD = 0.625.

We will now plot the first inverse demand function:

curve(expr = pD, from = 0, to = 30, ylim = c(0, 20), lty = 2, lwd = 1.5, main = "1st Demand Curve", col = "blue", xlab = "Quantity", ylab = "Price")

<img src="/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter%204%20Supply%20and%20Demand/1st%20Demand%20Curve.pn" alt="Philadelphia's Magic Gardens. This place was so cool!" title="First Demand Curve" />

![](/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 4 Supply and Demand/1st Demand Curve.png)

Assuming a general increase in incomes, each individual would choose to buy more "q" at every price. To express the shift in the demand curve due to the general increase in income, we make and plot a second demand function, given by pD2 = (125 − 6q) / 8, where aD = 150, bD = 6 and cD = 8. The only difference to pD is that aD is now equal to 150.

pD2 <- makeFun(( aD - ( bD * q )) / cD ~ q, aD = 150, bD = 6, cD = 8)

To see what price in the inverse demand function corresponds to a quantity of 20, we type in the value of q as follows:

pD2(20)  
[1] 3.75

So, when q = 20, pD2 = 3.75

We will now plot the second inverse demand function:

curve(expr = pD2, from = 0, to = 30, ylim = c(0, 20), lty = 2, lwd = 1.5, main = "2nd Demand Curve", col = "red", xlab = "Quantity", ylab = "Price")

![Second Demand Curve](/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter%204%20Supply%20and%20Demand/2nd%20Demand%20Curve.png)

We can now plot both the demand curves pD and pD2 together:

curve(expr = pD, from = 0, to = 30, ylim = c(0, 20), lty = 2, lwd = 1.5, main = "1st and 2nd Demand Curves", col = "blue", xlab = "Quantity", ylab = "Price") curve(pD2, add = TRUE, lwd = 2, col = "red")

![First and Second Demand Curve](/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter%204%20Supply%20and%20Demand/1st%20and%202nd%20Demand%20Curves.png)

### 4. Plotting the supply curve

We set up a supply function where the quantity supplied is given by pS = (12 + 2q) / 5, where aD = 12, bD = 2 and cD = 5.

pS <- makeFun((aS + (bS * q))/cS~q, aS = 12, bS = 2,
              cS = 5)

We will now plot the supply function:

curve(expr = pS, from = 0, to = 30, ylim = c(0, 20), lty = 2,
      lwd = 1.5, main = "Supply Curve",
      col = "violet", xlab = "Quantity", ylab = "Price")
      
![Supply Curve](/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 4 Supply and Demand/Supply Curve.png)

Finally, we can plot both supply and demand curves together:

curve(expr = pD, from = 0, to = 30, ylim = c(0, 20), lty = 2,
      lwd = 1.5, main = "Supply and Demand Curves",
      col = "blue", xlab = "Quantity", ylab = "Price")
curve(pD2, add = TRUE, lwd = 2, col = "red")
curve(pS, add = TRUE, lwd = 2, col = "violet")

![Supply and Demand Curves](/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 4 Supply and Demand/Supply and Demand Curves.png)

A rightward shift in demand increases equilibrium price and equilibrium quantity.
Although we can see the equilibrium from the point of intersection of D
and S, we may want to calculate the equilibrium price and quantity.

### 5. Market equilibrium

Market equilibrium is found at the point where the supply curve intersects the demand curve. At equilibrium price, quantity supplied is equal to quantity demanded. Then:

((aD - (bD * q))/cD) - ((aS + (bS * q))/cS))

We use the findZeros function and apply it to the excess demand at the initial (before the demand curve shifted) equilibrium quantity:

q.equil_0 <- findZeros(((aD - (bD * q))/cD) - ((aS + (bS * q))/cS) ~ q, aD = 125, bD = 6, cD = 8, aS = 12, bS = 2, cS = 5)

To find what quantity corresponds to the initial equilibrium quantity, we type:

q.equil_0  
[1] 12

In the same way, to find what price corresponds to the initial equilibrium price, we type:

pD(q.equil_0)  
[1] 6.625

We also use the findZeros function and apply it to the excess demand at the final (after the demand curve shifted) equilibrium quantity:

q.equil_1 <- findZeros(((aD - (bD * q))/cD) - ((aS + (bS * q))/cS) ~ q, aD = 150, bD = 6, cD = 8, aS = 12, bS = 2, cS = 5)

To find what quantity corresponds to the final equilibrium quantity, we type:

q.equil_1  
[1] 14

In the same way, to find what price corresponds to the final equilibrium price, we type:

pD(q.equil_1)  
[1] 3.75
