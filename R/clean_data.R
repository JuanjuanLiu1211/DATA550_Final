
# Read the data 
heart <- read.csv(
  "data/processed.cleveland.data",
  header = FALSE,
  na.strings = "?"
)

# Add column names
names(heart) <- c(
  "age", "sex", "cp", "trestbps", "chol", "fbs",
  "restecg", "thalach", "exang", "oldpeak",
  "slope", "ca", "thal", "num"
)

# Create heart disease groups
heart$heart_disease <- factor(
  ifelse(heart$num == 0, "No heart disease", "Heart disease"),
  levels = c("No heart disease", "Heart disease")
)

# Save the prepared data
dir.create("output", showWarnings = FALSE)
saveRDS(heart, "output/heart_clean.rds")