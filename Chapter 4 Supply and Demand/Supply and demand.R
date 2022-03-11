
# Supply and demand

# Let the quantity demanded D be given by:
  # D = αD − βD P
  # Similarly for supply S:
    # S = αS + βS P
  # At equilibrium, demand = supply, i.e. D = S. This gives us the equilibrium price:
    # P∗ = (αD − αS)/(βD + βS)

# Loading the Mosaic Package
install.packages("mosaic")
library(mosaic)

# Demand
# inverse demand function -> pD = (125 − 6q) / 8

pD <- makeFun(( aD - ( bD * q )) / cD ~ q,
              aD = 125, bD = 6,cD = 8)

pD(20)

# Plot the first demand function

curve(expr = pD, from = 0, to = 30, ylim = c(0, 20), lty = 2,
      lwd = 1.5, main = "1st Demand Curve",
      col = "blue", xlab = "Quantity", ylab = "Price")


# P.S.: lty stands for line type and lwd stands for width of the line

# Second demand function -> pD = (150 − 6q) / 8

pD2 <- makeFun(( aD - ( bD * q )) / cD ~ q,
              aD = 150, bD = 6,cD = 8)

pD2(20)

# Plot the second demand function

curve(expr = pD2, from = 0, to = 30, ylim = c(0, 20), lty = 2,
      lwd = 1.5, main = "2nd Demand Curve",
      col = "red", xlab = "Quantity", ylab = "Price")

# Plot both the demand curves pD and pD2 together

curve(expr = pD, from = 0, to = 30, ylim = c(0, 20), lty = 2,
      lwd = 1.5, main = "1st and 2nd Demand Curves",
      col = "blue", xlab = "Quantity", ylab = "Price")
curve(pD2, add = TRUE, lwd = 2, col = "red")


# Supply

# Supply function -> pS = (12 + 2q) / 5

pS <- makeFun((aS + (bS * q))/cS~q, aS = 12, bS = 2,
              cS = 5)

curve(expr = pS, from = 0, to = 30, ylim = c(0, 20), lty = 2,
      lwd = 1.5, main = "Supply Curve",
      col = "violet", xlab = "Quantity", ylab = "Price")


# Plot the demand and supply curves together
curve(expr = pD, from = 0, to = 30, ylim = c(0, 20), lty = 2,
      lwd = 1.5, main = "Supply and Demand Curves",
      col = "blue", xlab = "Quantity", ylab = "Price")
curve(pD2, add = TRUE, lwd = 2, col = "red")
curve(pS, add = TRUE, lwd = 2, col = "violet")


# Market Equilibrium - At the equilibrium, D = S, or D − S = 0, then:

# ((aD - (bD * q))/cD) - ((aS + (bS * q))/cS))

# Market equilibrium at the initial (before the demand curve shifted) equilibrium quantity

# (125 − 6q)/8 - (12 + 2q) / 5

q.equil_0 <- findZeros(((aD - (bD * q))/cD) - ((aS + (bS * q))/cS) ~ q, aD = 125, bD = 6, cD = 8, aS = 12, bS = 2, cS = 5)

# The initial (before the demand curve shifted) equilibrium quantity

q.equil_0

# The initial (before the demand curve shifted) equilibrium price

pD(q.equil_0)

# Market equilibrium at the final (after the demand curve shifted) equilibrium quantity

# (150 − 6q)/8 - (12 + 2q) / 5

q.equil_1 <- findZeros(((aD - (bD * q))/cD) - ((aS + (bS * q))/cS) ~ q, aD = 150, bD = 6, cD = 8, aS = 12, bS = 2, cS = 5)

# The final (after the demand curve shifted)  equilibrium quantity

q.equil_1

# The final (after the demand curve shifted)  equilibrium price

pD(q.equil_1)


# A little bit of practice

# Loading fish data

Fish <- read.csv2("/Users/MAC/Documents/AmbienteR/Quantitative-Economics/Chapter 3 Getting data into R/Raw data/fulton.zip Folder/Fulton.csv")

# Plotting the fish data Price x Quantity
xyplot(LogPrice ~ LogQuantity, data = Fish, main = "Fish Market Data", sub = "Equilibrium price versus equilibrium quantity",
       col = "red", xlab = "Quantity", ylab = "Price")


# Plotting the fish data Price x Stormy Weather
xyplot(LogPrice ~ jitter(Stormy), data = Fish, type = c("p","r"), main = "Fish Market Data", sub = "Price versus Stormy Weather")




