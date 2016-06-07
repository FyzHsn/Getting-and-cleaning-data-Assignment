Code Book
=========

Experiment Background
---------------------
The raw data is from a Human activity recognition database built from the recordings of 30 subjects performing the daily activites: walking, walking upstairs, walking downstairs, sitting, standing and lying. The test subjects carried a waist mounted smartphone with embedded intertial sensors. 

Using the accelerometer, the x, y and z-axis linear acceleration, along with 3-axial angular velocity was recorded. The experiements were video recorded to manually decide what activity (walking, sitting, etc.) was taking place corresponding to the data. 

The resulting data set was partitioned randomly into two sets: test (30% of the volunteers) and train (70% of the volunteers).

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Components of the Raw Data
--------------------------
The raw data is stored in the ~/JHU_Data_Science/Course_3/Data/assignmentData folder. This folder contains another folder called "UCI HAR Dataset" which contains two folders named "test" and "train". The structure of these folders are identical. They both contain another folder called "Inertial Signals" which we ignore since it is not required by this assignment. The main acceleration data is contained in the "subject_train.txt" file. The "y_train.txt" data gives information about the corresponding activity being done by the person. A README file in a previous folder explains that the activities are donoted by the following numbers: WALKING - 1, WALKING_UPSTAIRS - 2, WALKING_DOWNSTAIRS - 3, SITTING - 4, STANDING - 5 and LAYING - 6. Furthermore, "subject_train.txt" file tells us which person (numbered 1 - 30) the data in the other two files correspond to.   

UCI HAR Dataset/ 
+-- test 
    +-- Inertial Signals  
    +-- subject_test.txt  
    +-- y_test.txt  
                           - x_test.txt  
                  - train - Inertial Signals  
                          - subject_train.txt  
                          - y_train.txt  
                          - x_train.txt  
                  - activity_labels.txt  
                  - features.txt  
                  - features_info.txt  
                  - README.txt  
                   



Study Design
------------
