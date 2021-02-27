
# Library -----------------------------------------------------------------

library(ggmap)


# API Key -----------------------------------------------------------------

#1. Get API Key

api <- "AIzaSyAtxMTla-qDSHDIINSSK1Bqfc74yjZlKeg"

#2. Register Key

register_google(key = api)


# Generate Map ------------------------------------------------------------

# Save map for New York
NYCMap <- get_map("New York", zoom = 11)


# Visualize the New York map
ggmap(NYCMap)
ggsave("output/01_NYCMap.png")

# Layer Points on Map -----------------------------------------------------


# Create a data point
statueOfLiberty <- data.frame(lon = -74.0445,
                              lat = 40.6892)


# Layer the data point on top of the NYC Map.
ggmap(NYCMap) +
  geom_point(data = statueOfLiberty,
             aes(x = lon, y = lat),
             size = 4) +
  labs(title = "Statue of Liberty")
ggsave("output/02_Liberty.png")


# Example with more data --------------------------------------------------

# Load data
df <- read.csv("data/uber-apr14-subset.csv")
df <- df[1:50000, ]

# Layer the data point on top of the NYC Map.
ggmap(NYCMap) +
  geom_point(data = df,
             aes(x = Lon, 
                 y = Lat, 
                 color = Base),
             size = 1) +
  labs(title = "Uber Subset (Apr 2014)")
ggsave("output/03_uber.png")

colnames(df)
str(df)


# Florida Example ---------------------------------------------------------

FL <- get_map("Florida", zoom = 6)
ggmap(FL)
ggsave("output/04_florida.png")
