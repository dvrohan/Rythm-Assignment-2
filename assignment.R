### Reading data
data <- read.csv('BostonHousing.csv')

### Finding out the number of null data
print(paste('The total number of null data are: ', sum(is.null(data))))

### Total Number of Observations
print(paste('Total number of observations are:', nrow(data)))

### Maximum of values for each column
sapply(data, max, na.rm = TRUE)

### Minimum of values for each column
sapply(data, min, na.rm = TRUE)

### Standard deviation for each column
sapply(data, sd, na.rm = TRUE)

### Number of unique values in each column
sapply(data, function(x) length(unique(x)))

### Pairwise correlation heat map of data set
library(reshape2)
library(ggplot2)
correlation_matrix <- cor(data)
melted_correlation_matrix <- melt(correlation_matrix)
ggplot(data = melted_correlation_matrix, aes(x = Var1, y = Var2, fill = value)) + geom_tile() 

### Prediction of MEDV using regression algorithm and evaluating MSE, MAE, RMSE.
set.seed(1234)
training_model <- lm(formula = medv ~ ., data = data)
predicted_model <- predict(training_model, newdata = data[,-14])
difference <- (predicted_model - data$medv)

MSE <- sum(difference^2)/length(data$medv)
MAE <- sum(abs(difference))/length(data$medv)
RSE <- sqrt(MSE)

print(paste("MSE: ",MSE," MAE: ", MAE, " RSE: ",RSE))
