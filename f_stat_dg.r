##############-----------------

library(readxl)

FinData <- read_excel("C:/Users/User/Downloads/FinData.xls", 
                      col_types = c("date", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric"))
View(FinData)

library(tidyverse)
library(ggplot2)


ggplot(data = FinData) + geom_point(mapping = aes(x = Date, y = MSFT), color =
                                      "darkblue") + labs(x = "year", y = "Microsoft - Daily Closing Price")
ggsave("C:/Users/User/Downloads/Microsoft.png")

ggplot(data = FinData) + geom_line(mapping = aes(x = Date, y = APPL_lr), color =
                                     "darkred") + labs(x = "year", y = "Apple - Log Daily Return")
ggsave("C:/Users/User/Downloads/Apple.png")
ggplot(data = FinData) + geom_line(mapping = aes(x = Date, y = INTC_lr), color =
                                     "darkgreen") + labs(x = "year", y = "Intel - Log Daily Return")
ggsave("C:/Users/User/Downloads/Intel.png")
ggplot(data = FinData) + geom_line(mapping = aes(x = Date, y = IBM_lr), color =
                                     "darkcyan") + labs(x = "year", y = "IBM - Log Daily Return")
ggsave("C:/Users/User/Downloads/IBM.png")


# Normal and t-density and distribution function plots

# generate a vector of quatiles rangin from lower limit -4 to upper limit +4 
# in increments of 0.01
q_vector = seq(from = -4, to = 4, by = 0.01)

# set degrees-of-freedom
dof = 3

# find the values of the normal and t density and CDF,
norm_dens = dnorm(q_vector, mean = 0, sd = 1)
norm_cdf = pnorm(q_vector, mean = 0, sd = 1)
t_dens = dt(q_vector, df = dof)
t_cdf = pt(q_vector, df = dof)

# plot densities:
jpeg(file = "C:/Users/User/Downloads/dens.jpeg")
plot(q_vector,norm_dens, col = "blue", xlab = "quantiles", ylab = "density", type = 'l')




lines(q_vector,t_dens, col = "red", xlab = "quantiles", ylab = "density")
legend("topright", c("normal", "t"), lty = c(1, 1),
       lwd = c(1, 1), col = c("blue", "red"))
dev.off()

# plot distributions:
jpeg(file = "C:/Users/User/Downloads/dtb.jpeg")
plot(q_vector,norm_cdf, col = "blue", xlab = "quantiles", ylab = "probability", type = 'l')

lines(q_vector,t_cdf, col = "red")
legend("bottomright", c("normal", "t"), lty = c(1, 1),
       lwd = c(1, 1), col = c("blue", "red"))


dev.off()

# Application 1 - Microsoft
library(kdensity)
jpeg(file = "C:/Users/User/Downloads/ht.jpeg")
# generate histogram with 128 breaks

hist(FinData$MSFT_lr, breaks = 64,
     freq = FALSE, main = "Microsoft",
     xlab = 'daily log returns')

# fit a kernal density estimate starting the search at a normal distribution

kde_MSFT = kdensity(FinData$MSFT_lr, start = "normal")

# plot the kernel density estimate

lines(kde_MSFT, col = "blue")

# plot the closest normal distribution

lines(kde_MSFT, plot_start = TRUE, col = "red")
dev.off()

# fit empirical CDF to microsoft data

ecdf_msft = ecdf(FinData$MSFT_lr)

# plot the step function

jpeg(file = "C:/Users/User/Downloads/df.jpeg")
plot(ecdf_msft, verticals = TRUE, do.p = FALSE, main = "EDF and Normal CDF")
dev.off()



# compute some of the statistics of the empirical distribution
jpeg(file = "C:/Users/User/Downloads/ldf.jpeg")
mean1 = mean(FinData$MSFT_lr)
sd1 = sd(FinData$MSFT_lr)
min1 = min(FinData$MSFT_lr)
max1 = max(FinData$MSFT_lr)

# generate the closest equivalent CDF for the normal distribution 
# i.e. with the mean and standard deviation of the empirical distribution

q_vector = seq(from = min1, to = max1, by = 0.005)
norm_cdf = pnorm(q_vector, mean = mean1, sd = sd1)

# add the plot of the normal CDF

lines(q_vector,norm_cdf,col="red")

# add a legend
legend("bottomright", c("empirical distribution", "normal distribution"), lty = c(1, 1),
       lwd = c(1, 1), col = c("black", "red"))

dev.off()

# QQ plots

# standardize microsoft return data to have zero mean and unit variance:

msft_std = (FinData$MSFT_lr - mean1)/sd1

# produce quantile-quantile scatter plot

jpeg(file = "C:/Users/User/Downloads/qn.jpeg")
qqnorm(msft_std,  main = "Normal Q-Q Plot",
       plot.it = TRUE, datax = TRUE)

# add a line that intersects the 25th and 75th quantile
qqline(msft_std, datax = FALSE, distribution = qnorm,
       probs = c(0.25, 0.75), qtype = 7)
dev.off()

# Bivariate distribution:

# scatterplot of Microsoft vs Intel log daily returns: 
jpeg(file = "C:/Users/User/Downloads/sp.jpeg")
plot(FinData$MSFT_lr,FinData$INTC_lr, xlab = "Microsoft", ylab = "Intel")

dev.off()

