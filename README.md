# Getting-and-Cleaning-Data-Course-Project

The files in this folder provide a solution for the Coursera "Getting And Cleaning Data" course project. The course project works with the "Human Activity Recognition Using Smartphones Dataset" from the UCI Machine Learning Repository. A description of the dataset can be found at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The dataset can be downloaded at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## The Transformation Script run_analysis.R

The file run_analysis.R contains an R script for transforming the original dataset into a second dataset according to the following rules:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Running The Script

The script requires the packages data.table and plyr.

The script assumes that the extracted dataset folder# `UCI HAR Dataset` and code file# `run_analysis.R` are available in the current working directory.

To run the script ```run_analysis.R```:

1. put it into the parent folder of ```UCI HAR Dataset```
2. launch an R session and change into that directory using the ```setwd``` command
3. type ```source("run_analysis.R")``` to execute the script

The script will read the test and training data from the folder ```UCI HAR Dataset```, apply the transformations listed above and write the result to the file "tidydata.txt" in the current working directory.

The file "tidydata.txt" can be read into a data.frame using

```R
read.table("tidydata.txt", header = TRUE)
```

### Explanation Of The Script

#### Merging Of Test And Training Set

Requirement 1 states: "Merges the training and the test sets to create one data set." To achive this, the run_analysis.R script loads the three input files (subject data, activity data and feature data) for each of the two datasets, concatenates two data set tables by rows and finally merges columns to get the resultant one big data frame. The subject and activity form the first two column, the features are contained in the remaining columns.

#### Mean And Standard Deviation

Requirement 2 states: "Extracts only the measurements on the mean and standard deviation for each measurement." To achive this, the run_analysis.R script loads the feature names from the file "features.txt",  subsets name of Features by measurements on the mean and standard deviation and finally subsets the data frame Data by seleted names of Features. The output results in selection of 66 features with subject and activity totalling to 68 columns.

#### Activity Labels

Requirement 3 states: "Uses descriptive activity names to name the activities in the data set." To achive this, run_analysis.R script reads descriptve activity names from the file "activity_labels.txt" and facorize Variale activity in the data frame Data using these descriptive activity names.

#### Variable Names

Requirement 4 states: "Appropriately labels the data set with descriptive variable names." To achive this, run_analysis.R script have used the following rules to create descriptive variable names:

** prefix t is replaced by time
** Acc is replaced by Accelerometer
** Gyro is replaced by Gyroscope
** prefix f is replaced by frequency
** Mag is replaced by Magnitude
** BodyBody is replaced by Body


#### Tidy data

Requirement 5 states: "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

The run_analysis.R script outputs data to a tidy data text file named "tidydata.txt" in the current working directory.


## The codebook. 

The codebook is contained in the file CodeBook.md. It describes the variables of the output data set and summaries used to calculate the values, along with units and any other relevant information.
