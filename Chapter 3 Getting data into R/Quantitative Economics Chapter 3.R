
library(readr)
library(readxl)
library(xlsx)

ifri_car_liv <- read_csv("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/carbon_livelihoods_dataset1.zip Folder/ifri_car_liv.csv")

head(ifri_car_liv)
str(ifri_car_liv)

Fulton <- read_table2("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/fulton.zip Folder/Fulton.txt")

head(Fulton)
str(Fulton)

Oil_prices <- read_excel("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/Crude Oil Price Data/bp-stats-review-2021-all-data.xlsx", sheet = "Oil - Crude prices since 1861", skip = 3)

head(Oil_prices)
str(Oil_prices)

# Convertendo a coluna Year de character para numeric no dataframe Oil_prices

Oil_prices$Year <- lapply(Oil_prices$Year, as.integer)
Oil_prices$Year <- as.numeric(Oil_prices$Year)
