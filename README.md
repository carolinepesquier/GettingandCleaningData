# GettingandCleaningData

## Course assignement
Final Assignment from Coursera "GettingandCleaningData".
The repository contains 4 different files to be used for the peer-reviewed assignement from course "Getting and Cleaning Data" (Johns Hopkins University for Coursera):
* README.md : present markdown file that details the analysis process.
* TidyData.txt: the requested output table that is the tidy dataset from the "Human Activity Recognition Using Smartphones Dataset" - Version 1.0 raw dataset.
* Run_analysis.R : the actual R code with steps to transform the raw dataset mentionned above to the tidy one.
* Codebook.md : the Code Book that describes the variables from the TidyData.txt file.

Assignement, as stated in Coursera : 

*"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.*

*You should create one R script called run_analysis.R that does the following.*

*1. Merges the training and the test sets to create one data set.*

*2. Extracts only the measurements on the mean and standard deviation for each measurement.*

*3. Uses descriptive activity names to name the activities in the data set.*

*4. Appropriately labels the data set with descriptive variable names.*

*5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."*

## Raw data ##

Raw and unprocessed data have been collected from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Original README quote from the raw data : 

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

Link to zipped data : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Script ##

The script have been developped using Windows 7 and in R version 3.4.1

The script follows the steps suggested in assignement statement.
Script step by step explanations:

* Load and unzip the raw data : 

`zipUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"`

`download.file(zipUrl,destfile="HAR.zip",mode="wb")`

`unzip(zipfile="HAR.zip")`

* Read the relevant txt files: test/X_test.txt for the features values, test/y_test.txt for the labels values and test/subject_test.txt for the ID of the subject tested. Repeat the same with train files.

`test_set=read.table("./UCI HAR Dataset/test/X_test.txt")`

 `test_labels=read.table("./UCI HAR Dataset/test/y_test.txt")`
    
 `subject_test=read.table("./UCI HAR Dataset/test/subject_test.txt")` 
 
 * Name the features columns as per the name given in the /features.txt file
 
 `feature_names=read.table("./UCI HAR Dataset/features.txt")`
 
 `colnames(train_set)<-feature_names[,2]` and `colnames(test_set)<-feature_names[,2]`
 
  * Name the other columns (labels and subjects ID): test example, repeat for train files.
  
  `colnames(test_labels)<-"Activity type"`
    
  `colnames(subject_test)<-"Subject ID"`
    
   * For each Test and Train data, merge (in this order) the subjects ID, labels and features. Example shown for Test data:
`testdata<-cbind(subject_test,test_labels,test_set)`

  * Merge train & test data in one consolidated table:

`consodata<-rbind(traindata,testdata)`

  * Extract the indice number in the feature_names table when "mean" and "std" are found. 
 _Add +2 to these indices to match the row number in consodata (as they start with the subject and labels columns, that are not in the features raw data)

`meanall<-grep("mean",feature_names[,2])+2`: Vector that contains all the indices for the feature that contain the word "mean" in their name.

Some variable names contain "mean" but are Frequency mean rather than standard mean. I chose to exclude this "MeanFreq". Note that excluding or including these features is a matter of personal choice (check : https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)
`meanFreq<-grep("meanFreq",feature_names[,2])+2`: Vector that contains the "meanFreq" feature indices
`meanindice<-meanall[!meanall %in% meanFreq]` : Vector that contains only the "mean" feature indices
`stdindice<-grep("std",feature_names[,2],ignore.case=TRUE)+2` : Vector that contains all the "standard deviation" feature indices

* Create 2 tables, each is the subset of the consodata table with meanindice and stdindice and bind them in one table called consodata2

`meandata<-consodata[,meanindice]`
`indicedata<-consodata[,stdindice]`
`consodata2<-cbind(consodata[,1:2],meandata,indicedata)`

* Load the activity description from the zip file in a table

`activity_labels=read.table("./UCI HAR Dataset/activity_labels.txt")`

 * Make activity names more descriptive: use a space as separator

`descriptive_activities<-mutate(activity_labels,V2=sub("_"," ",activity_labels[,2]))`
`names(descriptive_activities)<-c("Activity type","Activity")`

 * In the consolidated table, replace the activity number by their name

`consodata3<-merge(descriptive_activities,consodata2,by.x="Activity type",by.y="Activity type",all=TRUE)`
`consodata3<-consodata3[,2:ncol(consodata3)]`

* Update the features columns labels to a descriptive name. Example for "Acc" turned into Accelerometer:

`names(consodata3)<-gsub("Acc","Accelerometer ", names(consodata3))`

* Create the table 'TidyData' using groupby() and summarise_all() from dplyr package. 
_This table is tidy that meet the criteria from Hadley Wickham in his "Tidy data" paper (check http://vita.had.co.nz/papers/tidy-data.html). My TidyData is presented in a Wide format, which is one of the form of a tidy dataset.

`TidyData<-consodata3 %>% group_by(Subject ID, Activity) %>% summarise_all(funs(mean))`

 * Finally, creation of the outpout .txt file
 `write.table(TidyData, file = "TidyData.txt", row.names = FALSE)`
