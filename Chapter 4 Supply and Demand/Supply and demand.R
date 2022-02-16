
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

plotFun(pD, xlim = range(0, 30), ylim = range(5, 20),
        lty = 2, lwd = 1.5)

# lty stands for line type and lwd stands for width of the line

# Second demand function -> pD = (150 − 6q) / 8
pD2 <- makeFun(( aD - ( bD * q )) / cD ~ q,
              aD = 150, bD = 6,cD = 8)
pD2(20)

plotFun(pD2, xlim = range(0, 30), ylim = range(5, 20),
        lty = 2, lwd = 1.5)

# Plot both the demand curves pD and pD2 together
plotFun(pD, xlim = range(0, 30), ylim = range(5, 20),
        lty = 2, lwd = 1.7)
plotFun(pD2, xlim = range(0, 30), ylim = range(5, 20),
        lwd = 1.7, add = TRUE)



