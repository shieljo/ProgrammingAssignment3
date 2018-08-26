run_analysis<-function()
{
  #If the files haven't been downloaded before,
  #then download them
  if(!file.exists(".\\course3_data\\Dataset.zip"))
  {
    getData()  
  }
  
  #Read the test data into a dataframerun_analys
  test_data<-readData(
    ".\\UCI HAR Dataset\\test\\subject_test.txt",
    ".\\UCI HAR Dataset\\test\\Y_test.txt",
    ".\\UCI HAR Dataset\\features.txt",
    ".\\UCI HAR Dataset\\test\\X_test.txt" )

  #Read the training data into a dataframe
  train_data<-readData(
    ".\\UCI HAR Dataset\\train\\subject_train.txt",
    ".\\UCI HAR Dataset\\train\\Y_train.txt",
    ".\\UCI HAR Dataset\\features.txt",
    ".\\UCI HAR Dataset\\train\\X_train.txt" )
  
  #append the training data to the test data
  #to create a merged dataframe of all the raw data
  full_data<-rbind(test_data,train_data)
  
  #print(dim(test_data))
  #print(dim(train_data))
  #print(dim(full_data))
  
  #Create a dataframe that contains only the 
  #activity, subject, meand and std variables
  subset_data<-full_data[grep("activity|subject|\\.mean\\.|\\.std\\.",names(full_data))]
  

  #Make the variable names "tidy"
  new_col_names<-tolower(sub("^X[0-9]+\\.[tf]","",names(subset_data)))
  new_col_names<-sub("\\.\\.\\.X$","x",new_col_names)
  new_col_names<-sub("\\.\\.\\.Y$","y",new_col_names)
  new_col_names<-sub("\\.\\.\\.Y$","z",new_col_names)
  new_col_names<-sub("\\.\\.","",new_col_names)
  new_col_names<-sub("\\.mean","mean", new_col_names)
  new_col_names<-sub("\\.std","std", new_col_names)
  new_col_names<-sub("mean\\.","mean", new_col_names)
  new_col_names<-sub("std\\.","std", new_col_names)  
  names(subset_data)<-new_col_names

  
  #create a new variable which is a factor
  #of the activity variable
  subset_data$activityFac<-factor(subset_data$activity,labels=c(
    "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
  
  
  # create the averages dataframe
  num_cols<-ncol(subset_data)
  
  num_subjects = 6
  num_activities = 6
  
  avg_df <- data.frame()
  
  for ( sub in 1:num_subjects)
  {
      for ( act in 1:num_activities)
      {
        means = c( act, sub, 
          colMeans(subset_data[subset_data$activity==act & subset_data$subject==sub,][,c(4:num_cols-1)]) ) 

        avg_df<-rbind( avg_df, means )
      }
  }
  
  names(avg_df)<-new_col_names
  
  #change the activity variable from an integer 
  #to a descriptive factor
  avg_df$activity<-factor(avg_df$activity,labels=c(
    "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
  
  #output the tidy dataset
  avg_df
}

getData<-function()
{
  if(!file.exists(".\\course3_data"))
  {
    dir.create(".\\course3_data")
  }
  
  fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  download.file(fileURL, destfile=".\\course3_data\\Dataset.zip",method="curl")
  
  unzip(".\\data\\Dataset.zip")
}

readData<-function( subjectFile, activityFile, featureFile, measurementsFile )
{
  #Read in a vector of the feature names
  vec_col_names<-scan(featureFile,what="character",sep="\n")
  
  #Read the test measurements into a dataframe
  #and set the column names to be the names of the features
  test_measurements<-read.table(measurementsFile, col.names=vec_col_names)
  
  #Read the activities into a dataframe
  test_activities<-read.table(activityFile, col.names="activity")
  
  #Read the subjects into a dataframe
  test_subjects<-read.table(subjectFile, col.names="subject")
  
  #Combine the dataframes
  cbind(test_activities, test_subjects, test_measurements)
}