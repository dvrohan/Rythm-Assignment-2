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
