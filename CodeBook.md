# Codebook for Programming assignment 3
This code book describes the raw data that was used in this project, and the output tidy dataset.

#Overview
The raw data is sourced from the UCI Machine Learning Repository. The dataset used is the Human Activity Recognition Using Smartphones Data Set http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.

#Description of the raw data
Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##The raw dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about the raw dataset contact: activityrecognition@smartlab.ws

#Data files not used in this analysis
For the purpose of this analysis the files in the "Inertial Signals" sub folders were not used.

#Data Processing Steps
The data processing is performed by the R script in the file "run_analysis.r". It is invoked from the R command line by calling the function run_analysis().

The run_analysis() function performs the following steps:
1. Downloads the data from the source.
2. Unzips the downloaded file
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5. Applies descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names.
7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. Saves the processed dataset in a file called avg_har.csv

The output dataset contains the following variables:

activities: The activity performed
subject: Subject ID
tbodyaccmeanx: Mean time for acceleration of body for X direction
tbodyaccmeany: Mean time for acceleration of body for Y direction
tbodyaccmeanz: Mean time for acceleration of body for Z direction
tbodyaccstdx: Standard deviation of time for acceleration of body for X direction
tbodyaccstdy: Standard deviation of time for acceleration of body for Y direction
tbodyaccstdz: Standard deviation of time for acceleration of body for Z direction
tgravityaccmeanx: Mean time of acceleration of gravity for X direction
tgravityaccmeany: Mean time of acceleration of gravity for Y direction
tgravityaccmeanz: Mean time of acceleration of gravity for Z direction
tgravityaccstdx: Standard deviation of time of acceleration of gravity for X direction
tgravityaccstdy: Standard deviation of time of acceleration of gravity for Y direction
tgravityaccstdz: Standard deviation of time of acceleration of gravity for Z direction
tbodyaccjerkmeanx: Mean time of body acceleration jerk for X direction
tbodyaccjerkmeany: Mean time of body acceleration jerk for Y direction
tbodyaccjerkmeanz: Mean time of body acceleration jerk for Z direction
tbodyaccjerkstdx: Standard deviation of time of body acceleration jerk for X direction
tbodyaccjerkstdy: Standard deviation of time of body acceleration jerk for Y direction
tbodyaccjerkstdz: Standard deviation of time of body acceleration jerk for Z direction
tbodygyromeanx: Mean body gyroscope measurement for X direction
tbodygyromeany: Mean body gyroscope measurement for Y direction
tbodygyromeanz: Mean body gyroscope measurement for Z direction
tbodygyrostdx: Standard deviation of body gyroscope measurement for X direction
tbodygyrostdy: Standard deviation of body gyroscope measurement for Y direction
tbodygyrostdz: Standard deviation of body gyroscope measurement for Z direction
tbodygyrojerkmeanx: Mean jerk signal of body for X direction
tbodygyrojerkmeany: Mean jerk signal of body for Y direction
tbodygyrojerkmeanz: Mean jerk signal of body for Z direction
tbodygyrojerkstdx: Standard deviation of jerk signal of body for X direction
tbodygyrojerkstdy: Standard deviation of jerk signal of body for Y direction
tbodygyrojerkstdz: Standard deviation of jerk signal of body for Z direction
tbodyaccmagmean: Mean magnitude of body Acc
tbodyaccmagstd: Standard deviation of magnitude of body Acc
tgravityaccmagmean: Mean gravity acceleration magnitude
tgravityaccmagstd: Standard deviation of gravity acceleration magnitude
tbodyaccjerkmagmean: Mean magnitude of body acceleration jerk
tbodyaccjerkmagstd: Standard deviation of magnitude of body acceleration jerk
tbodygyromagmean: Mean magnitude of body gyroscope measurement
tbodygyromagstd: Standard deviation of magnitude of body gyroscope measurement
tbodygyrojerkmagmean: Mean magnitude of body body gyroscope jerk measurement
tbodygyrojerkmagstd: Standard deviation of magnitude of body body gyroscope jerk measurement
fbodyaccmeanx: Mean frequency of body acceleration for X direction
fbodyaccmeany: Mean frequency of body acceleration for Y direction
fbodyaccmeanz: Mean frequency of body acceleration for Z direction
fbodyaccstdx: Standard deviation of frequency of body acceleration for X direction
fbodyaccstdy: Standard deviation of frequency of body acceleration for Y direction
fbodyaccstdz: Standard deviation of frequency of body acceleration for Z direction
fbodyaccjerkmeanx: Mean frequency of body accerlation jerk for X direction
fbodyaccjerkmeany: Mean frequency of body accerlation jerk for Y direction
fbodyaccjerkmeanz: Mean frequency of body accerlation jerk for Z direction
fbodyaccjerkstdx: Standard deviation frequency of body accerlation jerk for X direction
fbodyaccjerkstdy: Standard deviation frequency of body accerlation jerk for Y direction
fbodyaccjerkstdz: Standard deviation frequency of body accerlation jerk for Z direction
fbodygyromeanx: Mean frequency of body gyroscope measurement for X direction
fbodygyromeany: Mean frequency of body gyroscope measurement for Y direction
fbodygyromeanz: Mean frequency of body gyroscope measurement for Z direction
fbodygyrostdx: Standard deviation frequency of body gyroscope measurement for X direction
fbodygyrostdy: Standard deviation frequency of body gyroscope measurement for Y direction
fbodygyrostdz: Standard deviation frequency of body gyroscope measurement for Z direction
fbodyaccmagmean: Mean frequency of body acceleration magnitude
fbodyaccmagstd: Standard deviation of frequency of body acceleration magnitude
fbodybodyaccjerkmagmean: Mean frequency of body acceleration jerk magnitude
fbodybodyaccjerkmagstd: Standard deviation of frequency of body acceleration jerk magnitude
fbodybodygyromagmean: Mean frequency of magnitude of body gyroscope measurement
fbodybodygyromagstd: Standard deviation of frequency of magnitude of body gyroscope measurement
fbodybodygyrojerkmagmean: Mean frequency of magnitude of body gyroscope jerk measurement
fbodybodygyrojerkmagstd: Standard deviation frequency of magnitude of body gyroscope jerk measurement

