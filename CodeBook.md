## Original Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Which data is used by this project   
According to the project requirement, the following files are referenced to have the final tidy data:

  'README.txt'
  'features_info.txt': Shows information about the variables used on the feature vector.
  'features.txt': List of all features.
  'activity_labels.txt': Links the class labels with their activity name.
  'train/X_train.txt': Training feature variables.
  'train/y_train.txt': Training labels.
  'train/subject_train.txt': Training subject.
  'test/X_test.txt': Test feature variables.
  'test/y_test.txt': Test labels.
  'test/subject_test.txt':Test subject.

## Variables

  activityTrain,activityTest, subjectTrain, subjectTest, featureTrain and featureTest - contain the data from the downloaded files for test and training data under ./train and ./test directory.
	
  featureNames - contains the name information from features.txt.
  
  activity - contains the activity name and value pair from activity_labels.txt.
  
  dataActivity -  merge both the test and training observations of activity, using in activity names instead of activity ID.
  
  dataSubject - merge both the test and training observations of subject
  
  dataFeature - first merge both the test and training observations of feature, then filtered those columns with the mean and standard deviation measures.
  
  data - merges data from dataFeature, dataActivity and dataSubject, and renames the variable names in dataFeature with self descriptive names.
  
  tidyData - extract a tidy dataset by creating a data frame with average of each measurement variable for each activity and each subject

## Important Operations used:

    1. using the rbind() function to merge data of the same category.
    2. using cbind() to merge the three data frame into a whole dataset.
    3. using gsub() to rename the variables names to make it descriptive.
    4. using aggregate() to split the whole dataset into subset by subject and activity column, and apply mean function for each. 
    5. using write.table() to output the tidy dataset.	

