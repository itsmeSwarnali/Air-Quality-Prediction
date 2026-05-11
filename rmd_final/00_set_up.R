# 00_setup.R  (plain R script)

DATA_PATH <- "NY_BEMQ_pollution_weather_2020_2024_annotated_merged.csv"

data <- read.csv(DATA_PATH, stringsAsFactors = FALSE)

data$date <- as.Date(data$date, format = "%m/%d/%Y")
data$city <- factor(data$city)

data$year <- as.integer(data$year)
data$year_f <- factor(data$year)

data$month <- factor(format(data$date, "%m"), levels = sprintf("%02d", 1:12))
data$month_name <- factor(month.abb[as.integer(as.character(data$month))], levels = month.abb)

Xcols <- c("city", "month", "temp","humidity","windspeed",
           "co_mean","no2_mean","so2_mean","pm2_5_mean","o3_mean")

train_all <- subset(data, year == 2020)
test_all  <- subset(data, year == 2024)

vars_reg <- c("max_aqi", "city", "month", Xcols)

train <- train_all[complete.cases(train_all[, vars_reg]), ]
test  <- test_all [complete.cases(test_all [, vars_reg]), ]

rmse <- function(y, yhat) sqrt(mean((y - yhat)^2, na.rm = TRUE))
mae  <- function(y, yhat) mean(abs(y - yhat), na.rm = TRUE)

false_negative_rate <- function(y_true, y_pred, thr = 100) {
  mean(y_true >= thr & y_pred < thr, na.rm = TRUE)
}
