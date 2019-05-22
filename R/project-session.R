
weight_kilo<-10
#comment:use alt-minus(-) to make<-
weight_kilo

#vectors:character
c("a","b")
#Numeric
c(1,2)
#Logic
c(TRUE,FALSE)

#data frame
head(iris)

colnames(iris)
str(iris)
summary(iris)


# Exercise ----------------------------------------------------------------

# Object names

day_one
sum_vector <- function(x) sum(x)

# Spacing
x[, 1]

mean(x, na.rm=TRUE)
function(x) {}
height <- feet * 12 + inches
mean(x, na.rm=10)
sqrt(x^2 + y^2)
df$z
x <- 1:10

# Indenting
if (y < 0 && debug) {}
  message("Y is negative")

sd

# Function ----------------------------------------------------------------

sd
add_two <- function(x, y) {
  added <- x + y
  return(added)
}

add_two(1, 2)
add_two(y = 2, x = 1)

library(tidyverse)

source(here::here("R/package-loading.R"))

# Save data ---------------------------------------------------------------

write.csv(iris, here::here("data/iris.csv"))
imported_iris <- read_csv(here::here("data/iris.csv"))
glimpse(imported_iris)
