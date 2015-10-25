This file describes exact steps performed on the raw Samsung data to get the tidy data set stored by human\_activity\_recognition\_using\_smartphones.txt. It also describes the variables in the tiday data set and provides the source for the raw Samsung data. 

## Exact steps from raw data to the tidy data in R
1. Read data from subject\_test.txt 
2. Read data from y\_test.txt
3. Read data from x\_test.txt
3. Merge subject, y\_test and x\_test data by cbind(). Store the resulted data as test\_data. 
4. Repeat steps 1-4 on the raw train data set using the corresponding files subject\_train.txt, y\_train.txt, y\_train.txt. Store the resulted data as train\_data
5. Merge the train\_data and test\_data by cbind(). Store the resulted data as dat
6. Read data from features.txt, and get the list of measurement names. 
7. Rename the columns of dat to be "subject", "activity" and the list of measurement names provided by the data from features.txt. 
8. Subsetting dat by extracting the columns "subject", "activity" and only the measurements of the mean and the standard deviation for each measurement.
9. Read data from activity_labels.txt and obtain more descriptive activity names.
10. Re-level the activity column of dat from 1 to 6 to the more descriptive activity names (e.g. Walking). 
11. Create a second data set by only including "subject", "activity", and the mean of each variable for each subject and each activity.

## Code book 
### Variables 
The tidy data set has 180 rows and 68 variables. 

* subject (integer): subject who performed the activity for each window sample. It ranges from 1 to 30.
* activity (factor with 6 levels): the activities performed by subjects. Each person performed six activities. 
   * WALKING
   * WALKING\_UPSTAIRS
   * WALKING\_DOWNSTAIRS
   * SITTING
   * STANDING
   * LAYING.  
   
* The following 66 variabes are the *means* of the mean and the standard deviation of the raw data measurements for each subject and each activity. Some of the variables have the pattern '-XYZ', which is used to denote 3-axial signals in the X, Y and Z directions. A full description about the mean and the standard deviation of the raw data measurements can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

 3. tBodyAcc-mean()-XYZ (numumerical)
 6. tBodyAcc-std()-XYZ (numumerical)
 9. tGravityAcc-mean()-XYZ (numumerical)
 12. tGravityAcc-std()-XYZ (numumerical)
 15. tBodyAccJerk-mean()-XYZ (numumerical)
 18. tBodyAccJerk-std()-XYZ (numumerical)
 18. tBodyGyro-mean()-XYZ (numumerical)
 18. tBodyGyro-std()-XYZ (numumerical)
 18. tBodyGyroJerk-mean()-XYZ (numumerical)
 18. tBodyGyroJerk-std()-XYZ (numumerical)
 18. fBodyAcc-mean()-XYZ (numumerical)
 18. fBodyAcc-std()-XYZ (numumerical)
 18. fBodyAccJerk-mean()-XYZ (numumerical)
 18. fBodyAccJerk-std()-XYZ (numumerical)
 19. fBodyGyro-mean()-XYZ (numumerical)
 20. fBodyGyro-std()-XYZ (numumerical)
 18. tBodyAccMag-mean() (numumerical)
 18. tBodyAccMag-std() (numumerical)
 18. tGravityAccMag-mean() (numumerical)
 18. tGravityAccMag-std() (numumerical)
 18. tBodyAccJerkMag-mean() (numumerical)
 18. tBodyAccJerkMag-std() (numumerical)
 18. tBodyGyroMag-mean() (numumerical)
 18. tBodyGyroMag-std() (numumerical)
 18. tBodyGyroJerkMag-mean() (numumerical)
 18. tBodyGyroJerkMag-std() (numumerical)
 21. fBodyAccMag-mean() (numumerical)
 22. fBodyAccMag-std() (numumerical)
 23. fBodyBodyAccJerkMag-mean() (numumerical)
 24. fBodyBodyAccJerkMag-std() (numumerical)
 25. fBodyBodyGyroMag-mean() (numumerical)
 26. fBodyBodyGyroMag-std() (numumerical)
 27. fBodyBodyGyroJerkMag-mean() (numumerical)
 28. fBodyBodyGyroJerkMag-std() (numumerical)

 ## Source for the raw Samsung data
 A full description about the raw Samsung data is available at the [UCI Marchine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained. The raw Samsung data can be download [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
 
 

 

 
