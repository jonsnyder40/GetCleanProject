# submit: 1) a tidy data set as described below,
#         2) a link to a Github repository with your script for performing the analysis
#         3) a code book that describes the variables, the data, and any transformations
#            or work that you performed to clean up the data called CodeBook.md. You should
#            also include a README.md in the repo with your scripts. This repo explains how
#            all of the scripts work and how they are connected.

# One of the most exciting areas in all of data science right now is wearable computing 
# - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to
# develop the most advanced algorithms to attract new users. The data linked to from the course
# website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
# A full description is available at the site where the data was obtained:
        
#        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Here are the data for the project:
        
#        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# download the data files and unzip to directory
# if(!file.exists("./data")){dir.create("./data")}
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl,destfile="./Data/GetCleanDataProj/Dataset.zip")
# unzip(zipfile="./Data/GetCleanDataProj/Dataset.zip",exdir="./Data/GetCleanDataProj")



# You should create one R script called run_analysis.R that does the following.

# set working directory
rm(list=ls())
setwd("C:/Data/GetCleanDataProj")

# read feature and activity tables
features <- read.table('./features.txt', header = FALSE)
activity_labels <- read.table('./activity_labels.txt', header = FALSE)

# Reading trainings tables:
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# add column names to tables
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activity_id"
colnames(subject_train) <- "subject_id"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activity_id"
colnames(subject_test) <- "subject_id"
colnames(activity_labels) <- c("activity_id", "activity_type")

# 1. Merges the training and the test sets to create one data set.

train <- cbind(y_train, subject_train, x_train)
test <- cbind(y_test, subject_test, x_test)
merged_dt <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

cnames <- colnames(merged_dt)
mean_std <- (grepl("activity_id" , cnames) | 
                              grepl("subject_id" , cnames) | 
                              grepl("mean.." , cnames) | 
                              grepl("std.." , cnames) 
)
mean_stddt <- merged_dt[,mean_std]

# use grepl to make a TRUE FALSE vector of the combined data for the variables
# use the grepl to index the cbind and rbind dataset

# 3. Uses descriptive activity names to name the activities in the data set
# use the merge command to name the activities in the data set.

activity_dt <- merge(activity_labels, mean_stddt, by='activity_id', all.x=TRUE)

# 4. Appropriately labels the data set with descriptive variable names.
library(stringr)

cnames <- colnames(activity_dt)
cnames_org <- cnames
       # cnames <- str_replace(cnames,"[:punct:]","")
        cnames <- str_replace(cnames,"std","Standard Deviation ")
        cnames <- str_replace(cnames,"mean","Mean ")
        cnames <- str_replace(cnames,"^(t)","Time ")
        cnames <- str_replace_all(cnames,"(^(f)|[Ff]req)","Frequency ")
        cnames <- str_replace(cnames,"([Gg]ravity)","Gravity ")
        cnames <- str_replace(cnames,"([Bb]ody[Bb]ody|[Bb]ody)","Body ")
        cnames <- str_replace(cnames,"[Gg]yro","Gyro ")
        cnames <- str_replace(cnames,"Acc","Acceleration ")
        cnames <- str_replace(cnames,"[Jj]erk","Jerk ")
        cnames <- str_replace(cnames,"[Mm]ag","Magnitude ")
        cnames <- str_replace_all(cnames,"-","")
        cnames <- str_replace(cnames,"\\(","")
        cnames <- str_replace(cnames,"\\)","")

colnames(activity_dt) <- cnames

# to view column names for tidy
df <- cbind(cnames,cnames_org)
# df
# 5. From the data set in step 4, creates a second, independent tidy data set with the average
#       of each variable for each activity and each subject.

Tidydt <- aggregate(. ~subject_id + activity_type, activity_dt, mean)
Tidydt <- Tidydt[order(Tidydt$subject_id, Tidydt$activity_type),]

write.table(Tidydt, file = "tidytable.txt")

