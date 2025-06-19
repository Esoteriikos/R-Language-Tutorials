# --- Lesson 1: Vectors and Data Types ---

# We use the c() function, which means "combine" or "concatenate".

# 1. NUMERIC vector: For any kind of number (with or without decimals)
# Let's create a vector of temperatures for a week.
weekly_temps <- c(22.5, 24, 25.1, 21.8, 20.9, 23, 24.2)

# Now, let's see what we created.
print(weekly_temps)
# Check its data type.
class(weekly_temps)


# 2. CHARACTER vector: For text data. Always use quotes "" or ''.
# Let's create a vector of days of the week.
days_of_week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")

# See what we created.
print(days_of_week)
# Check its data type.
class(days_of_week)


# 3. LOGICAL vector: For TRUE or FALSE values.
# Let's say this represents whether it rained on those days.
# Note: TRUE and FALSE must be in all caps and have no quotes.
did_it_rain <- c(FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE)

print(did_it_rain)
class(did_it_rain)

# --- Lesson 2: Creating and Inspecting Data Frames ---

# We use the data.frame() function.
weather_data <- data.frame(
  day = days_of_week,
  temperature = weekly_temps,
  rained = did_it_rain
)

# Now 'weather_data' is a complete table. Let's inspect it.
# These are the most important functions you will use every day.

# print() - Shows the whole table. Can be too big for large datasets.
print(weather_data)

# head() - Shows the first 6 rows. Much better for a quick look.
print(head(weather_data))

# str() - The most useful command! It shows the STRucture of your data.
# It tells you it's a 'data.frame', the number of observations (rows) and
# variables (columns), and the name and type of each column.
print(str(weather_data))

# summary() - Gives you a quick statistical summary of each column.
# Notice it calculates mean/median for numbers and counts for text/logicals.
print(summary(weather_data))

# --- Lesson 3: Subsetting Data ---

# Use the '$' to access a column by its name.
# Let's get the temperature column.
all_temperatures <- weather_data$temperature
print(all_temperatures)

# Since this is now a simple numeric vector, we can do math on it.
# Let's find the average temperature for the week.
print(mean(weather_data$temperature))

# Let's find the highest temperature.
print(max(weather_data$temperature))

# --- Subsetting with Square Brackets [rows, columns] ---

# Get the value in the 1st row, 2nd column.
print(weather_data[1, 2])

# Get the entire 3rd row (by leaving the column part blank).
wednesday_data <- weather_data[3, ]
print(wednesday_data)

# Get the entire 'day' column (by leaving the row part blank).
# When using names in brackets, you must use quotes.
day_column <- weather_data[ , "day"]
print(day_column)

# Get rows 1 through 4.
first_four_days <- weather_data[1:4, ]
print(first_four_days)

# Get the 'day' and 'rained' columns for all rows.
# We use c() to select multiple columns.
day_and_rain_data <- weather_data[ , c("day", "rained")]
print(day_and_rain_data)


# --- Mini-Project ---

# 1. Load the data
cars_df <- mtcars

# 2. Inspect the structure
print(str(cars_df))
# The output shows: 32 obs. of 11 variables (32 rows, 11 columns)

# 3. Calculate average MPG
print(mean(cars_df$mpg))
# The answer is 20.09

# 4. Create the subset of efficient cars
# The part inside the brackets `cars_df$mpg > 30` creates a logical vector (TRUE/FALSE)
# R then keeps only the rows where the condition is TRUE.
efficient_cars <- cars_df[cars_df$mpg > 30, ]

# 5. Count the rows in the new data frame
print(nrow(efficient_cars))
# The answer is 4

# 6. Print the new data frame
print(efficient_cars)
