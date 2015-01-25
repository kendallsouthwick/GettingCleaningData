# CodeBook

This is the code book for the course project.

## Use
This analysis script is a R function that assumes the file structure given in
this repository.  The file run_analysis.R needs to be sourced into your R 
environment and then executed by typing "run_analysis()".

## Variables.
All arabiles are measured in g, execpt for subject and activity.

* subject
* activity
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tGravityAcc-mean()-X       
* tGravityAcc-mean()-Y        
* tGravityAcc-mean()-Z        
* tBodyAccJerk-mean()-X      
* tBodyAccJerk-mean()-Y       
* tBodyAccJerk-mean()-Z       
* tBodyGyro-mean()-X         
* tBodyGyro-mean()-Y          
* tBodyGyro-mean()-Z          
* tBodyGyroJerk-mean()-X     
* tBodyGyroJerk-mean()-Y      
* tBodyGyroJerk-mean()-Z      
* tBodyAccMag-mean()         
* tGravityAccMag-mean()       
* tBodyAccJerkMag-mean()      
* tBodyGyroMag-mean()        
* tBodyGyroJerkMag-mean()     
* fBodyAcc-mean()-X           
* fBodyAcc-mean()-Y          
* fBodyAcc-mean()-Z           
* fBodyAccJerk-mean()-X       
* fBodyAccJerk-mean()-Y      
* fBodyAccJerk-mean()-Z       
* fBodyGyro-mean()-X          
* fBodyGyro-mean()-Y         
* fBodyGyro-mean()-Z          
* fBodyAccMag-mean()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroJerkMag-mean()
* tBodyAcc-std()-X           
* tBodyAcc-std()-Y            
* tBodyAcc-std()-Z            
* tGravityAcc-std()-X        
* tGravityAcc-std()-Y         
* tGravityAcc-std()-Z         
* tBodyAccJerk-std()-X       
* tBodyAccJerk-std()-Y        
* tBodyAccJerk-std()-Z        
* tBodyGyro-std()-X          
* tBodyGyro-std()-Y           
* tBodyGyro-std()-Z           
* tBodyGyroJerk-std()-X      
* tBodyGyroJerk-std()-Y       
* tBodyGyroJerk-std()-Z       
* tBodyAccMag-std()          
* tGravityAccMag-std()        
* tBodyAccJerkMag-std()       
* tBodyGyroMag-std()         
* tBodyGyroJerkMag-std()      
* fBodyAcc-std()-X            
* fBodyAcc-std()-Y           
* fBodyAcc-std()-Z            
* fBodyAccJerk-std()-X        
* fBodyAccJerk-std()-Y        
* fBodyAccJerk-std()-Z        
* fBodyGyro-std()-X           
* fBodyGyro-std()-Y          
* fBodyGyro-std()-Z           
* fBodyAccMag-std()           
* fBodyBodyAccJerkMag-std()  
* fBodyBodyGyroMag-std()      
* fBodyBodyGyroJerkMag-std() 

## Summary choice.
The choices were given by the assignment.  In my case I selected the fields that meet
the conditions that variable name in the data set had either the string "mean(" or
"std(", along with the activity ans subject id.   Then used the aggregate function to
group the data and find the mean of the grouped data.

## Study design.
The way this analysis is design is to first read in the test and training data, add
the column names, then add columnd for the subject, activity and weither the obersvation
is test or training.  The next part is to merge the two data sets into one and then
convert the activity from a number to the correct string value of that activity.
Write out this data set as "merged_data.txt".   Next is to create a subset of the
merged data to one with all the required fields and write it out as "extracted_data.txt".
Finally create the tidy data set using the aggregation requirements given and write that
data set out as "tidy_data.txt".

