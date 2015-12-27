### ---------------------------------------------------------------------------------------------------------------
### ------------------------------------------------ Codebook --------------------------------------------------
### ---------------------------------------------------------------------------------------------------------------

This document describes the variables of the output data set and summaries used to calculate the values, along with units and any other relevant information.

The [first section](#input-data) summarizes relevant parts from the input data codebook. The [next section](#output-variables) describes the output variables with their units. The [last section](#transformations) describes the transformations used to calculate the output values.

### ---------------------------------------------------------------------------------------------------------------
###---------------------------------------------------- Input Data ------------------------------------------------
### ---------------------------------------------------------------------------------------------------------------

The original data set contains a codebook that describes the data set. In this section those parts of the orginal codebook have been I repeated which are relevant to generate the tidy data set.

The input data contains data recorded from the accelerometer and the gyroscope of a smartphone while the person who carried the smartphone was performing one of the following six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

##------------------------------------------------------ Input Data Variables -------------------------------------

From the raw measurements, several other values were derived. The input dataset contains data for the following variables:

|      Variable     |     source    |   domain  |
| ----------------- | ------------- | --------- |
| tBodyAcc-XYZ      | accelerometer | time      |
| tGravityAcc-XYZ   | accelerometer | time      |
| tBodyAccJerk-XYZ  | accelerometer | time      |
| tBodyAccMag       | accelerometer | time      |
| tGravityAccMag    | accelerometer | time      |
| tBodyAccJerkMag   | accelerometer | frequency |
| fBodyAcc-XYZ      | accelerometer | frequency |
| fBodyAccJerk-XYZ  | accelerometer | frequency |
| fBodyAccMag       | accelerometer | frequency |
| fBodyAccJerkMag   | accelerometer | frequency |
| tBodyGyro-XYZ     | gyroscope     | time      |
| tBodyGyroJerk-XYZ | gyroscope     | time      |
| tBodyGyroMag      | gyroscope     | time      |
| tBodyGyroJerkMag  | gyroscope     | time      |
| fBodyGyro-XYZ     | gyroscope     | frequency |
| fBodyGyroMag      | gyroscope     | frequency |
| fBodyGyroJerkMag  | gyroscope     | frequency |

The table above also shows the source for each variable and the domain it belongs to. Variable names ending with XYZ denote 3-axial variables. The dataset contains one separate variable for each axis.

The original sensor data was recorded at a rate of 50 Hz. The data was grouped into fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). Several functions where applied to these windows to compute the input features. The functions include: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* and many others.

In total, each input record contains 651 features.

## -----------------------------------------------------Input Data Units ------------------------------------------

The accelerometer data is measured in standard gravity units 'g'. The gyroscope data is measured in radians/second.

The input features are normalized and bounded within the interval [-1,1]. During normalization the units have been divided by themselves so units have been cancelled.

## ---------------------------------------------------- Structure of the input data -------------------------------

The input data is split into two subsets: a training set and a test set. Each subsets consists of three files:

* A features file (train/X_train.txt and test/X_test.txt) with one feature vector per row
* A label with one activity label per row (train/y_train.txt and test/y_test.txt)
* A file with a subject id per row (train/subject_train.txt and test/subject_test.txt)

The names of the features are listed in the file features.txt.

Additionally, the input contains the file activity_labels.txt which links the class labels with their activity name.

The input data set also contains the raw measurement data that was used to compute the features. This raw data is not beeing used in this project.

### ---------------------------------------------------------------------------------------------------------------
### ---------------------------------------------------- Output Variables -----------------------------------------
### ---------------------------------------------------------------------------------------------------------------

The following table shows a table with all variables in the output file. The first column in the table shows the column number of the variable, the second column shows the variable name and column three shows the source variable used to compute the value of the variable.

| Colmun |                         Variable                        |        source variable        |
| ------ | :------------------------------------------------------ | :---------------------------- |
|      1 | subject                                                 | subject id from subjects file |
|      2 | activity                                                | activity id from labels file  |
|      3 | timeBodyAccelerometer-mean()-X                          | tBodyAcc-mean()-X             |
|      4 | timeBodyAccelerometer-mean()-Y                          | tBodyAcc-mean()-Y             |
|      5 | timeBodyAccelerometer-mean()-Z                          | tBodyAcc-mean()-Z             |
|      6 | timeBodyAccelerometer-std()-X                           | tBodyAcc-std()-X              |
|      7 | timeBodyAccelerometer-std()-Y                           | tBodyAcc-std()-Y              |
|      8 | timeBodyAccelerometer-std()-Z                           | tBodyAcc-std()-Z              |
|      9 | timeGravityAccelerometer-mean()-X                       | tGravityAcc-mean()-X          |
|     10 | timeGravityAccelerometer-mean()-Y                       | tGravityAcc-mean()-Y          |
|     11 | timeGravityAccelerometer-mean()-Z                       | tGravityAcc-mean()-Z          |
|     12 | timeGravityAccelerometer-std()-X                        | tGravityAcc-std()-X           |
|     13 | timeGravityAccelerometer-std()-Y                        | tGravityAcc-std()-Y           |
|     14 | timeGravityAccelerometer-std()-Z                        | tGravityAcc-std()-Z           |
|     15 | timeBodyAccelerometerJerk-mean()-X                      | tBodyAccJerk-mean()-X         |
|     16 | timeBodyAccelerometerJerk-mean()-Y                      | tBodyAccJerk-mean()-Y         |
|     17 | timeBodyAccelerometerJerk-mean()-Z                      | tBodyAccJerk-mean()-Z         |
|     18 | timeBodyAccelerometerJerk-std()-X                       | tBodyAccJerk-std()-X          |
|     19 | timeBodyAccelerometerJerk-std()-Y                       | tBodyAccJerk-std()-Y          |
|     20 | timeBodyAccelerometerJerk-std()-Z                       | tBodyAccJerk-std()-Z          |
|     21 | timeBodyGyroscope-mean()-X                              | tBodyGyro-mean()-X            |
|     22 | timeBodyGyroscope-mean()-Y                              | tBodyGyro-mean()-Y            |
|     23 | timeBodyGyroscope-mean()-Z                              | tBodyGyro-mean()-Z            |
|     24 | timeBodyGyroscope-std()-X                               | tBodyGyro-std()-X             |
|     25 | timeBodyGyroscope-std()-Y                               | tBodyGyro-std()-Y             |
|     26 | timeBodyGyroscope-std()-Z                               | tBodyGyro-std()-Z             |
|     27 | timeBodyGyroscopeJerk-mean()-X                          | tBodyGyroJerk-mean()-X        |
|     28 | timeBodyGyroscopeJerk-mean()-Y                          | tBodyGyroJerk-mean()-Y        |
|     29 | timeBodyGyroscopeJerk-mean()-Z                          | tBodyGyroJerk-mean()-Z        |
|     30 | timeBodyGyroscopeJerk-std()-X                           | tBodyGyroJerk-std()-X         |
|     31 | timeBodyGyroscopeJerk-std()-Y                           | tBodyGyroJerk-std()-Y         |
|     32 | timeBodyGyroscopeJerk-std()-Z                           | tBodyGyroJerk-std()-Z         |
|     33 | timeBodyAccelerometerMagnitude-mean()                   | tBodyAccMag-mean()            |
|     34 | timeBodyAccelerometerMagnitude-std()                    | tBodyAccMag-std()             |
|     35 | timeGravityAccelerometerMagnitude-mean()                | tGravityAccMag-mean()         |
|     36 | timeGravityAccelerometerMagnitude-std()                 | tGravityAccMag-std()          |
|     37 | timeBodyAccelerationJerkMagnitude-mean()                | tBodyAccJerkMag-mean()        |
|     38 | timeBodyAccelerationJerkMagnitude-std()                 | tBodyAccJerkMag-std()         |
|     39 | timeBodyGyroscopeMagnitude-mean()                       | tBodyGyroMag-mean()           |
|     40 | timeBodyGyroscopeMagnitude-std()                        | tBodyGyroMag-std()            |
|     41 | timeBodyGyroscopeJerkMagnitude-mean()                   | tBodyGyroJerkMag-mean()       |
|     42 | timeBodyGyroscopeJerkMagnitude-std()                    | tBodyGyroJerkMag-std()        |
|     43 | frequencyBodyAccelerometer-mean()-X                     | fBodyAcc-mean()-X             |
|     44 | frequencyBodyAccelerometer-mean()-Y                     | fBodyAcc-mean()-Y             |
|     45 | frequencyBodyAccelerometer-mean()-Z                     | fBodyAcc-mean()-Z             |
|     46 | frequencyBodyAccelerometer-std()-X                      | fBodyAcc-std()-X              |
|     47 | frequencyBodyAccelerometer-std()-Y                      | fBodyAcc-std()-Y              |
|     48 | frequencyBodyAccelerometer-std()-Z                      | fBodyAcc-std()-Z              |
|     49 | frequencyBodyAccelerometerJerk-mean()-X                 | fBodyAccJerk-mean()-X         |
|     50 | frequencyBodyAccelerometerJerk-mean()-Y                 | fBodyAccJerk-mean()-Y         |
|     51 | frequencyBodyAccelerometerJerk-mean()-Z                 | fBodyAccJerk-mean()-Z         |
|     52 | frequencyBodyAccelerometerJerk-std()-X                  | fBodyAccJerk-std()-X          |
|     53 | frequencyBodyAccelerometerJerk-std()-Y                  | fBodyAccJerk-std()-Y          |
|     54 | frequencyBodyAccelerometerJerk-std()-Z                  | fBodyAccJerk-std()-Z          |
|     55 | frequencyBodyGyroscope-mean()-X                         | fBodyGyro-mean()-X            |
|     56 | frequencyBodyGyroscope-mean()-Y                         | fBodyGyro-mean()-Y            |
|     57 | frequencyBodyGyroscope-mean()-Z                         | fBodyGyro-mean()-Z            |
|     58 | frequencyBodyGyroscope-std()-X                          | fBodyGyro-std()-X             |
|     59 | frequencyBodyGyroscope-std()-Y                          | fBodyGyro-std()-Y             |
|     60 | frequencyBodyGyroscope-std()-Z                          | fBodyGyro-std()-Z             |
|     61 | frequencyBodyAccelerometerMagnitude-mean()              | fBodyAccMag-mean()            |
|     62 | frequencyBodyAccelerometerMagnitude-std()               | fBodyAccMag-std()             |
|     63 | frequencyBodyAccelerometerJerkMagnitude-mean()          | fBodyBodyAccJerkMag-mean()    |
|     64 | frequencyBodyAccelerometerJerkMagnitude-std()           | fBodyBodyAccJerkMag-std()     |
|     65 | frequencyBodyGyroscopeMagnitude-mean()                  | fBodyBodyGyroMag-mean()       |
|     66 | frequencyBodyGyroscopeMagnitude-std()                   | fBodyBodyGyroMag-std()        |
|     67 | frequencyBodyGyroscopeJerkMagnitude-mean()              | fBodyBodyGyroJerkMag-mean()   |
|     68 | frequencyBodyGyroscopeJerkMagnitude-std()               | fBodyBodyGyroJerkMag-std()    |

* Column 1 holds the unmodified subject id from the input data.
* Column 2 holds a readable activity name for the activity id in the lables file
* The remaining columns with holds the average of all values for the source variable for a given subject and activity.


The source variables consist of the following parts:

* The first letter defines the domain: t for time or f for frequency
* The next part defines the source variable: BodyAcc (BodyAcceleration), GravityAcc (GravityAcceleration) or BodyGyro (BodyGyroscope)
* The next (optional) part describes the method that was used to derive the variable: Mag (Magnitued), Jerk or JerkMag (JerkMagnitude)
* The part after the dash describes the function that was used to compute the feature mean (Mean) or std (Standarddeviation)
* In case of three axial measurements, the last part of the variable defines the axis (X, Y or Z)

## ------------------------------------------------------  Variable Units -----------------------------------------

* subject: identifier of an observed volunteer within an age bracket of 19-48 years
    * Data type: Numeric
    * Value range: 1 - 30
* activity: Label string of the observed activity a person was performing
    * Data type: factor
    * Labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* Rows 3 - 68: Average  of selected features per subjectid and activityname 
    * Data type: Have the same units as their input data. Due to the normalization they do not have units attached see [Input Data Units](#input-data-units)
    * Value range: [-1, 1]


## ------------------------------------------------------- Additional notes ---------------------------------------

* Some input variable names contain the string 'BodyBody'. They have been transformed to the string 'Body'.



### ---------------------------------------------------------------------------------------------------------------
### ----------------------------------------------------- Transformations -----------------------------------------
### ---------------------------------------------------------------------------------------------------------------

* Training and test data sets have been merged to create one data set by
   + Concatenating data tables by rows
   + Merging columns to get the data frame Data for all data
   
* Measurements on the mean and standard deviation for each measurement have been extracted by
  + Subsetting Name of Features by measurements on the mean and standard deviation
  + Subsetting data frame Data by seleted names of Features
  
* Descriptive activity names have ben used to name the activities in the data set by 
  + Reading descriptive activity names from “activity_labels.txt”
  + Facorizing Variale activity in the data frame Data using descriptive activity names

* Data set has been appropriately labeled with descriptive activity names as per the following
  + prefix t is replaced by time
  + Acc is replaced by Accelerometer
  + Gyro is replaced by Gyroscope
  + prefix f is replaced by frequency
  + Mag is replaced by Magnitude
  + BodyBody is replaced by Body

* Output is created as an independent tidy data set with the average of each variable for each activity and each subject.
