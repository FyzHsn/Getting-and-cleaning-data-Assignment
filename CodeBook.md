Code Book
=========

Experiment Background
---------------------
The raw data is from a Human activity recognition database built from the recordings of 30 subjects performing the daily activites: walking, walking upstairs, walking downstairs, sitting, standing and lying. The test subjects carried a waist mounted smartphone with embedded intertial sensors. 

Using the accelerometer, the x, y and z-axis linear acceleration, along with 3-axial angular velocity was recorded. The experiements were video recorded to manually decide what activity (walking, sitting, etc.) was taking place corresponding to the data. 

The resulting data set was partitioned randomly into two sets: test (30% of the volunteers) and train (70% of the volunteers).

Lastly, the acceleration and angular velocity magnitudes are normalized and hence the data range is [-1, 1].

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Components of the Raw Data
--------------------------
The raw data is stored in the ~/JHU_Data_Science/Course_3/Data/assignmentData folder. This folder contains another folder called "UCI HAR Dataset" which contains two folders named "test" and "train". The structure of these folders are identical. They both contain another folder called "Inertial Signals" which we ignore since it is not required by this assignment. The main acceleration data is contained in the "subject_train.txt" file. The "y_train.txt" data gives information about the corresponding activity being done by the person. A README file in a previous folder explains that the activities are donoted by the following numbers: WALKING - 1, WALKING_UPSTAIRS - 2, WALKING_DOWNSTAIRS - 3, SITTING - 4, STANDING - 5 and LAYING - 6. Furthermore, "subject_train.txt" file tells us which person (numbered 1 - 30) the data in the other two files correspond to.   

UCI HAR Dataset/ 
* test 
    * Inertial Signals  
    * subject_test.txt  
    * y_test.txt  
    * x_test.txt  
* train 
    * Inertial Signals  
    * subject_train.txt  
    * y_train.txt  
    * x_train.txt  
* activity_labels.txt  
* features.txt  
* features_info.txt  
* README.txt  
                   
Study Design
------------  
1. Download data into ~\JHU_Data_Science\Course_3\Data\assingmentData.zip.
2. Unzip data file manually.
3. Load files x_test, y_test, subject_test, x_train, y_train, subject_train, features into workspace.
4. Check which variables in the x_train and x_test data are the mean and standard deviations (std) by looking at the features.txt file and extracting corresponding column numbers. 
5. Resize x_test and y_test data by eliminating all non-mean and std related columns.
6. Change y_train/test column values (1, 2, ..., 6) to descriptive values of (walking, walking upstairs, ..., laying).
7. Rename y_train/test columns to activityID.
8. Rename subject_train/test columns to personID.
9. Merge subject_test, y_test and x_test data by column binding.
10. Merge subject_train, y_train and x_train data by column binding. 
11. Merge resulting merged data sets by row binding. This results in a data frame of test and train data with activity and person ID and relavant mean and std information of acceleration and angular velocity.
12. Clean up variable names by removing spaces, dashes and brackets.
13. Split merged data  according to personID.
14. Loop over personID values and split resulting data over activityID for each personID.
15. Compute the mean of all the data corresponding to a particular person and activity ID and store it in a data frame.
16. Write the data frame into a final text file.
