# Coursera Getting and Cleaning Data Week 4 Assignment
# Isha Lamboo
#
# 
#
#
library(dplyr)

# Download and unzip the data file
#
# The dataset is belongs to of this publication:
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
# Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.
# International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
#
# Per instructions, the script doesn't have to download the data. Leaving this here for testing.
# Assumption is that the dataset has been unzipped into the working directory with its main folder intact.
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip','Dataset.zip')
#unzip('Dataset.zip')

# Collect feature names and format them in a way that is suitable for column names in R.
raw_features <- read.csv('UCI HAR Dataset/features.txt',header = FALSE,sep = ' ',col.names = c('ID','Field'),stringsAsFactors = FALSE)
feature_names <- raw_features[,2]
field_names <- gsub("[(),]","",feature_names)
field_names <- gsub("-","_",field_names)

# Read test data, supplying column names
test_data <- read.table('UCI HAR Dataset/test/X_test.txt',header = FALSE,col.names = field_names, colClasses = c("double"))

# Read and join activity labels and subject IDs for test data.
labels <- read.table('UCI HAR Dataset/activity_labels.txt',header = FALSE, col.names = c('Label_ID','activity'))
test_labels <- read.table('UCI HAR Dataset/test/y_test.txt',header = FALSE, col.names = 'Label_ID')
test_activities <- merge(test_labels,labels)
test_subjects <- read.table('UCI HAR Dataset/test/subject_test.txt',header = FALSE, col.names = 'Subject_ID')
test_table <- cbind(test_subjects,test_activities,test_data)

# Read training data, supplying column names
train_data <- read.table('UCI HAR Dataset/train/X_train.txt',header = FALSE,col.names = field_names, colClasses = c("double"))

# Read and join activity labels and subject IDs for training data.
train_labels <- read.table('UCI HAR Dataset/train/Y_train.txt',header = FALSE, col.names = 'Label_ID')
train_activities <- merge(train_labels,labels)
train_subjects <- read.table('UCI HAR Dataset/train/subject_train.txt',header = FALSE, col.names = 'Subject_ID')
train_table <- cbind(train_subjects,train_activities,train_data)

# Combine and convert to dplyr tibble.
test_train_table <- tbl_df(rbind(test_table,train_table))
# Select only the requested variables using dplyr select.
tidy_table <- select(test_train_table,activity,subject_id = Subject_ID,contains("mean"),contains("std"),-contains("meanFreq"),-starts_with("angle"))

# Write the output
write.table(tidy_table,file = "Getting_Data_Week4_Tidy_Table.txt",row.names = FALSE)

# Write the field names to file for a codebook, not part of the script
# only enable for refreshing the codebook.
# codebook <- names(tidy_table)
# write.table(codebook,file = "Getting_Data_week4_Codebook.txt",row.names = FALSE, quote = FALSE, col.names = FALSE)

# Clean up of temp variables
rm(list=ls(pattern="^(test|train|raw)"))

# Step 5: Create summary of average values by activity and subjects
avg_by_activity_subject <- tidy_table %>% 
  group_by(activity,subject_id) %>%
  summarize_all(mean) %>%
  rename_all(funs(sub("(.+)","avg_\\1",.))) %>%
  rename(activity = avg_activity, subject_id = avg_subject_id)

# Write the summary output
write.table(avg_by_activity_subject,file = "Getting_Data_Week4_Summary_Table.txt",row.names = FALSE)
