## This code assumes that the data folder `UCI HAR Dataset` and this code file - run_analysis.R
## are in the same folder.
## This run_analysis.R does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for
##    each activity and each subject.

library(data.table)
library(plyr)

##The files that will be used to load data are listed as follows:
##test/subject_test.txt
##test/X_test.txt
##test/y_test.txt
##train/subject_train.txt
##train/X_train.txt
##train/y_train.txt
## features.txt


##Read data from the files into the variables
path_rf <- file.path("./" , "UCI HAR Dataset")

##Read Activity files
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

##Read Subject files
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

##Read Fearures files
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)

##1. Merge training and test sets to create one data set

##Concatenate data tables by rows
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

##set names to variables
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
names(dataFeatures)<- dataFeaturesNames$V2

##Merge columns to get the data frame Data for all data

dataMerge <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataMerge)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

##Subset Name of Features by measurements on the mean and standard deviation
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

##Subset the data frame Data by seleted names of Features
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

## 3. Uses descriptive activity names to name the activities in the data set

## Read descriptive activity names from “activity_labels.txt”
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

##facorize Variale activity in the data frame Data using descriptive activity names
Data$activity <- factor(Data$activity, labels = activityLabels[,2])

##head(Data$activity,10)
##tail(Data$activity,10)



## 4. Appropriately labels the data set with descriptive activity names.
## prefix t is replaced by time
## Acc is replaced by Accelerometer
## Gyro is replaced by Gyroscope
## prefix f is replaced by frequency
## Mag is replaced by Magnitude
## BodyBody is replaced by Body

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

##names(Data)

## 5. Creates a second, independent tidy data set with the average of each variable for
##    each activity and each subject.

Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)

##The file "tidydata.txt" can be read into a data frame using
##tidyData  <- read.table("tidydata.txt", header = TRUE)
##View(tidyData)
