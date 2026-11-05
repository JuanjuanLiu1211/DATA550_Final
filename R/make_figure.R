library(ggplot2)

# Read the prepared data
heart <- readRDS("output/heart_clean.rds")

# Create the boxplot
heart_plot <- ggplot(
  heart,
  aes(x = heart_disease, y = thalach)
) +
  geom_boxplot() +
  labs(
    title = "Maximum Heart Rate by Heart Disease Status",
    x = "Heart Disease Status",
    y = "Maximum Heart Rate Achieved"
  ) +
  theme_minimal(base_size = 12)

# Save the figure
ggsave(
  filename = "output/maximum_heart_rate.png",
  plot = heart_plot,
  width = 7,
  height = 5,
  units = "in",
  dpi = 150
)