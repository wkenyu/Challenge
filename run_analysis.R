xtrain <- fread("~/DataScientist/UCI HAR Dataset/train/X_train.txt")
xtest <- fread("~/DataScientist/UCI HAR Dataset/test/X_test.txt")

mergedData <- bind_rows(xtrain, xtest)

features <- fread("~/DataScientist/UCI HAR Dataset/features.txt")
features <- transpose(features[,2])
           

matched <- grep("std|mean[^Freq]", features)

selected <- select(mergedData, matched)