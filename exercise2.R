#### Exercise 2 ###

# Install devtools package: allows installations from GitHub
#install.packages('devtools')

# Install "fueleconomy" package from GitHub
# devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
# library(fueleconomy)

# You should have have access to the vehicles data.frame
# View(vehicles)

# Create a data.frame of vehicles from 1997 (using dplyr)
vehicle_1997_dplyr <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicle_1997_dplyr$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city (using dplyr)
two_wheel_dplyr <- filter(vehicles, drive == '2-Wheel Drive', cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg? (using dplyr)
worst_hwy_mpg_dplyr <- select(filter(two_wheel_dplyr, hwy == min(hwy)), id)

# Write a function that takes a year and a make as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year (using dplyr)
most_hwy_mpg_dplyr <- function(user_make, user_year) {
  filter_make_year <- filter(vehicles, make == user_make, year == user_year)
  filter_hwy_mpg <- filter(filter_make_year, hwy == max(hwy))
  return(filter_hwy_mpg)
}

# What was the most efficient honda model of 1995?
most_hwy_mpg_dplyr('Honda', 1995)

