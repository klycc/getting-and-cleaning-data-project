library(data.table)

######################################################################
## Variable Names | Features.txt | subject           | activity     ##
## -----------------------------------------------------------------##
## Data           |  X_train.txt | subject_train.txt | y_train.txt  ##
##                |  X_test.txt  | subject_test.txt  | y_test.txt   ##
######################################################################

activityTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
activityTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
## merge training and test activity data
dataActivity<-rbind(activityTrain, activityTest)
names(dataActivity)<-c("activity")
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
# replace number values with correct activity names
dataActivity[, 1] <- activity[dataActivity[, 1], 2]


subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
## merge training and test subject data
dataSubject<-rbind(subjectTrain, subjectTest)
names(dataSubject)<-c("subject")

featureTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
featureTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
## merge training and test feature data
dataFeature<-rbind(featureTrain, featureTest)

featureNames<-read.table("./UCI HAR Dataset/features.txt")
## filter variables, extracts only the mean and standard deviation for each measurement
names(dataFeature)<-featureNames$V2
dataFeature <- dataFeature[, grep("(mean|std)\\(\\)", names(dataFeature))]

## combine feature,subject and activity into one data frame
data<-cbind(dataFeature, dataSubject, dataActivity)

## Rename variables names to make them self-descriptive
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

## Extract a tidy dataset by creating a data frame with average of 
## each measurement variable for each activity and each subject.
data$subject<-as.factor(data$subject)
data<-data.table(data)
tidyData<-aggregate(. ~subject+activity, data, mean) 
tidyData<-tidyData[order(tidyData$subject, tidyData$activity),]

## write tidyData to current working directory
write.table(tidyData, file="tidyData.txt", row.names = FALSE)

