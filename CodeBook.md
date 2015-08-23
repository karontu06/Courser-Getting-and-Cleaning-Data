\#Codebook for the tidymeans.txt dataset.

This code book describes variables found in the tidymeans dataset, the source of
the raw data, and transformations performed to clean up the tidymeans dataset.

 

\#\#Data Source

The raw data was obtained from
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

A description of the datafiles is found in the README.txt file.

 

\#\#\#Variables Found in Tidymeans

The tinymeans data.table contains the following variables:

1. Subject\_ID- Identifier given to participants in the study.

2. Activity\_Type-Labels the six activities (walking, walking\_upstairs,
walking\_downstairs, sitting, standing, laying) performed by each participants.

3. Measurements\_Means- Mean of all measurement variables by Subject\_ID and
Activity\_Type.  


\#\#\#\#Dataset Transformation

The following items are performed to the dataset:

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation for each
    measurement.

3.  Uses descriptive activity names to name the activities in the data set

4.  Appropriately labels the data set with descriptive activity names.

5.  Creates a second, independent tidy data set with the average of each
    variable for each activity and each subject.

 

\#\#\#\#\#Run\_analysis.R code

-   Loads test and train data from local directory.

-   Loads the features and activity labels datasets.

-   Applies the features to column names.

-   Merges all files together.

-   Keeps only variables containing “mean” or “std” in column names.

-   Cleans up the variable names to make them more descriptive.

-   Creates a tidy dataset that calculates the mean of each variable for each
    activity and each subject.
