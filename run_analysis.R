## Pre-work: Download the data to the working directory
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./data.zip",method="curl")
unzip("./data.zip")

## 4 - Appropriately label the data set with descriptive variable names
columnLabels<-read.table("./UCI HAR Dataset/features.txt",header=F)
columnLabels<-as.vector(columnLabels[,2])

## Pre-work: Read relevant datasets into R
trainVariables<-read.table("./UCI HAR Dataset/train/X_train.txt",header=F,col.names=columnLabels) 
testVariables<-read.table("./UCI HAR Dataset/test/X_test.txt",header=F,col.names=columnLabels) 
trainActivityLabels<-read.table("./UCI HAR Dataset/train/y_train.txt",header=F,col.names="Activity")
testActivityLabels<-read.table("./UCI HAR Dataset/test/y_test.txt",header=F,col.names="Activity")
trainSubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=F,col.names="Subject")
testSubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=F,col.names="Subject")

## 2 - Extract only the measurements on the mean and standard deviation for each measurement
i=1
extract=NULL
while(i<=(561-5)){
  temp=i:(i+5)
  extract=c(extract,temp)
  i=i+40
}
testVariables<-testVariables[extract]
trainVariables<-trainVariables[extract]

## 1 - Merge the training and the test sets to create one data set
trainMerged<-cbind(trainSubjects,trainActivityLabels,trainVariables)
testMerged<-cbind(testSubjects,testActivityLabels,testVariables)
oneDataSet<-merge(trainMerged,testMerged,all=T)

## 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
secondIndependentTidyDataSet=aggregate(oneDataSet,by=list(oneDataSet$Activity,oneDataSet$Subject),mean)
secondIndependentTidyDataSet=secondIndependentTidyDataSet[3:ncol(secondIndependentTidyDataSet)]

## 3 - Use descriptive activity names to name the activities in the data set
activityNumbers<-c(1,2,3,4,5,6)
activityNames<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
secondIndependentTidyDataSet$Activity<-activityNames[match(secondIndependentTidyDataSet$Activity,activityNumbers)]

## Post-work - Writes dataset from step 5 to my hard drive for uploading
write.table(secondIndependentTidyDataSet,row.name=FALSE,file="./CourseProject.txt")