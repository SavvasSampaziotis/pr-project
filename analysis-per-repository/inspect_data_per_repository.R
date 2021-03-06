# 
# Temporary script for playing around with the dataset.
# 
# 
# Author: Savvas

rm(list = ls());

# Load Data
source('./utilities/load_and_omit_dataset.R')

# Choose a repository. i must bemetween 1~240 
i = 2
subset <- data_t[data_t$repository_name==rep_names[i],]

# Ditch columns 1 and 2, since the� are non-numerical and add no value to the process. 
subset <- subset[,c(-1,-2)]

## Test area ##

# Perform Scale and centering.
subset_sd = scale(x=subset, center = TRUE)   # x' = (x-E[x])/�

#Perform Exp scale
subset_sm = scale(x=subset_sd, scale = rep(1,24)) # x' = x/2� 
subset_sm <- 1/(1+exp(-subset_sm)) 


# plot stuff
par(mfcol=c(2,1),mar = rep(2, 4))
boxplot(subset_sd, main="SD-scaled sub-Dataset")
boxplot(subset_sm, main="Softmax-Scaled sub-Dataset")

## End of test Area ##



