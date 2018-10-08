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
[1] Original dataset:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
