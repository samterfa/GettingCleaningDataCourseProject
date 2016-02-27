run_analysis <- function(){

     require("dplyr") ## Makes sure dplyr package is included when running the function so that dplyr functions work correctly.
     
     activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt") ## Load the activity codes for each type of activity.
     names(activityLabels) <- c("ActivityNumber", "Activity")
     featureLabels <- read.table("UCI HAR Dataset/features.txt") ## Load the column labels for the acceleration data for test and train data.
     
     
     
     ## Load in the testing data to a data frame containing subject number, activity name, mean acceleration and standard deviation acceleration.
     subjectTestDataFrame <- read.table("UCI HAR Dataset/test/subject_test.txt") ## Reads in subject numbers to a data frame.
     subjectTestVector <- subjectTestDataFrame[[1]] ## Converts the subject numbers data frame to a vector for use in binding later in the program.
     
     activity_test <- read.table("UCI HAR Dataset/test/Y_test.txt") ## Reads the activity numbers for each testing test above into a data frame.
     activityTestVector <- as.character(activityLabels[activity_test[,1],2]) ## Converts the activity data frame to a vector for use in binding later by substituting the descriptive activity names from activity_labels.txt instead of the activity numbers.
     
     x_test <- read.table("UCI HAR Dataset/test/X_test.txt") ## Reads in the testing accelerometer and gyroscope data into a data frame.
     names(x_test) <- featureLabels[,2] ## Renames the columns of x_test descriptively based on the conversions in features.txt.
     
     hasMean <- as.character(regexec("-mean\\(\\)", names(x_test))) != "-1" ## Identifies columns of mean testing data in x_test.
     hasStd <- as.character(regexec("-std\\(\\)", names(x_test))) != "-1" ## Identifies columns of standard deviation testing data in x_test.
     hasMeanOrStd <- hasMean | hasStd ## Identifies columns of either mean or standard deviation testing data in x_test.
     
     testData <- x_test[,hasMeanOrStd] ## Selects only mean or standard deviation data from x_test.
     testData$Subject <- subjectTestVector ## Adds subject numbers for each entry of testData based on subject_test.txt.
     testData$Activity <- activityTestVector ## Adds activity names for each entry of testData based on Y_test.txt and activity_labels.txt.
     
     
     
     ## Load in the training data to a data frame containing subject number, activity name, mean acceleration and standard deviation acceleration.
     subjectTrainDataFrame <- read.table("UCI HAR Dataset/train/subject_train.txt") ## Reads in subject numbers to a data frame.
     subjectTrainVector <- subjectTrainDataFrame[[1]] ## Converts the subject numbers data frame to a vector for use in binding later in the program.
     
     activity_train <- read.table("UCI HAR Dataset/train/Y_train.txt") ## Reads the activity numbers for each testing test above into a data frame.
     activityTrainVector <- as.character(activityLabels[activity_train[,1],2]) ## Converts the activity data frame to a vector for use in binding later by substituting the descriptive activity names from activity_labels.txt instead of the activity numbers.
     
     x_train <- read.table("UCI HAR Dataset/train/X_train.txt") ## Reads in the training accelerometer and gyroscope data into a data frame.
     names(x_train) <- featureLabels[,2] ## Renames the columns of x_train descriptively based on the conversions in features.txt.
     
     hasMean <- as.character(regexec("-mean\\(\\)", names(x_train))) != "-1" ## Identifies columns of mean training data in x_train.
     hasStd <- as.character(regexec("-std\\(\\)", names(x_train))) != "-1" ## Identifies columns of standard deviation training data in x_train.
     hasMeanOrStd <- hasMean | hasStd ## Identifies columns of either mean or standard deviation training data in x_train.
     
     trainData <- x_train[,hasMeanOrStd] ## Selects only mean or standard deviation data from x_train.
     trainData$Subject <- subjectTrainVector ## Adds subject numbers for each entry of trainData based on subject_train.txt.
     trainData$Activity <- activityTrainVector ## Adds activity names for each entry of trainData based on Y_train.txt and activity_labels.txt.
     
     testAndTrainData <- merge(testData,trainData,all=TRUE) ## Creates a single data frame with all testing and training data.
     
     ## Creates a second, independent tidy data set with the average of each variable for each subject and activity.
     
     groupedSubjectActivityData <- aggregate(testAndTrainData[, 1:66], by = list(testAndTrainData[, "Activity"],testAndTrainData[, "Subject"]), FUN = mean) ## Averages all measurements by subject and activity.
     groupedSubjectActivityData <- rename(groupedSubjectActivityData, Activity = Group.1) ## Renames column for subjects to be more descriptive and eventually match the Activity averages data set for merging.
     groupedSubjectActivityData <- rename(groupedSubjectActivityData, Subject = Group.2) ## Renames column for subjects to be more descriptive and eventually match the Activity averages data set for merging.
     groupedSubjectActivityData <- groupedSubjectActivityData[,append(c("Subject","Activity"),names(groupedSubjectActivityData[,!names(groupedSubjectActivityData)=="Subject" & !names(groupedSubjectActivityData)=="Activity"]))]  ## Swaps the subject and activity columns.
     names(groupedSubjectActivityData) <- append(c("Subject", "Activity"), paste(names(groupedSubjectActivityData[,!names(groupedSubjectActivityData)=="Subject" & !names(groupedSubjectActivityData)=="Activity"]), "-Avgs", sep="")) ## Adds descriptor "-Avgs" to each of the data columns.
     
     return(list(testAndTrainData, groupedSubjectActivityData)) ## Returns both the full data set created above as well as the Activity and Subject Means data set as a list.

}