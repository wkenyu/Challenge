library(plyr)
library(data.table)
library(dplyr)

if(!exists("xtrain"))
  xtrain <- fread("~/DataScientist/UCI HAR Dataset/train/X_train.txt")
if(!exists("xtest"))
    xtest <- fread("~/DataScientist/UCI HAR Dataset/test/X_test.txt")

mergedData <- bind_rows(xtrain, xtest)

features <- fread("~/DataScientist/UCI HAR Dataset/features.txt")
features <- transpose(features[,2])

matched <- grep("std|mean[^Freq]", features)

selected <- select(mergedData, matched)

activity_labels <- read.table("~/DataScientist/UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("ID", "activity")
activity_labels[2] <-  c("Walking", "Walking_Upstairs", "Walking_Downstairs","Sitting", "Standing", "Laying")

ytrain <- fread("~/DataScientist/UCI HAR Dataset/train/y_train.txt")
ytest <- fread("~/DataScientist/UCI HAR Dataset/test/y_test.txt")

mergedLabel <- bind_rows(ytrain, ytest)

names(mergedLabel) <- "ID"

selected <- mutate(selected, activity = activity_labels[match(mergedLabel$ID, activity_labels$ID),2])

valid_name <- unname(grep("std|mean[^Freq]", features, value = TRUE))
valid_name <- gsub("-mean\\(\\)-*", "Mean", valid_name)
valid_name <- gsub("-std\\(\\)-*", "Std", valid_name)
valid_name <- gsub("^t", "Time", valid_name)
valid_name <- gsub("^f", "Freq", valid_name)
valid_name <- gsub("BodyBody", "Body", valid_name)
names(selected)[1:66] <- paste0("meanOf", valid_name)

subject_train <- read.table("~/DataScientist/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("~/DataScientist/UCI HAR Dataset/test/subject_test.txt")

mergedSubject <- bind_rows(subject_train, subject_test)
names(mergedSubject) <- "subject"

selected <- cbind(selected, mergedSubject)
result <- ddply(selected, .(activity, subject), colwise(mean))
