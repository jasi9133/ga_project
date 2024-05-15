# Load DESeq2 library
library(DESeq2)

# Read in the count data
HP_59 <- read.table("feature_count/SRR24516459", header=TRUE, row.names=1)
HP_60 <- read.table("feature_count/SRR24516460", header=TRUE, row.names=1)
HP_61 <- read.table("feature_count/SRR24516461", header=TRUE, row.names=1)
R7_62 <- read.table("feature_count/SRR24516462", header=TRUE, row.names=1)
R7_63 <- read.table("feature_count/SRR24516463", header=TRUE, row.names=1)
R7_64 <- read.table("feature_count/SRR24516464", header=TRUE, row.names=1)

#combine the data frames
combined_data <- cbind(HP_59, HP_60, HP_61, R7_62, R7_63, R7_64)

# define file names (??)
file_names <- c("SRR24516459", "SRR24516460", "SRR24516461", "SRR24516462", "SRR24516463", "SRR24516464")

#rename columns 
colnames(combined_data) <- file_names

# Write the combined data to a new file
write.table(combined_data, "feature_count/combined_counts.txt", sep="\t", quote=FALSE, row.names=TRUE)

