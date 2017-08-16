##0. Load the required package this script use:

library(dplyr)

##1. Merge the training and test sets to create one dataset.

  ##a. Load the zip data and unzip them

zipUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipUrl,destfile="HAR.zip",mode="wb")
unzip(zipfile="HAR.zip")

  ##b. Read the relevant txt files (/X_ = features data,/y_ = labels, /subject_ = subjects ID) and store them in variables

    ##Test files :
    test_set=read.table("./UCI HAR Dataset/test/X_test.txt")
    test_labels=read.table("./UCI HAR Dataset/test/y_test.txt")
    subject_test=read.table("./UCI HAR Dataset/test/subject_test.txt")

    ##Train files
    train_set=read.table("./UCI HAR Dataset/train/X_train.txt")
    train_labels=read.table("./UCI HAR Dataset/train/y_train.txt")
    subject_train=read.table("./UCI HAR Dataset/train/subject_train.txt")


  ##c.Name the data columns 
    
    ##Name the "features" columns as per their names stored in the /features.txt file:
    feature_names=read.table("./UCI HAR Dataset/features.txt")
    colnames(train_set)<-feature_names[,2]
    colnames(test_set)<-feature_names[,2]

    ##Name the column of the "labels" and "subjects ID" tables:
    colnames(train_labels)<-"Activity type"
    colnames(test_labels)<-"Activity type"
    colnames(subject_train)<-"Subject ID"
    colnames(subject_test)<-"Subject ID"

  ##d. For each train & test : merge first the subject table, then the labels table and finally the features table.
  ##Use cbind() as all tables have the same row number

traindata<-cbind(subject_train,train_labels,train_set)
testdata<-cbind(subject_test,test_labels,test_set)

  ##e. Merge the train & test data in one consolidated table

consodata<-rbind(traindata,testdata)

##2. Extract only the mean and standard deviation measures from the consolidated table.

  ##a. Extract the indice number in the feature_names table when "mean" and "std" are found. 
  ##Add +2 to these indices to match the row number in consodata (as they start with the subject and labels columns, that are not in the features raw data)

meanall<-grep("mean",feature_names[,2])+2 
## Some variable names contain "mean" but are Frequency mean rather than standard mean. I choose to exclude them.
meanFreq<-grep("meanFreq",feature_names[,2])+2
meanindice<-meanall[!meanall %in% meanFreq] ## Vector that contains all the "mean" feature indices
stdindice<-grep("std",feature_names[,2],ignore.case=TRUE)+2 ## Vector that contains all the "standard deviation" feature indices

  ##b. Create 2 tables, each is the subset of the consodata table with meanindice and stdindice and bind them in one table called consodata2

meandata<-consodata[,meanindice]
indicedata<-consodata[,stdindice]
consodata2<-cbind(consodata[,1:2],meandata,indicedata)

##3. Use descriptive activity names to name the activities in the data set

  ##a. Load the activity description from the zip file in a table

activity_labels=read.table("./UCI HAR Dataset/activity_labels.txt")

  ##b. Make activity names more descriptive: replace the separator "_" by space.

descriptive_activities<-mutate(activity_labels,V2=sub("_"," ",activity_labels[,2]))
names(descriptive_activities)<-c("Activity type","Activity")

  ##c. In the consolidated table, replace the activity number by their name

consodata3<-merge(descriptive_activities,consodata2,by.x="Activity type",by.y="Activity type",all=TRUE)
consodata3<-consodata3[,2:ncol(consodata3)]

##4. Appropriately label the data set with descriptive variable names.

names(consodata3)<-gsub("Acc","Accelerometer ", names(consodata3))
names(consodata3)<-gsub("Gyro", "Gyroscope ", names(consodata3))
names(consodata3)<-gsub("BodyBody", "Body ", names(consodata3))
names(consodata3)<-gsub("Body", "Body ", names(consodata3))
names(consodata3)<-gsub("gravity", "Gravity ", names(consodata3))
names(consodata3)<-gsub("Mag", "Magnitude ", names(consodata3))
names(consodata3)<-gsub("Jerk", "JerkSignal ", names(consodata3))
names(consodata3)<-gsub("^t", "Time ", names(consodata3))
names(consodata3)<-gsub("^f", "Frequency ", names(consodata3))
names(consodata3)<-gsub("-mean", "Mean", names(consodata3))
names(consodata3)<-gsub("-std", "StandardDeviation", names(consodata3))

##5. From the data set in step 4, create a second, independent tidy data set with the average of each variable 
##for each activity and each subject.

  ##a. Create the table 'TidyData' that answers the point 5. using groupby() and summarise_all() from dplyr package
TidyData<-consodata3 %>% 
          group_by(`Subject ID`, Activity) %>%
          summarise_all(funs(mean))

  ##b. Create outpout .txt file
write.table(TidyData, file = "TidyData.txt", row.names = FALSE)
