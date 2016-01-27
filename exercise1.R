#### Exercise 1 ###

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
require(fueleconomy)

# You should have have access to the vehicles data.frame


# Create a data.frame of vehicles from 1997
vehicles_1997 <- vehicles[vehicles$year == 1997, ]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles_1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two_wheel <- vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20, ]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst_hwy_mpg <- two_wheel$id[two_wheel$hwy == min(two_wheel$hwy)]

# Write a function that takes a year and a make as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
most_hwy_mpg <- function(make, year) {
  car_by_make_year <- vehicles[vehicles$year == year & vehicles$make == make, ]
  most_mpg_car <- car_by_make_year[car_by_make_year$hwy == max(car_by_make_year$hwy), ]
  return(most_mpg_car)
}

# What was the most efficient honda model of 1995?
most_hwy_mpg('Honda', 1995)





