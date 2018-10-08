# Coursera_Getting_Cleaning_Data
Week 4 assignment for Coursera Data Science - Getting and Cleaning Data

==================================================================

Tidy dataset of mean and standard deviation values taken from 
"Human Activity Recognition Using Smartphones Dataset" [1]

The test and training data has been combined with subjects and 
activity labels as present in separate files in the original data.

- subject_id => a reference to the test volunteer.
- activity => the label assigned to each observation manually.
- the remaining fields are processed measurements from the 
  smartphone. Fields are named per the following convention:
    - t/f => time or frequency domain
    - Gravity/Body => this component of total acceleration
    - Acc/Gyro/Jerk => Acceleration or Gyro signal from device, 
      Jerk is processed from both.
    - mean/std => mean or standard deviation in observation window,
    - X/Y/Z => measurement axis, if applicable.

- Features are normalized and bounded within [-1,1].
- List of all fields is in Getting_Data_week4_Codebook.txt

run_analysis.R
==============

Usage: 
1. Unzip the dataset into the working directory
in its original folder structure.
2. Install packages dplyr and tidyr if not present.
3. Run the script.

Details: 
The script reads the codebook and converts the measure names
to acceptable field names. Those are applied to the test and training
data by read.table().

Next supporting data (subject and activity) is read and the columns are
decoded using merge and joined using cbind().

The combined test and train tables are then converted to a dplyr tibble.
This allows fast selection of the desired measures.

At this point the tidy dataset is written to file.

For the last requirement in step 5, dplyr is used again to group and summarize the data.
All measure field names are prefixed with avg_ to indicate they are the average/mean
values per activity and subject.


[1] Original dataset:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
