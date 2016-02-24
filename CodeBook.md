# GettingCleaningDataCourseProject
This repo contains my course project submission for the "Getting and Cleaning Data" data science course.

## Explanation of Variables and Data Transformations
SEE README.TXT INSIDE THE UCI HAR Dataset FOLDER FOR EXPLANATION OF MEASUREMENTS TAKEN AND DATA PULLED FROM, AS WELL AS SCRIPT COMMENTS FIRST!

* activityLabels - a table whose first column contains the activity number for each measurement present in x_test.txt and x_train.txt, and whose second column contains a verbal description of the activity. 

* featureLabels - a table whose entries correspond to every type of measurement performed and recorded in x_test.txt and x_train.txt.

* subjectTestDataFrame and subjectTrainDataFrame - tables whose entries represent the subject whose accelerations are being measured. Each row of the data frame corresponds to a row contained in x_test.txt and x_train.txt.

* subjectTestVector and subjectTrainVector - creates a vector from the data in subjectTestDataFrame and subjectTrainDataFrame for later use in merging data

* activity_test and activity_train - tables whose entries respresent the activity number that was being performed for each measurement of the x_test.txt and x_train.txt data files

* activityTestVector and activityTrainVector - convert the information found in activity_test and activity_train to vectors containing the the descriptions of the activities being performed for each trial instead of the numbers

* x_test and x_train - data tables read in from x_test.txt and x_train.txt files. These are the data frames of the raw data

* hasMean (used for testing and training data at different times) - a boolean vector corresponding to columns of x_test and x_train which have mean data specifically


* hasStd (used for testing and training data at different times) - a boolean vector corresponding to columns of x_test and x_train which have standard deviation data specifically

* hasMeanOrStd (used for testing and training data at different times) - a boolean vector corresponding to columns of x_test and x_train which have mean OR standard deviation data specifically.

* testAndTrainData - a data frame which contains only the x_test and x_train data corresponding to mean or standard deviation data merged together. This is one of the two data frames returned by the script. Columns 67 and 68 of this data frame contain the subject number corresponding to the measurements contained in each row of the data frame as well as the activity description being performed for each test.

* subjectData - a data frame containing the average measurement for each type of mean or standard deviation measurement returned in testAndTrainData orgainzed by subject number (avg for subject 1, subject 2, etc...)


* activityData - a data frame containing the average measurement for each type of mean or standard deviation measurement returned in testAndTrainData orgainzed by activity description (avg for Walking, Sitting, etc...)


* activityAndSubjectData - a data frame comprised of the activityData followed by the subjectData beneath. Row one of the data frame is named "ActivityAndSubject" and contains each type of activity description followed by each subject number.