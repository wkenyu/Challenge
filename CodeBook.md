

#Variable
Section1
##Variables for data frames

First target is to merge training and test sets, we need intermediate variables
to read and store sets from files. Those variables were named from the corresponding
file names:

variables
xtrain: data frame which contains training set
xtest:  data frame which contains test set
mergedData: data frame combines train and test

Section2
Extract specific column

 Second thing to do is extraction from the merged data set. We need to name each
 column of the merged data. Name is given by features file.

variables
features:  character vector which contains name of variables
matched:   vector of indecis that matches condition.
selected:  data frame selected out matched column from mergedData
