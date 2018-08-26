# ProgrammingAssignment3
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

This repo contains my submission for the Coursera/Johns Hopkins Data Science Specialisation course 3, peer-graded Assignment: Getting and Cleaning Data Course Project: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

The contents of this repository are:
1. An R script to process the some into a tidy data set: run_analysis.R
2. A code book for the assignment: CodeBook.md

The raw datafiles for this project are sourced from UCI Machine Learning repository dataset for Human Activity Recognition Using Smartphones (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The Human Activity Recognition database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The run_analysis.R script performs the following steps:
1. Downloads the data from the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.)
2. Unzips the downloaded file
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names. 
7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
