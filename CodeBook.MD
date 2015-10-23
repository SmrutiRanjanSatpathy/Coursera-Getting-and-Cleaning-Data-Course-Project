## Code Book (Getting and Cleaning Data Project)

Author: Smruti Ranjan Satpathy

### Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Measurements

- `SubjectID`
- `Activity`
- `tBodyAcc-mean()-X`
- `tBodyAcc-mean()-Y`
- `tBodyAcc-mean()-Z`
- `tBodyAcc-std()-X`
- `tBodyAcc-std()-Y`
- `tBodyAcc-std()-Z`
- `tGravityAcc-mean()-X`
- `tGravityAcc-mean()-Y`
- `tGravityAcc-mean()-Z`
- `tGravityAcc-std()-X`
- `tGravityAcc-std()-Y`
- `tGravityAcc-std()-Z`
- `tBodyAccJerk-mean()-X`
- `tBodyAccJerk-mean()-Y`
- `tBodyAccJerk-mean()-Z`
- `tBodyAccJerk-std()-X`
- `tBodyAccJerk-std()-Y`
- `tBodyAccJerk-std()-Z`
- `tBodyGyro-mean()-X`
- `tBodyGyro-mean()-Y`
- `tBodyGyro-mean()-Z`
- `tBodyGyro-std()-X`
- `tBodyGyro-std()-Y`
- `tBodyGyro-std()-Z`
- `tBodyGyroJerk-mean()-X`
- `tBodyGyroJerk-mean()-Y`
- `tBodyGyroJerk-mean()-Z`
- `tBodyGyroJerk-std()-X`
- `tBodyGyroJerk-std()-Y`
- `tBodyGyroJerk-std()-Z`
- `tBodyAccMag-mean()`
- `tBodyAccMag-std()`
- `tGravityAccMag-mean()`
- `tGravityAccMag-std()`
- `tBodyAccJerkMag-mean()`
- `tBodyAccJerkMag-std()`
- `tBodyGyroMag-mean()`
- `tBodyGyroMag-std()`
- `tBodyGyroJerkMag-mean()`
- `tBodyGyroJerkMag-std()`
- `fBodyAcc-mean()-X`
- `fBodyAcc-mean()-Y`
- `fBodyAcc-mean()-Z`
- `fBodyAcc-std()-X`
- `fBodyAcc-std()-Y`
- `fBodyAcc-std()-Z`
- `fBodyAcc-meanFreq()-X`
- `fBodyAcc-meanFreq()-Y`
- `fBodyAcc-meanFreq()-Z`
- `fBodyAccJerk-mean()-X`
- `fBodyAccJerk-mean()-Y`
- `fBodyAccJerk-mean()-Z`
- `fBodyAccJerk-std()-X`
- `fBodyAccJerk-std()-Y`
- `fBodyAccJerk-std()-Z`
- `fBodyAccJerk-meanFreq()-X`
- `fBodyAccJerk-meanFreq()-Y`
- `fBodyAccJerk-meanFreq()-Z`
- `fBodyGyro-mean()-X`
- `fBodyGyro-mean()-Y`
- `fBodyGyro-mean()-Z`
- `fBodyGyro-std()-X`
- `fBodyGyro-std()-Y`
- `fBodyGyro-std()-Z`
- `fBodyGyro-meanFreq()-X`
- `fBodyGyro-meanFreq()-Y`
- `fBodyGyro-meanFreq()-Z`
- `fBodyAccMag-mean()`
- `fBodyAccMag-std()`
- `fBodyAccMag-meanFreq()`
- `fBodyBodyAccJerkMag-mean()`
- `fBodyBodyAccJerkMag-std()`
- `fBodyBodyAccJerkMag-meanFreq()`
- `fBodyBodyGyroMag-mean()`
- `fBodyBodyGyroMag-std()`
- `fBodyBodyGyroMag-meanFreq()`
- `fBodyBodyGyroJerkMag-mean()`
- `fBodyBodyGyroJerkMag-std()`
- `fBodyBodyGyroJerkMag-meanFreq()`

### Section 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in

- features.txt
- activity_labels.txt
- X_train.txt
- y_train.txt
- subject_train.txt 
- X_test.txt
- y_test.txt
- subject_test.txt

Assign column names and merge to create one data set.

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Create a logcal vector that contains values for the Subject ID,Activity, Mean and Standar Deviation columns Subset this data to keep only the necessary columns.

## Section 3. Use descriptive activity names to name the activities in the data set
Label names assigned to the verious levels of "Activity" factor.

## Section 4. Appropriately label the data set with descriptive activity names.
Replaced name of final clean data.

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Peer the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject.
reshape2 package has been used for melting & decasting clean data to create tidy data set. So; if the same package is not being installed in the machine, code will automatically install the reshape2 package.
