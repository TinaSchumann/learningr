source(here::here("R/package-loading.R"))

glimpse(NHANES)

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

NHANES %>%
  colnames() %>%
  length()

NHANES %>%
  mutate(Height = Height/100,
         Testing = "yes",
         HighlyActive = if_else(
           PhysActiveDays >= 5,
           "yes",
           "no"
         ))

NHANES_update <- NHANES %>%
  mutate(UrineVolAverage = (UrineVol1 + UrineVol2) / 2)

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(
    # 1. Calculate average urine volume
    UrineVolAverage = (UrineVol1 + UrineVol2) / 2,
    # 2. Modify Pulse variable
    Pulse = Pulse / 60,
    # 3. Create YoungChild variable using a condition
    YoungChild = if_else(Age < 6, TRUE, FALSE)
  )
NHANES_modified


# selecting variables -----------------------------------------------------

NHANES %>%
  select(Gender, BMI)


NHANES %>%
  select(BMI)

NHANES %>%
  select(-BMI)

NHANES %>%
  rename(NumberBabies = nBabies,
         Sex = Gender
  )

NHANES %>%
  select(
    BMI, Gender
  )

NHANES %>%
  filter(Gender !="female")


NHANES %>%
  filter(BMI == 25)

NHANES %>%
  arrange(Age) %>%
  select(Age)

NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)

NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)

# exercise ----------------------------------------------------------------

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == "Yes")

# 2. Working or renting, and not diabetes
NHANES %>%
  filter(Work == "Working" | HomeOwn == "Rent" & Diabetes == "no") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
  NHANES %>%
    arrange(desc(nBabies)) %>%
    select(Age, nBabies)

# group by and summarize --------------------------------------------------

NHANES %>%
    summarise(MaxAge = max(Age, na.rm = TRUE
    ),
    MinBMI = min(BMI, na.rm = TRUE)
    )


NHANES %>%
  group_by(Gender, Work) %>%
  summarise(MeanBMI = mean(BMI, na.rm = TRUE))


NHANES %>%
  group_by(Gender) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))


# conversion to long form -------------------------------------------------

table4b %>%
  gather(year, population, -country)

table4b %>%
  gather(population, country, -year)

NHANES_simple <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)

NHANES_long <- NHANES_simple %>%
  gather(measure, Value, -SurveyYr, -Gender)

NHANES_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValue = mean(Value, na.rm = TRUE))

table2 %>%
  spread(type, count)


NHANES

NHANES %>%
  filter(Age >= 18, Age <= 75) %>%
  select(Age, AgeDiabetesDiagnosis, BMI, BPDiaAve, BPSysAve, DrinksOfAlcoholInDay, MoreThan5DaysActive, NumberOfBabies, Poverty, TotalCholesterol)

?NHANES


NHANES %>%
  rename(DrinksOfAlcoholInDay = AlcoholDay,
         NumberOfBabies = nBabies,
         AgeDiabetesDiagnosis = DiabetesAge,
         TotalCholesterol = TotChol
  )

NHANES

NHANES %>%
  filter(Age >= 18, Age <= 75)

NHANES %>%
  rename(DrinksOfAlcoholInDay = AlcoholDay,
         NumberOfBabies = nBabies,
         AgeDiabetesDiagnosis = DiabetesAge,
         TotalCholesterol = TotChol
  )

NHANES %>%
  mutate(MoreThan5DaysActive = if_else(PhysActiveDays >= 5, "yes", "no"))

NHANES %>%
  filter(Age >= 18, Age <= 75) %>%
  select(Age, AgeDiabetesDiagnosis, BMI, BPDiaAve, BPSysAve, DrinksOfAlcoholInDay, MoreThan5DaysActive, NumberOfBabies, Poverty, TotalCholesterol)
