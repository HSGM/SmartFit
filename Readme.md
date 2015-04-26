Coursera Getting and Cleaning Data Course Project
-------------------------------------------------

### Instructions for running the script "run\_analysis.R"

1.  Download the script run\_analysis.R to the working directory.

2.  Download the raw data from

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

    to the working directory and unzip to obtain the following files:

    -   README.txt
    -   activity\_labels.txt
    -   features.txt
    -   features\_info.txt
    -   **test**( Folder )
        -   **Inertial Signals** ( Folder )
        -   subject\_test.txt
        -   X\_test.txt
        -   y\_test.txt
    -   **train** ( Folder )
        -   **Inertial Signals** ( Folder )
        -   subject\_train.txt
        -   X\_train.txt
        -   y\_train.txt

3.  Run the script **"run\_analysis.R".**

### How does "run\_analysis.R" meet the following 5 objectives of the assignment?

*Objectives:*

        1. Merges the training and the test sets to create one data set.
        2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        3. Uses descriptive activity names to name the activities in the data set
        4. Appropriately labels the data set with descriptive variable names. 
        5. From the data set in step 4, creates a second, independent tidy data set 
           with the average of each variable for each activity and each subject.

An outline is given here. The comments provided on the script gives the specifics.

##### Objectives 1 and 3: Merges the training and the test sets to create one data set and

##### uses descriptive activity names to name the activities in the dataset.

##### (Step d.)

      a. Load the features and activity labels.

      b. Load the data pertaining to train:

      c. Assign the variable names from features.txt to the data loaded from Xtrain.txt. 
      
      d. Use the activity labels loaded from activity_labels.txt as factor levels for the 
         activity data  variable loaded from ytrain.txt.
         
      e. Load subject_train.txt and coerce subject variable to be a factor variable. 
         
      f. Merge the three dataframes obtained from the above three steps into one 
         data frame by combining them using cbind()
      
      g. Repeat the steps outlined insteps c.through f. using the test data. 

      h. Merge train and test data sets obtained above into one dataset called 
        "Smartfit" by combining them using rbind().
        

##### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

        From the data set obtained in step h. ( "SmartFit") extract those variables that correspond
        to a mean or a standard variable.
      
        ( Note: These are only the variables that have a suffix -mean() or -std().The variables 
        pertaining to angular measurements  were not extracted). 
      
        The resulting dataset( "SmartfitMnStd") will have 10299 observations and 68 variables
        of which two variables  are "Subject"" and  "Activity" and the other 66 are means or std.
        measurements.
      

##### 3. The variable names are appropriately changed to be more descriptive.

          (see code book for details)

##### 4. From the data set obtained in 2.( "SmartfitMnStd"),a second independent tidy dataset "TidySmartfitMean.Txt" with the average of each variable for each activity and each subject is created.

          The resulting data set will be saved as "TidySmartfitMeans.txt",
          a 180x68 data table, where the first column contains subject IDs, 
          the second column contains activity names,
          and the averages for each of the 66 attributes will be in columns 3...68.
          There will be 30 subjects and 6 activities, giving 180 averages for each column.
          

### Instructions to View "TidySmartfitMeans.txt" in R.

        Use the following R code. "TidySmartfitMeans.txt" should be in your working directory.

        data <- read.table("TidySmartfitMeans.txt", header = TRUE)
        
        View(data)
          
         (as suggested by David Hood in the class forum:
         https://class.coursera.org/getdata-013/forum/thread?thread_id=30)
