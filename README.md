# GettingCleaningDataCourseProject
This repo contains my course project submission for the "Getting and Cleaning Data" data science course.

## Description
The script run_analysis.R creates 2 tidy data sets useful for summarizing the means and standard deviations for a Samsung Galaxy phone accelerometer and gyroscope data set.

## Data Set Up and Instructions
1. Open "run_analysis.R" in Rstudio or R.
2. Unzip the file "samsungData.zip" found in the repo. Be sure the unzipped folder "UCI HAR Dataset" ends up in the working directory of Rstudio/R.
3. Run the script "run_analysis.R" being sure to save the output to a variable.
4. The script "run_analysis.R" returns a list of two data frames. 
* The first data frame contains the extracted mean and standard deviation data from "x_test.txt" and "x_train.txt". See "README.txt" in the "UCI HAR Dataset" folder for a description of the data contained in these two data sets.
* The second data frame averages the mean and standard deviation values organized by each subject and each activity. The first column contains the subject number, the second column the activity name, and the rest of the columns contain the averages of themean and standard deviation values for those subjects doing those activities.