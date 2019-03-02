                    #  Project 4 - Time series analysis 

#  Getting the data
library(readxl)
mydata<- read_xls("E:\\Analytixlabs\\Module 6 (Data science using R)\\Case Studies\\Case study 4 - Time series analysis\\UK Outward Passengers Movement.xls",range = "A6:G46")
View(mydata)
dim(mydata)

#  Step 1:- Converting the dataset to a Time series object
df<- ts(mydata$Total,start = c(1996,1),end = c(2005,4),frequency = 4)

# Step 2: Plotting the series
plot(df)  
abline(reg = lm(df~time(df)))

# Extracting the Seasonality and Trend
x<-decompose(df,type = c("multiplicative"))
plot(x)
# Through this plot we can easily identify the Trend, Seasonality and Irregular
# components in our Time series

#  Step 3: Checking for Stationarity
library(tseries)
library(forecast)
adf.test(df,alternative = "stationary")
# From the result we can clearly see that P value>0.05 which means that we accept the 
# Null hypothesis,i.e., the given Time series is Non-stationary


# Since our series is Non-stationary, we have to make it stationary. For this we use 
# Differencing techniques

ndiffs(df)  # tells us the number of differences(d) required to achieve stationarity

# Determination of Order of Auto regression(p) and order of Moving averages(q)

acf(df) # Autocorrelation function
# This is used for finding the order of Auto regression(p)

pacf(df) # Partial Autocorrelation function
# This is used for finding the order of Moving averages(q)

#  So now we know the value of p,d and q we can create our model using
# Arima(p,d,q) function
# Generally, instead of going through the pain of finding the values of p,d and q,
# we use auto.arima() which comes from 'forecast' package.
# The advantage of using this function is that it automatically takes the optimal
# values of p,d and q , which are best suited for the model.


#  Step 4:  Creation of time series Model

fit<- auto.arima(df)
summary(fit)
accuracy(fit)  #  Accuracy of the Model

#  Step 5: Forecasting the future values
forecast(fit,h=4,level = 95)
plot(forecast(fit,h=4,level = 95))

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
