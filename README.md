Getting and Cleaning Data: Course Project
=========================================

Introduction
------------

This repository includes items needed for the course project from the Coursera
Getting and Cleaning Data Course.

Within this repository are found the following items:

1.  Readme.md explains what is contained in the repository and gives a brief
    explaination about the raw dataset.

2.  Codebook.md file explains the course project and transformations performed
    to the raw data.

3.  Run\_analysis.R script contains the steps needed to transform the raw data
    into a tidy dataset that contains the final measurements of interest.

4.  Tidymeans.txt is the final dataset which contains the final measurements of
    interest.

### Human Activity Recognition database (raw data)

A cohort of 30 subjects wore on the waist a smartphone embedded with an
accelerometer and gyroscope in order to capture 3-axial linear acceleration and
3-axial angular velocity at a constant rate of 50Hz. Each person performed six
activities including walking, walking\_upstairs, walking\_downstairs, sitting,
standing and laying. The resulting dataset was randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the training data
and 30% of the volunteers was selected for generating the test data.

#### The following files were needed for completion of this project.

1.  features.txt list all of the features (descriptive names of the
    measurements)

2.  activity\_labels.txt links the class labels with their activity names

3.  subject\_test.txt contains the subject id number for the test dataset

4.  subject\_train.txt contains the subject id number for the training dataset

5.  x\_test.txt is the test set (contains the test measurements)

6.  x\_train.txt is the training set (contains the training measurements)

7.  y\_test.txt contains the test labels

8.  y\_train.txt contains the training labels

##### Run\_analysis.R script

The run\_analysis.R script merges the test and training datasets together. The
UCI HAR Dataset must be unzipped and downloaded to a local directory. This
directory must be specified in the read.table() functions.

After reading in and merging the testing and training datasets, column names are
assigned and only variables that contain mean and std are kept. Descriptive
labels are then added to the activity\_type variable and the final dataset’s
variables are labeled with descriptive names.

Lastly, the script creates a tidy data set which contains the means of all the
columns per test subject and activity. This tidy dataset is written to a
tab-delimited file called tidymeans.txt, which is also be found in this
repository.

###### Code Book

The CodeBook.md file explains the transformations performed on the raw data and
explains the resulting data and variables. \# Getting-and-Cleaning-Data-Coursera
