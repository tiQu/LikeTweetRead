## Simple segmentation based on Quintiles 
# This script serves as example for some R functions and the underlying "grammar" of the language.
# R comes with some in-built datasets that users can practice functions on. In this case, the "mtcars" dataset will serve as example for how to create a segmentation based on quintiles for the miles per gallon variable from this dataset.

# Looking at the MPG variable in the dataset mtcars. This function returns the minimum, maximum, 1st and 3rd quartile, mean, and median of this continuous variable.
summary(mtcars$mpg)

# To build this segmentation, the two packages "plyr" and "Hmisc" are required. R neads to load them in order to user the functions they contain. 
require(plyr)
require(Hmisc)

# This line tells R to build a new variable ("mutate") based on the distribution of MPG ("cut2(mtcars$mpg,") and create this variable so that the cases are grouped into five equally big groups ("g=5"). This variable is going to be called mpg2 and added to the mtcars dataset by pointing it to this set (" <- ").
mtcars <- mutate(mtcars2,mpg2=cut2(mtcars$mpg,g=5))

# Looking at the new variable in the dataset. For mpg2, this function returns how many cases fall into which category of mpg2 and where the cut lines are. Round brackets indicate that this value is excluded from this category, square bracket means it is included in this category.
summary(mtcars$mpg2)
