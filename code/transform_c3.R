## Script to transform data to make C3.js visualizations.
library(reshape2)
library(ggplot2)

# loading data
indicator <- read.csv('data/indicator.csv')
value <- read.csv('data/value.csv')

# denormalizing table
data <- merge(value, indicator, by = 'indID', all.x = TRUE)
data$period <- as.Date(data$period)
data$value <- as.numeric(data$value)

# preparing for the C3 chart.
car <- data[data$name == 'Refugees from the Central African Republic', ]
syria <- data[data$name == 'Registered Syrian Refugees', ]

# dcasting
car_c <- dcast(car, period + value ~ region)
syria_c <- dcast(syria, period + value ~ region)

# cleanig
car_c$CAR <- NULL
names(car_c) <- c('date', 'n_refugees')
syria_c$SYR <- NULL
names(syria_c) <- c('date', 'n_refugees')


# storing CSV
write.csv(car_c, 'http/data/car.csv', row.names = F)
write.csv(syria_c, 'http/data/syria.csv', row.names = F)