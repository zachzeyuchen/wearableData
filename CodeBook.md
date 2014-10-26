#CodeBook

1. The script first reads each file under the training and test folder into different and then use rbind() to merge the same type of data.
2. Reads in features and activity labels, the use regular expression to select the feature names contains mean() and std(). Use the corresponding columns to subset the features data loaded in earlier.   
3.