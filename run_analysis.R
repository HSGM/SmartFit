#Script run_analysis.R

# Objective 1.Merges the training and the test sets to create one data set and 
#             uses descriptive activity names to name the activities 
#             in the dataset.(Step d.)

#STEP a.

#Read in features.txt into a dataframe called names  and store
#the second column  in a vector called VarNames.

Names= read.table("./data/features.txt", sep = "")
VarNames = Names$V2


#STEP b.
#Read in  activity _labels.txt to a dataframe called Label, coerce 
#to character and store in vector called ActivityLabels.

Label = read.table("./data/activity_labels.txt", sep = "")
ActivityLabels = as.character(Label$V2)

#STEP c.
#Read in X_train.txt into a dataframe called Xtrain. Assign the names in VarNames as 
#the variable names. 
Xtrain = read.table("./data/train/X_train.txt", sep = "")
names(Xtrain) = VarNames


#STEP d.
#Read in y_train.txt into a single column dataframe called Ytrain. Assign "Activity" as the name of the column

Ytrain = read.table("./data/train/y_train.txt", sep = "")

names(Ytrain) = "Activity"


#Coerce Activity to be a factor
Ytrain$Activity = as.factor(Ytrain$Activity)
#indicate the levels of the factor as that stored in the vector activityLabels.
levels(Ytrain$Activity) = ActivityLabels



#STEP e.
#Read in subject_train.txt into a  dataframe called trainSubjects.
TrainSubjects = read.table("./data/train/subject_train.txt", sep = "")
names(TrainSubjects) = "Subject"
#coerce subject to be a factor
TrainSubjects$Subject = as.factor(TrainSubjects$Subject)


#STEP f.
#column bind trainSubjects, Ytrain and Xtrain into a dataset called train
train = cbind( TrainSubjects, Ytrain, Xtrain)



#STEP g.  #Repeat STEPS b. to f. for the test data.
#read in X_test.txt into a dataframe called Xtest. Assign the names in VarNames as 
#the variable names.
Xtest= read.table("./data/test/X_test.txt", sep = "")
names(Xtest) = VarNames #From STEP a.


#Read in y_test.txt into a single column dataframe called Ytest. 
#Assign "Activity" as the name of the column

Ytest = read.table("./data/test/y_test.txt", sep = "")

names(Ytest) = "Activity"


#Coerce Activity to be a factor
Ytest$Activity = as.factor(Ytest$Activity)
#indicate the levels of the factor as that stored in the vector activityLabels.
levels(Ytest$Activity) = ActivityLabels


#Read in subject_test.txt into a  dataframe called testSubjects.
testSubjects = read.table("./data/test/subject_test.txt", sep = "")
names(testSubjects) = "Subject"
testSubjects$Subject = as.factor(testSubjects$Subject)


#column bind testSubjects, Ytest and Xtest into a dataset called test
test = cbind( testSubjects, Ytest, Xtest)


#STEP h. 
#Merge train and test sets to create one data set called Smartfit using rowbind 

Smartfit<-rbind(train, test)
levels(Smartfit$Subject)=c(1:30)

#Objective 2: From Smartfit select only the variables that have -mean() or -std() and make
#              a new dataframe called SmartfitMnStd

SmartfitMnStd<-Smartfit[,c("Subject", "Activity", grep("-mean\\(\\)|-std\\(\\)", names(Smartfit), value=TRUE))]

#STEP 3:
#rename variables to easily understandable names.
#Note: The statement changing fBodyBody to FreqBody should be run 
#before the statement changing "fBody" to "FreqBody"

names(SmartfitMnStd)<-sub("tBody", "TimeBody", names(SmartfitMnStd))
names(SmartfitMnStd)<-sub("tGravity", "TimeGravity", names(SmartfitMnStd) )
names(SmartfitMnStd)<-sub("fBodyBody", "FreqBody", names(SmartfitMnStd))
names(SmartfitMnStd)<-sub("fBody", "FreqBody", names(SmartfitMnStd))
names(SmartfitMnStd)<-sub("fBody", "FreqBody", names(SmartfitMnStd))
names(SmartfitMnStd)<-sub("-mean\\(\\)-", "Mean", names(SmartfitMnStd))
names(SmartfitMnStd)<-sub("-std\\(\\)-", "Std", names(SmartfitMnStd))
names(SmartfitMnStd)<-sub("-std\\(\\)", "Std", names(SmartfitMnStd))
names(SmartfitMnStd)<-sub("-mean\\(\\)", "Mean", names(SmartfitMnStd))

#obtain a mean for each variable by subject and activity combination. 

#Select columns 3 to the last column of SmartfitMnStd. The first two columns are Subject and Activity.
#dim(SmartfitMNStd)[2] gives the second dimension which is 68 in this case.

ColsforMeans <-SmartfitMnStd[, 3:dim(SmartfitMnStd)[2]]  
                                                    


#use the function aggregate to obtain the means for the  variables on ColsforMeans.
SmartfitMeans<- aggregate(ColsforMeans,list(Subject=SmartfitMnStd$Subject, 
                                 Activity=SmartfitMnStd$Activity), mean)


#Create a txt file "TidySmartfitMeans.tx" from SmartfitMeans.
write.table(SmartfitMeans, file = "TidySmartfitMeans.txt", row.names = FALSE)

