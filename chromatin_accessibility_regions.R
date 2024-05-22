library(dplyr)
library(ggplot2)

# Load the data from a tab-delimited text file
data <- read.delim("results/chromatin_accessibility.txt", header = TRUE, stringsAsFactors = FALSE)

# Extract the column containing region information
regions <- data$Annotation

# Clean region names if necessary (optional)
regions <- gsub(" .*", "", regions)  # This removes anything after a space

# Count the occurrences of each region type
region_counts <- table(regions)

# Convert to a data frame for plotting
region_df <- as.data.frame(region_counts)
colnames(region_df) <- c("Region", "Count")

# Plot the data
ggplot(region_df, aes(x = reorder(Region, -Count), y = Count, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Proportion of Accessible Chromatin Regions",
       x = "Region Type",
       y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot to a file
ggsave("results/chromatin_regions.png", width = 10, height = 8, dpi = 300)
