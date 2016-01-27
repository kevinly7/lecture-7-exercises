#### Exercise 1 ###

# Install devtools package: allows installations from GitHub
# install.packages('devtools')

# Install "fueleconomy" package from GitHub
# devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
# library(fueleconomy)

# You should have have access to the vehicles data.frame
# View(vehicles)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
acuras_2015 <- filter(vehicles, make == 'Acura', year == 2015)
best_acuras_2015 <- filter(acuras_2015, hwy == max(hwy))
select(best_acuras_2015, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
answer <- select(
  filter(
    filter(
      vehicles, make == 'Acura', year == 2015), hwy == max(hwy)
    ), model
)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
answer2 <- vehicles %>%
  filter(make == 'Acura', year == 2015) %>%
    filter(hwy == max(hwy)) %>%
      select(model)
  

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
