# Tidying Data Set 'Human Activity Recognition Using Smartphones'

## Files in this repo
- README.md - this file, describing the steps in the script
- codebook.md - the codebook describing data
- assignment.R - the script for the assignment

## Description of the data
The original data that was used in this assignment, including a detailed description on the experiments can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Summarizing, the dataset consists of data from 30 volunteers (19-48y) that performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) while wearing a smartphone (Samsung Galaxy S II) with accelerometer and gyroscope, resulting in 3-axial linear acceleration and 3-axial angular velocity (50Hz). The dataset was randomly divided in a test set (70% of subjects) and a train set (30% of subjects).

For each record in this data set the following data were provided:
- Subject id
- Activity label
- A 561-feature vector with time and frequency domain variables. 
- Total acceleration and the estimated body acceleration (not used in this assignment, can be found in the 'Inertial signal' folder)
- Triaxial angular velocity from the gyroscope (not used in this assignment, can be found in the 'Inertial signal' folder)

A detailed description of the variables in the used datasets can be found in the code book.

## Goal of this script
This script's goal is to prepare tidy data that can be used for later analysis. It does the following to the original test and train datasets:
- Preprocessing and labeling dataset with descriptive variable names 
- Merging the training and the test sets into one data set
- Replacing activity labels by tidy descriptive activity names
- Extracting the measurements on the mean and standard deviation for each measurement 
- Creating a second dataset with the average of each variable, per activity and subject

This script therefore results in two data sets:
1. dataSet: tidy data set with subject IDs, activity labels and all means and standard deviations of all variables
2. averages: data set with averages for every variable from the first data set per subject and activity

Below you can find a short overview of the different steps.

## Preprocessing and labeling features
For both the test and train sets, the 561-feature vector, the subject IDs and labels for activities (1-6) are stored in separate text files. In this step, the datasets (testSet/trainSet) are being merged with the labels (testLabels/trainLabels) and the subject IDs (testSubj/trainSubj), into a new data set (test/train). The 561 features can be labeled using the features.txt file. The script removes numbers and spaces from the feature names and replaces dashes with underscores. The resulting test set has 2947 records with 563; the train set 7352 records with 563 variables.

## Merging test and train sets
There are a few checks in the script to ensure that the datasets are similar and not overlapping in subject IDs. Subsequently, rbind is used to make one set out of the test and train set (merge_df). This set has 10299 records.

## Activity labels
The activity labels are still numbers in this dataset and are being replaced by descriptive labels in this step. The corresponding descriptive labels can be found in 'activity_labels.txt'. If an activity label number matches one of the numbers in the actLabels set, it is replaced by the corresponding descriptive label.

## Selecting only measurements with mean() or std()
In this step, from testtrain only the vars are selected that contain mean() or std(), in addition to the subject IDs (id) and activity labels (activity). The resulting dataframe is named 'dataSet'. After this step, the parentheses are removed from the variable names.

## Creating second dataset with averages
A second dataset is created with the averages of the dataSet variables per subject ID and per activity. Group_by and summarise are used to make this dataset, which is named 'averages'.

## Libraries used
- library(dplyr)
- library(stringr)




