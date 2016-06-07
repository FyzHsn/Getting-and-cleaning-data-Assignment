## This R script should do the following:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for
##    each measurement.
## 3) Uses descriptive activity names to name the activities in the data set.
## 4) Appropriately labels the data set with descriptive variable names.
## 5) From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each 
##    subject.


## Download data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destination <- "C:\\Users\\Windows\\Documents\\JHU_Data_Science\\Course_3\\Data\\assignmentData.zip" 
download.file(url, destination)

## Load test data into workspace
y_test <- read.table("~/JHU_Data_Science/Course_3/Data/assignmentData/UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("~/JHU_Data_Science/Course_3/Data/assignmentData/UCI HAR Dataset/test/x_test.txt")
subject_test <- read.table("~/JHU_Data_Science/Course_3/Data/assignmentData/UCI HAR Dataset/test/subject_test.txt")

## Load train datat into workspace
y_train <- read.table("~/JHU_Data_Science/Course_3/Data/assignmentData/UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("~/JHU_Data_Science/Course_3/Data/assignmentData/UCI HAR Dataset/train/x_train.txt")
subject_train <- read.table("~/JHU_Data_Science/Course_3/Data/assignmentData/UCI HAR Dataset/train/subject_train.txt")

## Load file containing variable names for X_train and X_test data: features.txt
feature_names <- read.table("~/JHU_Data_Science/Course_3/Data/assignmentData/UCI HAR Dataset/features.txt")

## Dimensions of files
dim(y_test)
dim(x_test)
dim(subject_test)
dim(y_train)
dim(x_train)
dim(subject_train)
dim(feature_names)

## Determining which columns correspond to the mean or standard deviation
## of the data
column_nums <- grep("mean|std", feature_names[, 2])

## Remove unused columns from x_train/test
x_train <- x_train[, column_nums]
x_test <- x_test[, column_nums]

## Change y_train/test column values into descriptive names such as walking, 
## sitting etc.
y_train[, 1] <- gsub("1", "walking", y_train[, 1])
y_train[, 1] <- gsub("2", "walking upstairs", y_train[, 1])
y_train[, 1] <- gsub("3", "walking downstairs", y_train[, 1])
y_train[, 1] <- gsub("4", "sitting", y_train[, 1])
y_train[, 1] <- gsub("5", "standing", y_train[, 1])
y_train[, 1] <- gsub("6", "laying", y_train[, 1])

y_test[, 1] <- gsub("1", "walking", y_test[, 1])
y_test[, 1] <- gsub("2", "walking upstairs", y_test[, 1])
y_test[, 1] <- gsub("3", "walking downstairs", y_test[, 1])
y_test[, 1] <- gsub("4", "sitting", y_test[, 1])
y_test[, 1] <- gsub("5", "standing", y_test[, 1])
y_test[, 1] <- gsub("6", "laying", y_test[, 1])

## Rename columns y_train/test
names(y_train) <- "activityID"
names(y_test) <- "activityID"

## Rename columns subject_train/test
names(subject_train) <- "personID"
names(subject_test) <- "personID"

## Rename columns of x_train/test
names(x_train) <- feature_names[column_nums, 2] 
names(x_test) <- feature_names[column_nums, 2]

## Merge all components of the test data
merged_test <- cbind(subject_test, y_test, x_test)
dim(merged_test)

## Merge all components of the train data
merged_train <- cbind(subject_train, y_train, x_train)
dim(merged_train)

## Merge or bind rows of test and train data
merged_data <- rbind(merged_train, merged_test) 

## Factor merged data by personID and take the mean for each activity name
