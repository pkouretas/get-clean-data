# get-clean-data
Getting and cleaning data repo


***Project Description***

The goal of this project is to clean a data set (the Human Activity Recognition Using Smartphones Data Set) as described in: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


***Study design and data processing***

**Collection of the raw data**

The data is provided at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
No further action is required from our part.


***Creating the tidy datafile***

**Guide to create the tidy data file**

1. Download the zip file from the link above and extract all the contents in the working directory. Preserve the structure  
of the extracted files and folders. 
2. Make sure you don't change the working directory. Working directory should be the root folder of the data
3. Run the script run_analysis.R
4. The script produces a file called "tidy_set.txt" 

**Cleaning of the data**

The cleaning process of the data is as follows: 
1. merge the training and the test sets to create one data set
2. From the 561 features available we extracts only the measurements on the mean and standard deviation for each measurement (66 columns in total)
3. we use descriptive activity names to name the activities in the data set (these are provided by the authors)
4. we change the names of the labels of the data set to use the names provided by the authors of the original work
5. Column bind the subjectId, the activity name, and the rest of the 66 meaurements to a new data set. Then group by activity and subject 
and calculate the mean of each measured variable.

***Description of the variables in the tiny_data.txt file***

the list of the variable of the tidy set is the following. More on the variable can be found in the accompanying codeBook
"activity"                    
"subjectId"                   
"tBodyAcc-mean()-X"          
"tBodyAcc-mean()-Y"           
"tBodyAcc-mean()-Z"           
"tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"            
"tBodyAcc-std()-Z"            
"tGravityAcc-mean()-X"       
"tGravityAcc-mean()-Y"        
"tGravityAcc-mean()-Z"        
"tGravityAcc-std()-X"        
"tGravityAcc-std()-Y"         
"tGravityAcc-std()-Z"         
"tBodyAccJerk-mean()-X"      
"tBodyAccJerk-mean()-Y"       
"tBodyAccJerk-mean()-Z"       
"tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"        
"tBodyAccJerk-std()-Z"        
"tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Y"          
"tBodyGyro-mean()-Z"          
"tBodyGyro-std()-X"          
"tBodyGyro-std()-Y"           
"tBodyGyro-std()-Z"           
"tBodyGyroJerk-mean()-X"     
"tBodyGyroJerk-mean()-Y"      
"tBodyGyroJerk-mean()-Z"      
"tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"       
"tBodyGyroJerk-std()-Z"       
"tBodyAccMag-mean()"         
"tBodyAccMag-std()"           
"tGravityAccMag-mean()"       
"tGravityAccMag-std()"       
"tBodyAccJerkMag-mean()"      
"tBodyAccJerkMag-std()"       
"tBodyGyroMag-mean()"        
"tBodyGyroMag-std()"          
"tBodyGyroJerkMag-mean()"     
"tBodyGyroJerkMag-std()"     
"fBodyAcc-mean()-X"           
"fBodyAcc-mean()-Y"           
"fBodyAcc-mean()-Z"          
"fBodyAcc-std()-X"            
"fBodyAcc-std()-Y"            
"fBodyAcc-std()-Z"           
"fBodyAccJerk-mean()-X"       
"fBodyAccJerk-mean()-Y"       
"fBodyAccJerk-mean()-Z"      
"fBodyAccJerk-std()-X"        
"fBodyAccJerk-std()-Y"        
"fBodyAccJerk-std()-Z"       
"fBodyGyro-mean()-X"          
"fBodyGyro-mean()-Y"          
"fBodyGyro-mean()-Z"         
"fBodyGyro-std()-X"           
"fBodyGyro-std()-Y"           
"fBodyGyro-std()-Z"          
"fBodyAccMag-mean()"          
"fBodyAccMag-std()"           
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-std()"   
"fBodyBodyGyroMag-mean()"     
"fBodyBodyGyroMag-std()"     
"fBodyBodyGyroJerkMag-mean()" 
"fBodyBodyGyroJerkMag-std()" 


Dimensions of the dataset: 180 x 68
