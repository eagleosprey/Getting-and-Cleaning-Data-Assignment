run_analysis <- function(){
##run_analysis.R script combines several components of accelerometer
##data into 1 data set. Then it extracts the mean and standard 
##deviation measurements, adding descriptive activity names.
## Then it creates a second tidy data set with the average
## of each variable for each activity and each subject
##
## A description of the input data set and project can be found at
## "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"        
## The data was downloaded 4/24/2014        
        
## This script follows the instructions specified in
## Assignment description. Specifically:
## "The code should have a file run_analysis.R 
## in the main directory that can be run as long as the
## Samsung data is in your working directory."

## Steps 1 and 2 give details for placing the "Samsung data"
## in the working directory        
        
## 1. Manually download data zip file from URL to the
##    working directory (that is, the directory that
##    stores this run_analysis.R file)
        
## 2. Manually extract zip file contents.
##    The zip file extractor should place the unzipped data        
##    into a subdirectory below the R script directory.
##
##    For example, if the R script directory is: 
##    - R script directory: ~\Assignment
##    The the data directory path should be: 
##    - Data directory:     ~\Assignment\UCI HAR Dataset
        
## The remainder of the script handles the assignment
## programmatically ONCE THE DATASET FOLLOWS THE STRUCTURE
## described in #2        
        
        
## 3. Read Test and Training files into R tables
##    1) X_test.txt
##    2) y_test.txt
##    3) X_train.txt
##    4) y_train.txt
##    5) subject_test.txt
##    6) subject_train.txt

xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
subjectTest<-read.table("UCI HAR Dataset/test/subject_test.txt")
subjectTrain<-read.table("UCI HAR Dataset/train/subject_train.txt")

## 4. Read features file to determine names of variables
##    stringsAsFactors = F so that vector can be used for row names
features<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)

## 5. Read activity_labels file
##
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

## 6. Assign variable names to xtest, xtrain using features data frame
colnames(xtest) <- features[,2]
colnames(xtrain) <- features[,2]

## 7. Assign variable names (colnames) to ytest, ytrain data frames
colnames(ytest) <- "activityCode"
colnames(ytrain) <- "activityCode"

## 8. Assign variable names (colnames) to subject_test, subject_train data frames
colnames(subjectTest) <- "subject"
colnames(subjectTrain) <- "subject"

## 9.  Combine the 3 Test and Train tables into 1 of each
testTable<-cbind(subjectTest, ytest, xtest)
trainTable<-cbind(subjectTrain, ytrain, xtrain)

## 10. Combine the Test and Train table
allTable<-rbind(testTable, trainTable)

##********************************************
##********************************************
##  This completes #1 of the assignment
##  Merges the training and the test sets to
##  create one data set.
##
##********************************************
##********************************************

## 11. Extract variables that contain mean() and std().
##     The datasets documentation identifies that those 
##     variables contain mean and std in the variable name.
##     The documentation is in features_info.txt and README.txt

## First, find which variable/column names contain mean() and sdf()
## store the answers in the vectors meansv and stdv
meansv<-grep("mean\\(",names(allTable))
stdv<-grep("std\\(",names(allTable))

##   Second, combine the vectors from above that give the columns
##   along with the subject and activity cols (1 & 2).


extractv<-c(1, 2, meansv, stdv)

##  Third, exctact/subset those variables/columns
means.std.df<-allTable[,extractv]
##********************************************
##********************************************
##  This completes #2 of the assignment
##  2. Extracts only the measurements on the mean 
##  and standard deviation for each measurement. 
##
##********************************************
##********************************************

## 12. Add a column/variable that shows the activity
##     specified by the activityCode
activity<-means.std.df[,2]
means.std.a.df<-cbind(means.std.df,activity)

## 13.  Lookup the activity using activityCode and place in
##      field created in last step
##      Since there is no base R function to do this
##      And packages use for loops to provide the vectorization,
##      a for loop from 1 to the length of the df was used.
##      Each row's activityCode was used to lookup the 
##      activity Label in the activityLabels df,
##      with row of activityLabels equal to the value of activityCode.

for (i in 1:length(means.std.df[,2])){
        means.std.a.df$activity[i]<-activityLabels[means.std.a.df$activityCode[i],"V2"]
}
##********************************************
##********************************************
##  This completes #3 of the assignment
##  3. Uses descriptive activity names to name the activities in the data set
##
##********************************************
##********************************************

## 14.  Create descriptive column names
##test<-colnames(means.std.a.df)
colnames(means.std.a.df)[1]<-"Subject"
colnames(means.std.a.df)[2]<-"Activity Code"
colnames(means.std.a.df)[3]<-"Time Body Acceleration Mean X"
colnames(means.std.a.df)[4]<-"Time Body Acceleration Mean Y"
colnames(means.std.a.df)[5]<-"Time Body Acceleration Mean Z"
colnames(means.std.a.df)[6]<-"Time Gravity Acceleration Mean X"
colnames(means.std.a.df)[7]<-"Time Gravity Acceleration Mean Y"
colnames(means.std.a.df)[8]<-"Time Gravity Acceleration Mean Z"
colnames(means.std.a.df)[9]<-"Time Body Acceleration Jerk Mean X"
colnames(means.std.a.df)[10]<-"Time Body Acceleration Jerk Mean Y"
colnames(means.std.a.df)[11]<-"Time Body Acceleration Jerk Mean Z"
colnames(means.std.a.df)[12]<-"Time Body Gyro Mean X"
colnames(means.std.a.df)[13]<-"Time Body Gyro Mean Y"
colnames(means.std.a.df)[14]<-"Time Body Gyro Mean Z"
##
colnames(means.std.a.df)[15]<-"Time Body Gyro Jerk Mean X"
colnames(means.std.a.df)[16]<-"Time Body Gyro Jerk Mean Y"
colnames(means.std.a.df)[17]<-"Time Body Gyro Jerk Mean Z"
colnames(means.std.a.df)[18]<-"Time Body Acceleration Magnitude Mean"
colnames(means.std.a.df)[19]<-"Time Gravity Acceleration Magnitude Mean"
colnames(means.std.a.df)[20]<-"Time Acceleration Jerk Magnitude Mean"
colnames(means.std.a.df)[21]<-"Time Body Gyro Magnitude Mean"
colnames(means.std.a.df)[22]<-"Time Body Gyro Jerk Magnitude Mean"
##
colnames(means.std.a.df)[23]<-"Frequency Body Acceleration Mean X"
colnames(means.std.a.df)[24]<-"Frequency Body Acceleration Mean Y"
colnames(means.std.a.df)[25]<-"Frequency Body Acceleration Mean Z"
colnames(means.std.a.df)[26]<-"Frequency Body Acceleration Jerk Mean X"
colnames(means.std.a.df)[27]<-"Frequency Body Acceleration Jerk Mean Y"
colnames(means.std.a.df)[28]<-"Frequency Body Acceleration Jerk Mean Z"
colnames(means.std.a.df)[29]<-"Frequency Body Gyro Mean X"
colnames(means.std.a.df)[30]<-"Frequency Body Gyro Mean Y"
colnames(means.std.a.df)[31]<-"Frequency Body Gyro Mean Z"
##
colnames(means.std.a.df)[32]<-"Frequency Body Acceleration Magnitude Mean"
colnames(means.std.a.df)[33]<-"Frequency Body Acceleration Jerk Magnitude Mean"
colnames(means.std.a.df)[34]<-"Frequency Body Gyro Magnitude Mean"
colnames(means.std.a.df)[35]<-"Frequency Body Gyro Jerk Magnitude Mean"
##
colnames(means.std.a.df)[36]<-"Time Body Acceleration Standard Deviation X"
colnames(means.std.a.df)[37]<-"Time Body Acceleration Standard Deviation Y"
colnames(means.std.a.df)[38]<-"Time Body Acceleration Standard Deviation Z"
colnames(means.std.a.df)[39]<-"Time Gravity Acceleration Standard Deviation X"
colnames(means.std.a.df)[40]<-"Time Gravity Acceleration Standard Deviation Y"
colnames(means.std.a.df)[41]<-"Time Gravity Acceleration Standard Deviation Z"
colnames(means.std.a.df)[42]<-"Time Body Acceleration Jerk Standard Deviation X"
colnames(means.std.a.df)[43]<-"Time Body Acceleration Jerk Standard Deviation Y"
colnames(means.std.a.df)[44]<-"Time Body Acceleration Jerk Standard Deviation Z"
colnames(means.std.a.df)[45]<-"Time Body Gyro Standard Deviation X"
colnames(means.std.a.df)[46]<-"Time Body Gyro Standard Deviation Y"
colnames(means.std.a.df)[47]<-"Time Body Gyro Standard Deviation Z"
##
colnames(means.std.a.df)[48]<-"Time Body Gyro Jerk Standard Deviation X"
colnames(means.std.a.df)[49]<-"Time Body Gyro Jerk Standard Deviation Y"
colnames(means.std.a.df)[50]<-"Time Body Gyro Jerk Standard Deviation Z"
colnames(means.std.a.df)[51]<-"Time Body Acceleration Magnitude Standard Deviation"
colnames(means.std.a.df)[52]<-"Time Gravity Acceleration Magnitude Standard Deviation"
colnames(means.std.a.df)[53]<-"Time Acceleration Jerk Magnitude Standard Deviation"
colnames(means.std.a.df)[54]<-"Time Body Gyro Magnitude Standard Deviation"
colnames(means.std.a.df)[55]<-"Time Body Gyro Jerk Magnitude Standard Deviation"
##
colnames(means.std.a.df)[56]<-"Frequency Body Acceleration Standard Deviation X"
colnames(means.std.a.df)[57]<-"Frequency Body Acceleration Standard Deviation Y"
colnames(means.std.a.df)[58]<-"Frequency Body Acceleration Standard Deviation Z"
colnames(means.std.a.df)[59]<-"Frequency Body Acceleration Jerk Standard Deviation X"
colnames(means.std.a.df)[60]<-"Frequency Body Acceleration Jerk Standard Deviation Y"
colnames(means.std.a.df)[61]<-"Frequency Body Acceleration Jerk Standard Deviation Z"
colnames(means.std.a.df)[62]<-"Frequency Body Gyro Standard Deviation X"
colnames(means.std.a.df)[63]<-"Frequency Body Gyro Standard Deviation Y"
colnames(means.std.a.df)[64]<-"Frequency Body Gyro Standard Deviation Z"
##
colnames(means.std.a.df)[65]<-"Frequency Body Acceleration Magnitude Standard Deviation"
colnames(means.std.a.df)[66]<-"Frequency Body Acceleration Jerk Magnitude Standard Deviation"
colnames(means.std.a.df)[67]<-"Frequency Body Gyro Magnitude Standard Deviation"
colnames(means.std.a.df)[68]<-"Frequency Body Gyro Jerk Magnitude Standard Deviation"
colnames(means.std.a.df)[69]<-"Activity"
##********************************************
##********************************************
##  This completes #4 of the assignment
##  4. Appropriately labels the data set with descriptive activity names. 
##  which was clarified as meaning to name the variables/column with
##  human freindly labels
##
##  THis also completes the FIRST TIDY DATA SET
##********************************************
##********************************************


## 15.  Average each variable by activity and subject
## The assignment was interpreted as requesting the average
## of the data in the FIRST TIDY DATA SET containing mean and 
## std variables
##
## Split data by each variable - there are 66 variables so
## produce a data set of all 66 variables
## for each combination of Subject and Activity.
##
##
split.means.std.a.df<-split(means.std.a.df[,3:68], 
        list(means.std.a.df$Subject, means.std.a.df$Activity))
##
## Calculate the average/mean for all observations of each variable
## by the combination of Subject and Activity
##
avg.by.subject.and.activity<-sapply(split.means.std.a.df,colMeans)
##
###############################################################
###############################################################
###############################################################
## Transpose the dataset to show the variables in columns.

avg.by.subject.and.activity<-t(avg.by.subject.and.activity)

## 16. Convert the numeric vector output from the split to a 
## TIDY data frame. Separate and store the rownames into variables.
## 
##

##Convert to data frame.
##Technique from http://stackoverflow.com/questions/10234734/converting-a-numeric-matrix-into-a-data-table-or-data-frame
avg.by.subject.and.activity<-as.data.frame(avg.by.subject.and.activity)

##Separate the rownnames and put into variables to be bound to dataframe
rownamedf<-strsplit(rownames(avg.by.subject.and.activity),"\\.")

##Convert the result of strsplit into a df to be bound.
## Technique from http://stackoverflow.com/questions/4227223/r-list-to-data-frame
SubjectandActivity<-data.frame(Reduce(rbind, rownamedf), stringsAsFactors=FALSE)

##Name the cols of the temp data frame with Subject and Activity.
colnames(SubjectandActivity)<-c("Subject","Activity")

##Bind/add Subject and Acvitity as variables to dataframe.
avg.by.subject.and.activity<-cbind(SubjectandActivity, avg.by.subject.and.activity)

##Remove the rownames
rownames(avg.by.subject.and.activity)<-NULL

##Rename the data frame to reflect what it contains
Average.of.all.variables.for.each.subject.and.activity.combination<-avg.by.subject.and.activity


##********************************************
##********************************************
##  This completes #5 of the assignment
##  5. Creates a second, tidy data set with the average 
##     of each variable for each activity and each subject. 
##
##********************************************
##********************************************



## 17. Write the second tidy data set, which will be uploaded
##     as a submission to the project

write.table(Average.of.all.variables.for.each.subject.and.activity.combination, 
            file = "Average.of.all.variables.for.each.subject.and.activity.combination.txt")


}
