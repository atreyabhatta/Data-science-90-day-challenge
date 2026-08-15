# ==========================================
# DAY 24 - TITANIC EDA PROJECT
# Exploratory Data Analysis in R
# ==========================================


# ------------------------------------------
# 1. LOAD PACKAGES
# ------------------------------------------

library(dplyr)
library(tidyr)
library(ggplot2)


# ------------------------------------------
# 2. LOAD DATASET
# ------------------------------------------

titanic <- read.csv("titanic.csv")


# ------------------------------------------
# 3. INITIAL DATA EXPLORATION
# ------------------------------------------

# First 6 rows
head(titanic)

# Number of rows and columns
dim(titanic)

# Column names
colnames(titanic)

# Structure of dataset
str(titanic)

# Summary statistics
summary(titanic)


# ------------------------------------------
# 4. CHECK MISSING VALUES
# ------------------------------------------

colSums(is.na(titanic))


# ------------------------------------------
# 5. DATA CLEANING
# ------------------------------------------

# Fill missing Age values with mean Age
# Fill missing Fare using median Fare for the
# corresponding passenger class

titanic_clean <- titanic %>%
  mutate(
    Age = ifelse(
      is.na(Age),
      mean(Age, na.rm = TRUE),
      Age
    ),
    Fare = ifelse(
      is.na(Fare),
      median(Fare[Pclass == 3], na.rm = TRUE),
      Fare
    )
  )


# Check missing values after cleaning

colSums(is.na(titanic_clean))


# ------------------------------------------
# 6. OVERALL SURVIVAL ANALYSIS
# ------------------------------------------

# Number of survivors and non-survivors

titanic_clean %>%
  count(Survived)


# Overall survival rate

titanic_clean %>%
  summarize(
    survival_rate = mean(Survived) * 100
  )


# ------------------------------------------
# 7. SURVIVAL BY GENDER
# ------------------------------------------

titanic_clean %>%
  group_by(Sex) %>%
  summarize(
    passengers = n(),
    survivors = sum(Survived),
    survival_rate = mean(Survived) * 100,
    .groups = "drop"
  )


# ------------------------------------------
# 8. SURVIVAL BY PASSENGER CLASS
# ------------------------------------------

titanic_clean %>%
  group_by(Pclass) %>%
  summarize(
    passengers = n(),
    survivors = sum(Survived),
    survival_rate = mean(Survived) * 100,
    .groups = "drop"
  )


# ------------------------------------------
# 9. AGE ANALYSIS
# ------------------------------------------

# Overall average age

titanic_clean %>%
  summarize(
    average_age = mean(Age)
  )


# Average age by gender

titanic_clean %>%
  group_by(Sex) %>%
  summarize(
    average_age = mean(Age),
    .groups = "drop"
  )


# Average age by passenger class

titanic_clean %>%
  group_by(Pclass) %>%
  summarize(
    average_age = mean(Age),
    .groups = "drop"
  )


# ------------------------------------------
# 10. SURVIVAL BY CLASS AND GENDER
# ------------------------------------------

titanic_clean %>%
  group_by(Pclass, Sex) %>%
  summarize(
    passengers = n(),
    survivors = sum(Survived),
    survival_rate = mean(Survived) * 100,
    .groups = "drop"
  )


# ------------------------------------------
# 11. VISUALIZATION - SURVIVAL BY GENDER
# ------------------------------------------

ggplot(
  titanic_clean,
  aes(x = Sex, fill = factor(Survived))
) +
  geom_bar(position = "dodge") +
  labs(
    title = "Survival by Gender",
    x = "Gender",
    y = "Number of Passengers",
    fill = "Survived"
  )


# ------------------------------------------
# 12. VISUALIZATION - AGE DISTRIBUTION
# ------------------------------------------

ggplot(
  titanic_clean,
  aes(x = Age)
) +
  geom_histogram(bins = 20) +
  labs(
    title = "Age Distribution of Titanic Passengers",
    x = "Age",
    y = "Number of Passengers"
  )


# ------------------------------------------
# 13. VISUALIZATION - SURVIVAL BY CLASS
# ------------------------------------------

ggplot(
  titanic_clean,
  aes(
    x = factor(Pclass),
    fill = factor(Survived)
  )
) +
  geom_bar(position = "dodge") +
  labs(
    title = "Survival by Passenger Class",
    x = "Passenger Class",
    y = "Number of Passengers",
    fill = "Survived"
  )


# ------------------------------------------
# 14. VISUALIZATION - AGE BY SURVIVAL
# ------------------------------------------

ggplot(
  titanic_clean,
  aes(
    x = Age,
    fill = factor(Survived)
  )
) +
  geom_histogram(
    bins = 20,
    position = "identity",
    alpha = 0.6
  ) +
  labs(
    title = "Age Distribution by Survival",
    x = "Age",
    y = "Number of Passengers",
    fill = "Survived"
  )



# ------------------------------------------
# Key Insights:

- Most passengers were between approximately 20 and 40 years old.
- Both survivors and non-survivors were present across most age groups.
- Age alone did not show a clear survival pattern.
- Non-survivors were generally more numerous than survivors across many age groups.
# ------------------------------------------


# ------------------------------------------
# 15. END OF PROJECT
# ------------------------------------------

# Day 24 Titanic EDA completed
