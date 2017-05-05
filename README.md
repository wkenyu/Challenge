### Outline
　This repository explains the result of the final project in "Getting and Cleaning the Data" Coursera corse.
### Result
 *result.csv* is the data set that has been created for this project.To read this file, download this file to your
 working directory and type this,
 ```
 read.table("foo.csv", header = TRUE, sep = ",", row.names=1)
```

### run_analysis.R
 This script file does following things:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Why result data is tidy
The data sets in the training data and test data contains multiple time experiment on the same activity and the same subject.This means that multiple observations occur in one data set. This is not tidy data set.
The script merges training and test data set, and take the mean of measurement for each activities and for each subjects. This causes single type of observation in one data set.
