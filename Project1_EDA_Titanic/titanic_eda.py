# ==========================================
# PROJECT 1 - TITANIC EDA PROJECT
# Exploratory Data Analysis in Python
# ==========================================


# ------------------------------------------
# 1. LOAD PACKAGES
# ------------------------------------------

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# ------------------------------------------
# 2. LOAD DATASET
# ------------------------------------------

titanic = pd.read_csv("titanic.csv")


# ------------------------------------------
# 3. INITIAL DATA EXPLORATION
# ------------------------------------------

print(titanic.head())
print(titanic.shape)
print(titanic.columns)
print(titanic.info())
print(titanic.describe())


# ------------------------------------------
# 4. CHECK MISSING VALUES
# ------------------------------------------

print(titanic.isna().sum())


# ------------------------------------------
# 5. DATA CLEANING
# ------------------------------------------

age_mean = titanic["Age"].mean()
titanic_clean = titanic.copy()
titanic_clean["Age"] = titanic_clean["Age"].fillna(age_mean)

fare_median_class3 = titanic_clean.loc[
    titanic_clean["Pclass"] == 3,
    "Fare"
].median()

titanic_clean["Fare"] = titanic_clean["Fare"].fillna(
    fare_median_class3
)

print(titanic_clean.isna().sum())


# ------------------------------------------
# 6. OVERALL SURVIVAL ANALYSIS
# ------------------------------------------

print(titanic_clean["Survived"].value_counts())

survival_rate = titanic_clean["Survived"].mean() * 100
print("Overall Survival Rate:", survival_rate)


# ------------------------------------------
# 7. SURVIVAL BY GENDER
# ------------------------------------------

gender_survival = (
    titanic_clean
    .groupby("Sex")
    .agg(
        passengers=("Survived", "size"),
        survivors=("Survived", "sum"),
        survival_rate=("Survived", "mean")
    )
    .reset_index()
)
gender_survival["survival_rate"] = gender_survival["survival_rate"] * 100
print(gender_survival)


# ------------------------------------------
# 8. SURVIVAL BY PASSENGER CLASS
# ------------------------------------------

class_survival = (
    titanic_clean
    .groupby("Pclass")
    .agg(
        passengers=("Survived", "size"),
        survivors=("Survived", "sum"),
        survival_rate=("Survived", "mean")
    )
    .reset_index()
)
class_survival["survival_rate"] = class_survival["survival_rate"] * 100
print(class_survival)


# ------------------------------------------
# 9. AGE ANALYSIS
# ------------------------------------------

average_age = titanic_clean["Age"].mean()
print("Overall Average Age:", average_age)

average_age_gender = (
    titanic_clean.groupby("Sex")["Age"].mean().reset_index()
)
print(average_age_gender)

average_age_class = (
    titanic_clean.groupby("Pclass")["Age"].mean().reset_index()
)
print(average_age_class)


# ------------------------------------------
# 10. SURVIVAL BY CLASS AND GENDER
# ------------------------------------------

class_gender_survival = (
    titanic_clean
    .groupby(["Pclass", "Sex"])
    .agg(
        passengers=("Survived", "size"),
        survivors=("Survived", "sum"),
        survival_rate=("Survived", "mean")
    )
    .reset_index()
)
class_gender_survival["survival_rate"] = class_gender_survival["survival_rate"] * 100
print(class_gender_survival)


# ------------------------------------------
# 11. VISUALIZATION - SURVIVAL BY GENDER
# ------------------------------------------

sns.countplot(data=titanic_clean, x="Sex", hue="Survived")
plt.title("Survival by Gender")
plt.xlabel("Gender")
plt.ylabel("Number of Passengers")
plt.legend(title="Survived")
plt.show()


# ------------------------------------------
# 12. VISUALIZATION - AGE DISTRIBUTION
# ------------------------------------------

plt.hist(titanic_clean["Age"], bins=20)
plt.title("Age Distribution of Titanic Passengers")
plt.xlabel("Age")
plt.ylabel("Number of Passengers")
plt.show()


# ------------------------------------------
# 13. VISUALIZATION - SURVIVAL BY CLASS
# ------------------------------------------

sns.countplot(data=titanic_clean, x="Pclass", hue="Survived")
plt.title("Survival by Passenger Class")
plt.xlabel("Passenger Class")
plt.ylabel("Number of Passengers")
plt.legend(title="Survived")
plt.show()


# ------------------------------------------
# 14. VISUALIZATION - AGE BY SURVIVAL
# ------------------------------------------

sns.histplot(
    data=titanic_clean,
    x="Age",
    hue="Survived",
    bins=20,
    multiple="layer",
    alpha=0.6
)
plt.title("Age Distribution by Survival")
plt.xlabel("Age")
plt.ylabel("Number of Passengers")
plt.show()


# ------------------------------------------
# Key Insights:
#
# - Females had a significantly higher survival rate than males
# - 1st class passengers had higher survival rate than 3rd class
# - Most passengers were between approximately 20 and 40 years old
# - Age alone did not show a clear survival pattern
# ------------------------------------------


# ------------------------------------------
# 15. END OF PROJECT
# ------------------------------------------

print("Project 1 Titanic EDA completed!")
