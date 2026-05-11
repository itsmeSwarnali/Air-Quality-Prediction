# Air-Quality-Prediction
This project presents a data-driven study of air quality in four New York State cities: Bronx, Erie, Monroe, and Queens. The main goal is to model and predict daily Air Quality Index (AQI), while also comparing air-quality patterns between 2020, representing the COVID-period with reduced mobility, and 2024, representing a more normal year.

The dataset combines daily pollutant data from EPA sources with weather data from Visual Crossing. Pollutants include CO, NO₂, SO₂, PM₂.₅, and O₃, while meteorological predictors include temperature, humidity, and wind speed. The final dataset contains 2,928 city-day observations across two leap years, with 2020 used as the training period and 2024 used as the testing period.

The analysis includes data cleaning, merging, exploratory visualization, missing-value investigation, PCA-based imputation, baseline linear regression, and Generalized Additive Models (GAMs). Missingness patterns were examined using logistic models, and PCA imputation was applied to preserve data structure without deleting important observations. A baseline linear regression model was first fitted, but diagnostic plots showed nonlinearity and heteroscedasticity. Therefore, a GAM was developed to capture nonlinear pollutant and weather effects while preserving interpretability.

The final model is a Box-Cox transformed GAM with city effects, smooth nonlinear terms, seasonal structure, and interaction surfaces between key predictors such as PM₂.₅, O₃, temperature, and month. The model achieved strong explanatory power and good generalization performance on 2024 data, showing that PM₂.₅ and O₃ are the most important nonlinear drivers of daily AQI.

## Key Features

- Cleaned and merged EPA pollutant data with Visual Crossing weather data
- Compared air quality patterns between 2020 and 2024
- Created city-day level AQI labels based on maximum pollutant AQI
- Investigated missingness using logistic regression models
- Applied PCA-based imputation for pollutant variables
- Built baseline Linear Regression models
- Developed interpretable Generalized Additive Models using `mgcv`
- Added Box-Cox transformation, seasonal cyclic smooths, and tensor interaction terms
- Evaluated model performance using RMSE and residual diagnostics
- Identified PM₂.₅ and O₃ as dominant drivers of AQI variation

## Tools and Technologies

- R
- R Markdown
- tidyverse
- ggplot2
- mgcv
- missMDA
- car
- gridExtra
- Linear Regression
- Generalized Additive Models
- PCA Imputation
- Residual Diagnostics
- Environmental Data Analysis

## Project Outcome

The project shows that air quality patterns changed between 2020 and 2024 across New York cities. While some cities improved, others experienced more frequent unhealthy-air days in 2024. The final GAM provided a strong balance between prediction accuracy and interpretability, making it suitable for understanding how pollutants and weather conditions influence daily AQI.

This project demonstrates practical skills in data cleaning, environmental data integration, statistical modeling, missing-value treatment, model diagnostics, and interpretable machine learning using R.
