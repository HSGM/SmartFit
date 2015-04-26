Code book
---------

Information about the datasets **"TidySmartfitMeans.txt"** created by the script **"run\_analysis.R"**, is provided here in this document.

#### Raw dataset :

Source: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The data are from an experiment in which measurements were collected from the accelerometer and gyroscope from the Samsung Galaxy S smartphone worn by 30 individuals carrying out 6 activities. More information about the measurements in the raw dataset can be obtained from the website where the dataset was originally taken from: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

#### Experimental Design:

Taken from <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_ UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

### Processed Data :

The raw data set was downloaded and unzipped. See the **"Readme file"** and the analysis script **"run\_analysis.R"** for details of how the data was processed.

**Dimensions:** 180 rows (6 subjects \* 30 activities) with 68 variables (66 selected mean and sd features, plus subject and activity variables)

**Units of measurement:** The data are all normalized. Therefore are without units.

**Description of Variables**

**Variable in column 1:** **Subjects** denotes the subject number that performed an activity. In total there are 30 subjects. Subjects have been converted to a factor ("1":"30"")

**Variable in column 2:** **Activities** have been transformed using the corresponding label found in the **'activity\_ labels.txt'** file of the original dataset. Converted to a factor variable with 6 levels ("WALKING", "WALKING\_ UPSTAIRS", "WALKING\_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

**Variables in column 3-68:** These variables contain the required **means by subject and activity combination** for the features in the original dataset that were a mean or a standard deviation. Angle features even though they contain the word mean in their name in the original dataset, were not considered as a variable with a mean or a standard deviation since they refer to angle difference and not a mean or standard deviation per se.

A total of 66 features were selected from the original data. A full description of the features is may be obtained from the file **"features\_info.txt"**, included with the original dataset.

For the selected features, the feature names from the original data have been rewritten, as follows:

1.  The prefix **t** was replaced by **time** , to show that it corresponds to the time domain
2.  The prefix **f** was replaced by **freq**, to show that it corresponds to the frequency domain
3.  Parantheses and dashes have been removed
4.  BodyBody has been replaced by Body
5.  CamelCasing has been applied to the names

The following table gives the original names in the raw data and the corresponding name for its calculated mean in the dataset **"TidySmartfitMeans.txt"**

| Variable in Raw data        | Variable in TidySmartfitMeans.txt |
|:----------------------------|:----------------------------------|
| tBodyAcc-mean()-X           | TimeBodyAccMeanX                  |
| tBodyAcc-mean()-Y           | TimeBodyAccMeanY                  |
| tBodyAcc-mean()-Z           | TimeBodyAccMeanZ                  |
| tBodyAcc-std()-X            | TimeBodyAccStdX                   |
| tBodyAcc-std()-Y            | TimeBodyAccStdY                   |
| tBodyAcc-std()-Z            | TimeBodyAccStdZ                   |
| tGravityAcc-mean()-X        | TimeGravityAccMeanX               |
| tGravityAcc-mean()-Y        | TimeGravityAccMeanY               |
| tGravityAcc-mean()-Z        | TimeGravityAccMeanZ               |
| tGravityAcc-std()-X         | TimeGravityAccStdX                |
| tGravityAcc-std()-Y         | TimeGravityAccStdY                |
| tGravityAcc-std()-Z         | TimeGravityAccStdZ                |
| tBodyAccJerk-mean()-X       | TimeBodyAccJerkMeanX              |
| tBodyAccJerk-mean()-Y       | TimeBodyAccJerkMeanY              |
| tBodyAccJerk-mean()-Z       | TimeBodyAccJerkMeanZ              |
| tBodyAccJerk-std()-X        | TimeBodyAccJerkStdX               |
| tBodyAccJerk-std()-Y        | TimeBodyAccJerkStdY               |
| tBodyAccJerk-std()-Z        | TimeBodyAccJerkStdZ               |
| tBodyGyro-mean()-X          | TimeBodyGyroMeanX                 |
| tBodyGyro-mean()-Y          | TimeBodyGyroMeanY                 |
| tBodyGyro-mean()-Z          | TimeBodyGyroMeanZ                 |
| tBodyGyro-std()-X           | TimeBodyGyroStdX                  |
| tBodyGyro-std()-Y           | TimeBodyGyroStdY                  |
| tBodyGyro-std()-Z           | TimeBodyGyroStdZ                  |
| tBodyGyroJerk-mean()-X      | TimeBodyGyroJerkMeanX             |
| tBodyGyroJerk-mean()-Y      | TimeBodyGyroJerkMeanY             |
| tBodyGyroJerk-mean()-Z      | TimeBodyGyroJerkMeanZ             |
| tBodyGyroJerk-std()-X       | TimeBodyGyroJerkStdX              |
| tBodyGyroJerk-std()-Y       | TimeBodyGyroJerkStdY              |
| tBodyGyroJerk-std()-Z       | TimeBodyGyroJerkStdZ              |
| tBodyAccMag-mean()          | TimeBodyAccMagMean                |
| tBodyAccMag-std()           | TimeBodyAccMagStd                 |
| tGravityAccMag-mean()       | TimeGravityAccMagMean             |
| tGravityAccMag-std()        | TimeGravityAccMagStd              |
| tBodyAccJerkMag-mean()      | TimeBodyAccJerkMagMean            |
| tBodyAccJerkMag-std()       | TimeBodyAccJerkMagStd             |
| tBodyGyroMag-mean()         | TimeBodyGyroMagMean               |
| tBodyGyroMag-std()          | TimeBodyGyroMagStd                |
| tBodyGyroJerkMag-mean()     | TimeBodyGyroJerkMagMean           |
| tBodyGyroJerkMag-std()      | TimeBodyGyroJerkMagStd            |
| fBodyAcc-mean()-X           | FreqBodyAccMeanX                  |
| fBodyAcc-mean()-Y           | FreqBodyAccMeanY                  |
| fBodyAcc-mean()-Z           | FreqBodyAccMeanZ                  |
| fBodyAcc-std()-X            | FreqBodyAccStdX                   |
| fBodyAcc-std()-Y            | FreqBodyAccStdY                   |
| fBodyAcc-std()-Z            | FreqBodyAccStdZ                   |
| fBodyAccJerk-mean()-X       | FreqBodyAccJerkMeanX              |
| fBodyAccJerk-mean()-Y       | FreqBodyAccJerkMeanY              |
| fBodyAccJerk-mean()-Z       | FreqBodyAccJerkMeanZ              |
| fBodyAccJerk-std()-X        | FreqBodyAccJerkStdX               |
| fBodyAccJerk-std()-Y        | FreqBodyAccJerkStdY               |
| fBodyAccJerk-std()-Z        | FreqBodyAccJerkStdZ               |
| fBodyGyro-mean()-X          | FreqBodyGyroMeanX                 |
| fBodyGyro-mean()-Y          | FreqBodyGyroMeanY                 |
| fBodyGyro-mean()-Z          | FreqBodyGyroMeanZ                 |
| fBodyGyro-std()-X           | FreqBodyGyroStdX                  |
| fBodyGyro-std()-Y           | FreqBodyGyroStdY                  |
| fBodyGyro-std()-Z           | FreqBodyGyroStdZ                  |
| fBodyAccMag-mean()          | FreqBodyAccMagMean                |
| fBodyAccMag-std()           | FreqBodyAccMagStd                 |
| fBodyBodyAccJerkMag-mean()  | FreqBodyAccJerkMagMean            |
| fBodyBodyAccJerkMag-std()   | FreqBodyAccJerkMagStd             |
| fBodyBodyGyroMag-mean()     | FreqBodyGyroMagMean               |
| fBodyBodyGyroMag-std()      | FreqBodyGyroMagStd                |
| fBodyBodyGyroJerkMag-mean() | FreqBodyGyroJerkMagMean           |
| fBodyBodyGyroJerkMag-std()  | FreqBodyGyroJerkMagStd            |
