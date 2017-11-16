---
title: "CODEBOOK"
author: "J. Snyder"
date: "November 15, 2017"
output: html_document
---
For almost any data set, the measurements you calculate will need to be described in more detail than you can or should sneak into the spreadsheet. The code book contains this information. At minimum it should contain:

Information about the variables (including units!) in the data set not contained in the tidy data
Information about the summary choices you made
Information about the experimental study design you used

#Code Book

#Data Source

##As sourse data for work was used Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Tables of Data for Download

##x_train, y_train, x_test, y_test, subject_train and subject_test files contain the collected data from the downloaded files. Features and Activity files included common information used in collection

#Variables

##Activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
##tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX tBodyAccStdY tBodyAccStdZ tGravityAccMeanX tGravityAccMeanY tGravityAccMeanZ tGravityAccStdX tGravityAccStdY tGravityAccStdZ tBodyAccJerkMeanX BodyAccJerkMeanY tBodyAccJerkMeanZ tBodyAccJerkStdX tBodyAccJerkStdY tBodyAccJerkStdZ tBodyGyroMeanX tBodyGyroMeanY tBodyGyroMeanZ.............
##Subjects are labeled 1 through 30
## for detailed information about the variables see:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Transformations
##all data was combined in a single dataset with maintaining columns as variables and rows as observations. The
##data was supplied broken into x, y, training, and test sets.  Finally the data labels are expanded to descriptive titles from their abbreviated codes.  A final summary table includes the means of the mean and standard deviation variables grouped by subject and activity (180 observations, 30 subjects and 6 activities)
##with the