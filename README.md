# Time-series-analysis
Forecasting the passenger's movement from UK

# Dataset
The dataset(UK outward passengers movement.xls) contains data of UK passenger movement from UK to different places.

# Business problem:
The objective of this project is to forecast the total number of passenger's movement from UK to different places for next four quarters.
We also have to calculate the seasonality index using Moving averages and Centered moving averages in Excel.

# Techniques used:
1. Converted the dataset into Time series object using ts function.
2. Used decompose function to extract the seasonality and Trend components from the Time series.
3. Checked for stationarity and plotted the acf and pacf plots.
4. Used forecast package and then applied auto.arima to create the Time series model and then used the accuracy function to calculate the forecast accuracy by using MAD and MAPE.
5. calculated the seasonality index using Moving averages and Centered moving averages in excel file(Seasonality index using moving averages)
