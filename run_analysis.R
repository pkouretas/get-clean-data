
path <- "./UCI HAR Dataset/"
test_folder <- "test/"
train_folder <- "train/"

# **********************************************************
# STEP 1. 
# Merge the training and the test sets to create one data set.
# **********************************************************

# merge measurements
data_train <- read.table(file = paste(sep = "", path, train_folder, "X_train.txt"))
data_test <- read.table(file = paste(sep = "", path, test_folder, "X_test.txt"))
data <- rbind(data_train, data_test)
rm(list = c("data_train", "data_test"))

# merge activities
activities_train <- read.table(file = paste(sep = "", path, train_folder, "y_train.txt"))
activities_test <- read.table(file = paste(sep="", path, test_folder, "y_test.txt"))
activities <- rbind(activities_train, activities_test)
rm(list = c("activities_train", "activities_test"))

# merge subject Id
subjects_train <- read.table(file = paste(sep = "", path, train_folder, "subject_train.txt"))
subjects_test <- read.table(file = paste(sep="", path, test_folder, "subject_test.txt"))
subjects <- rbind(subjects_train, subjects_test)
rm(list = c("subjects_train", "subjects_test"))


# **********************************************************
# STEP 2. 
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# **********************************************************

path_to_feature_names <- paste(path, "features.txt", sep = "")  # "./UCI HAR Dataset/features.txt"
feature_names <- read.table(path_to_feature_names, stringsAsFactors = F)[,2]
indices_mean <- grep("-mean\\(\\)", feature_names, ignore.case = T)
indices_std <- grep("-std\\(\\)", feature_names, ignore.case = T)
# Union to remove duplicates. Then sort to keep relative position of columns
indices_mean_std <- sort(union(indices_mean, indices_std))
# subset data
data_mean_std <- data[,indices_mean_std]
rm("data")

# **********************************************************
# STEP 3. 
# Uses descriptive activity names to name the activities in the data set
# **********************************************************

# Extact activities
activity_labels <- c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING","STANDING","LAYING")
activities$V1 <- as.factor(activity_labels[activities$V1])


# **********************************************************
# STEP 4. 
# Appropriately labels the data set with descriptive variable names. 
# **********************************************************
valid_column_names <- make.names(names=feature_names[indices_mean_std], unique=TRUE, allow_ = TRUE)
data_all <- cbind(subjects, activities, data_mean_std)
names(data_all) <- c("subjectId", "activity", feature_names[indices_mean_std])#valid_column_names)


# **********************************************************
# STEP 5. 
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# **********************************************************
by_activity_and_subject <- group_by(data_all, activity, subjectId)
tidy_data_set <- summarise_each(by_activity_and_subject, funs(mean))
write.table(tidy_data_set, file = "tidy_set.txt", row.names = FALSE)
