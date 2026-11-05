library(dplyr)

# Read the prepared data
heart <- readRDS("output/heart_clean.rds")

# Count missing values
missing_table <- data.frame(
  Variable = names(heart),
  Missing = colSums(is.na(heart))
)

# Summarize patient characteristics by heart disease status
summary_table <- heart %>%
  group_by(heart_disease) %>%
  summarise(
    `Number of patients` = n(),
    `Mean age (years)` = round(mean(age, na.rm = TRUE), 1),
    `Male (%)` = round(mean(sex == 1, na.rm = TRUE) * 100, 1),
    `Mean resting blood pressure (mm Hg)` =
      round(mean(trestbps, na.rm = TRUE), 1),
    `Mean cholesterol (mg/dL)` =
      round(mean(chol, na.rm = TRUE), 1),
    `Mean maximum heart rate` =
      round(mean(thalach, na.rm = TRUE), 1),
    .groups = "drop"
  )

# Save both tables
saveRDS(
  list(missing = missing_table, summary = summary_table),
  "output/tables.rds"
)