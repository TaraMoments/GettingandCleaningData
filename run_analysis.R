########################################################################
# This run_analysis.R merges train and test data sets of human activity#
# recognition using smartphones.                                       #
########################################################################

###### STEP ONE #######################################################
###### Beginning of merging data sets of the test set. ################ 
# Merge three data sets of the test set:  
# Data files for the test set: x_test.txt, y_test.txt, subject_test.txt.

# Get data from subject_test.txt
# Subject_test.txt identifies the subject who performed the activity for 
# each window sample.  
subject_test <- read.table(file = "subject_test.txt")
 
# Get data from y_test.txt
# y_test.txt contains activity labels for each experiment row entry. 
y_test <- read.table(file = "y_test.txt") 

# Merge the subject with his/her activity.
test_data <- cbind(subject_test, y_test)

# Get data from x_test.txt. 
# x_test.txt containing 561 columns for selected measurements.  
x_test <- read.table(file = "x_test.txt")
 
# Merge data of subject and activity with their corresponding measurements.
test_data <- cbind(test_data, x_test)
 
###### End of merging data sets of the test set. ########################
###### Start of merging data sets of the train set. #####################
# Merge three data sets of the train set:  
# Data files for the test set: x_train.txt, y_train.txt, subject_train.txt.

# Get data from subject_train.txt
# subject_train.txt identifies the subject who performed the activity for 
# each window sample.  
subject_train <- read.table(file = "subject_train.txt")

# Get data from y_train.txt
# y_train.txt contains activity labels for each experiment row entry. 
y_train <- read.table(file = "y_train.txt")  

# Merge the subject with his/her activity.
train_data <- cbind(subject_train, y_train)
 
# Get data from x_test.txt. 
# x_test.txt containing 561 columns for selected measurements.  
x_train <- read.table(file = "x_train.txt")
 
# Merge data of subject and activity with their corresponding measurements.
train_data <- cbind(train_data, x_train)

# Merge the training and the test sets to create one data set.
dat <- rbind(train_data, test_data)

###### STEPS 2, 3, and 4 ############################################# 
# Read the names for the list of all measurements. 
feature_list <- read.table(file = "features.txt",  stringsAsFactors = FALSE)
# First column: measurement's column index  
# Second column: measurement name. 
names(feature_list) <- c("col_index", "feature")

# Rename the columns of our merged data to be more intuitive.
# This is the requested Step 4. 
names(dat) <- c("subject", "activity", feature_list$feature)

# Get column indexes of the measurements on the mean and the standard deviation 
# for each measurement using regular expressions. 
mean_sd_index <- names(dat)[grep("mean\\(\\)|std\\(\\)", names(dat))]

# Extracts only the measurements on the mean and standard deviation 
# for each measurement. This is the requested step 2. 
dat <- dat[, c("subject", "activity", mean_sd_index)]

# read the activity_labes
activity_dat <- read.table("activity_labels.txt")
names(activity_dat) <- c("label", "activity")

# Set "dat$activity" as factor and relevel "dat$activity" to name the activities
# in the data set
dat$activity <- as.factor(dat$activity)
levels(dat$activity) <- activity_dat$activity

###### STEP 5 ############################################# 
# Group the data by subject and activity. 
# For each subject and each activity, calcualte the mean of each variable.
mean_dat <- aggregate(formula = . ~subject + activity, 
                  data = dat, FUN = "mean")
# save the resulted data. 
write.table(mean_dat, file = "human_activity_recognition_using_smartphones.txt", 
            row.name=FALSE)