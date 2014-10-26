run_analysis<- function(datafolder='/Users/zeyuchen/Desktop/Data Science/Getting and Cleaning Data/UCI HAR Dataset/'){
    
    ###################################STEP 1 #################################
    #Merges the training and the test sets to create one data set.
    library(dplyr)
    #Read feature and activity labels Data
    #datafolder<-'/Users/zeyuchen/Desktop/Data Science/Getting and Cleaning Data/UCI HAR Dataset/'
    features<-read.table(paste(datafolder,'features.txt',sep=''))
    activity_labels<-read.table(paste(datafolder,'activity_labels.txt',sep=''))
    
    #Read Training Data
    subjects_train<-read.table(paste(datafolder,'train/subject_train.txt',sep=''))
    x_train<-read.table(paste(datafolder,'train/X_train.txt',sep=''))
    y_train<-read.table(paste(datafolder,'train/y_train.txt',sep=''))
    #Read Test Data
    subjects_test<-read.table(paste(datafolder,'test/subject_test.txt',sep=''))
    x_test<-read.table(paste(datafolder,'test/X_test.txt',sep=''))
    y_test<-read.table(paste(datafolder,'test/y_test.txt',sep=''))
    #Merge Data
    subjects<-rbind(subjects_train,subjects_test)
    x<-rbind(x_train,x_test)
    y<-rbind(y_train,y_test)
   
    
    ###################################STEP 2 #################################
    #Extracts only the measurements on the mean and standard deviation for each measurement.
    ptn<-'mean\\(\\)|std\\(\\).*'
    ndx <- grep(ptn, features$V2)
    features<-features[ndx,]
    x<-x[,features[,1]]
    #combine everything
    mydata<-cbind(x,subjects,y)
    ###################################STEP 3 #################################
    #Uses descriptive activity names to name the activities in the data set
    colnames(mydata)[67]<-'subject'
    colnames(mydata)[68]<-'activity'
    #Megre activity Code with Names
    mydata<-merge(mydata,activity_labels,by.x='activity',by.y='V1')
    #Reorder the data
    mydata<-mydata[,c(68,69,2:67)]
    colnames(mydata)[2]<-'activity'
    
    ###################################STEP 4 #################################
    #Appropriately labels the data set with descriptive variable names.
    colnames(mydata)[3:68]<-as.character(features[,2])
    ###################################STEP 4 #################################
    #Data output
    #Group by subject and activity
    by_subject_activity<-group_by(mydata,subject,activity)
    #summarise_each means of the features
    tidy_data<-data.frame(summarise_each(by_subject_activity,funs(mean)))
    write.table(tidy_data,'tidy_data.txt',row.name=FALSE)
}