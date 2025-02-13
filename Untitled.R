# the following exercises are a test in disguise. 
# can you think of any improvements to the following code? 
# go through the exercises and answer them while fixing issues and improving on code workflow 
# make a Rmarkdown (or Quarto) version of this document with your responses 
# render the document in PDF and HTML formats 
rm(list=ls()) 

library(tidyverse)

## PROBLEM 1 ##
visualizing your data is important!
  summary statistics can be highly misleading, and simply plotting the data can reveal a lot more!
  Lets look at the Anscombe’s Quartet data. There are four different data sets.
Anscombe, F. J. (1973). "Graphs in Statistical Analysis". American Statistician. 27 (1): 17–21. doi:10.1080/00031305.1973.10478966. JSTOR 2682899.

anscombe_quartet = readRDS("anscombe quartet.rds") 

# let's explore the dataset 
str(anscombe_quartet)

# what does the function str() do? 
# str() tells you the type of function it is, ie character, number, etc.. 

# let's check some summary statistics:

anscombe_quartet %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  ) 

# what do the summary statistics tell us about the different datasets? 
# The summary statistics tell us that the mean of x and y are the same for all of the datasets. They also have the same correlation between x and y of 0.816. Tells us that the range is pretty similar for the first three datasets, but the fourth one has a very high y. 

# let's plot the data with ggplot:

require(ggplot2)

ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset) 

# save as plot - PNG format
# width 5 inch, height = 5 inch for paper 

# what do the plots tell us about the different datasets? 
# describe the relationship between x and y in the different datasets. 
The summary statistics were obscuring thhe pattersn, The first dataset is pretty scattered although there does seem to be a trend upwards and following a slight linear pattern. Dataset two shows a more quadratic relationship. Dataset 3 generally follows a linear trend but this is skewed by a clear outlier. Finally, dataset four is a straight line of the datapoints, and there is one outlier. Therefore, the summary statistics were obscruring the true patterns that can only be seen with plotting the datasets. 

# would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset? 
No, because there is not a linear pattern for each one  It would only be appropriate for dataset 3. 

# what conclusions can you draw for the plots and summary statistics? 
The three datasets are extremely different. Trying to fit them into a linear model would not be appropriate, and running a correlation (all the same 0.81) does not show the proper relationships between x and y variables. 

## PROBLEM 2 ## 
#(adapt code from problem 1 if encessary)

# load in the datasaurus dataset
datasaurus_dozen = readRDS("datasaurus_dozen.rds")

# explore the different datasets in datasaurus_dozen 
datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  ) 

# print descriptive statistics and make a nicely formatted table 
There are 13 different shapes. The mean of each variable is the same, they vary in range. The correlation of the variables is -0.06 for each of them. 

# calculate the correlations for x and y 
The correlations for all of them are -0.06, meaning there is no correlation between x and y. None of them have a linear correlation between x and y variables. 

# Plot their relationships including the line of best fit. 
ggplot(datasaurus_dozen, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset) 

# Save the plot 