#CodeBook
##Steps
1. The script first reads each file under the training and test folder into different and then use rbind() to merge the same type of data.
2. Reads in features and activity labels, the use regular expression to select the feature names contains mean() and std(). Use the corresponding columns to subset the features data loaded in earlier.
3. Merge the privious dataset with the activity labels to label the code with actual names
4. Goup the data by subject and activity and take means on each other columns
5. Output the data to tidy_data.txt

##Variables
* subjects_train   *subjects from the training set*
* x_train   *features data from the traning set*
* y_train  *activty code from the training set*
* subjects_test  *subjects from the training set*
* x_test  *features data from the traning set*
* y_test  *activty code from the training set*
* subjects  *combine of subjects from training and test*
* x  *combine of training and test features*
* y  *combine of training abd test acivity code*
* ptn  *reular expression for means and stds*
* features  *col number of selected features*
* mydata *merged data set*
* tidy_data *final dataset grouped by subject and activity*
