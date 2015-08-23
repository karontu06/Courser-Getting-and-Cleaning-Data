## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## UCI HAR DATASET must be unzipped and downloaded to a local directory prior to running the code.
## The directory must be specified in read.table()

##LIBRARIES NEEDED FOR THIS CODE
library(data.table)
library(reshape2)
library(plyr)

##I. CREATE A DATAFRAME FOR SUBJECT_TEST and SUBJECT_TRAIN FILE. LABEL THE VARIABLE SUBJECT_ID. RBIND THE SUBJECT_TEST and SUBJECT_TRAIN.
subtest<-read.table("~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt", col.names="Subject_ID")
subtrain<-read.table("~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt", col.names="Subject_ID")
subject_file<-rbind(subtest, subtrain)

##II. CREATE A DATAFRAME FOR Y_TEST AND Y_TRAIN FILE. LABEL THE VARIABLE ACTIVITY. RBIND THE Y_TST AND Y_TRAIN.
y_test<-read.table("~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt", col.names="Activity_Type")
y_train<-read.table("~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt", col.names="Activity_Type")
y_file<-rbind(y_test, y_train) 

##III. CREATE A DATAFRAME FOR X_TEST AND X_TRAIN. SET COL.NAMES=FEATURES. RBIND X_TEST AND X_TRAIN.
x_test<-read.table("~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/test/x_test.txt")
x_train<-read.table("~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/train/x_train.txt")
x_file<-rbind(x_test, x_train)

    ## NAME THE COLUMNS IN X_FILE.
    features = read.table("~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/features.txt")
    colnames(x_file) <- t(features[2])
    names(x_file)

##VI. SELECT ONLY VARIABLES THAT CONTAIN "mean" AND "std".
x_file=x_file[,grep("Mean|Std", colnames(x_file), ignore.case=TRUE)]
  ##select columns that are NOT named MeanFreq 
  x_file=x_file[,grep("MeanFreq", colnames(x_file), ignore.case=TRUE, invert = TRUE)]
  names(x_file)     
    
##V. COLUMN BIND SUBJECT_FILE, Y_FILE, X_FILE.
all_data<-cbind(subject_file, y_file, x_file)
names(all_data)     
   
##VI. ADD DESCRIPTIVE LABELS TO THE ACTIVITY_TYPE VARIABLE.
all_data$Activity_Type<-factor(all_data$Activity_Type,
                                   levels=c(1,2,3,4,5,6),
                                   labels=c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting","Standing","Laying"))
tail(all_data[ ,2])

##VII. LABEL THE DATASET WITH DESCRIPTIVE NAMES.
names(all_data)
names(all_data)<-gsub("Acc", "Accelerometer", names(all_data))
names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
names(all_data)<-gsub("BodyBody", "Body", names(all_data))
names(all_data)<-gsub("^t", "", names(all_data))
names(all_data)<-gsub("^f", "", names(all_data))
names(all_data)<-gsub("-mean()", "Mean", names(all_data), ignore.case = TRUE)
names(all_data)<-gsub("-std()", "STD", names(all_data), ignore.case = TRUE)
names(all_data)

##VII. CREATE A TIDY DATASET THAT CONTAINS THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND SUBJECT.
  all_data%>%
    melt(id=c("Subject_ID", "Activity_Type"))%>%
      ddply(.(Subject_ID, Activity_Type), summarise, Measurements_Means=mean(value))%>%
        write.table(file="~/Desktop/Coursera Courses/Getting and Cleaning Data/UCI HAR Dataset/tidymeans.txt", row.names=FALSE)
  
