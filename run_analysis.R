## download and load the data
features <- read.table("~/Desktop/UCI HAR Dataset/features.txt")
activities <- read.table("~/Desktop/UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("~/Desktop/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("~/Desktop/UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("~/Desktop/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("~/Desktop/UCI HAR Dataset/train/Y_train.txt")
head(features, 10)
head(activities)

## merge the training and the test sets
## have a look at the data and the dimensions of the data
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
## check properties of the data
head(features)
head(Y)
head(Subject)
## change the column names of the data
colnames(X) <- features$V2
colnames(Y) <- "Activity"
colnames(Subject) <- "Subject"
Merged_Data <- cbind(X, Y, Subject)
head(Merged_Data)
dim(Merged_Data)
colnames(Merged_Data)

## extracts only the mean and standard deviation of each measurement
## define the columns that contain mean or std
Columns_mean_std <- grep(".*Mean.*|.*Std.*", names(Merged_Data), ignore.case=TRUE)
RequiredColumns <- c(Columns_mean_std, 562, 563)
Extracted_Data <- Merged_Data[,RequiredColumns]
dim(Extracted_Data)

## use descriptive activity names to name the activities in the dataset
## the dataset activities contain all the names
colnames(Extracted_Data)
head(activities)
Extracted_Data$Activity <- as.character(Extracted_Data$Activity)
for (i in 1:6) {
  Extracted_Data$Activity[Extracted_Data$Activity == i] <- as.character(activities[i, 2])
}
Extracted_Data$Activity <- as.factor(Extracted_Data$Activity)
Extracted_Data$Activity

## label the data set with descriptive variable names
names(Extracted_Data)
names(Extracted_Data)<-gsub("Acc", "Accelerometer", names(Extracted_Data))
names(Extracted_Data)<-gsub("Gyro", "Gyroscope", names(Extracted_Data))
names(Extracted_Data)<-gsub("BodyBody", "Body", names(Extracted_Data))
names(Extracted_Data)<-gsub("Mag", "Magnitude", names(Extracted_Data))
names(Extracted_Data)<-gsub("^t", "Time", names(Extracted_Data))
names(Extracted_Data)<-gsub("^f", "Frequency", names(Extracted_Data))
names(Extracted_Data)<-gsub("tBody", "TimeBody", names(Extracted_Data))
names(Extracted_Data)<-gsub("-mean()", "Mean", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("-std()", "STD", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("-freq()", "Frequency", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("angle", "Angle", names(Extracted_Data))
names(Extracted_Data)<-gsub("gravity", "Gravity", names(Extracted_Data))
names(Extracted_Data)

## create a second, independent tidy data with the average of each variable for each activity and subject
Extracted_Data$Subject <- as.factor(Extracted_Data$Subject)
Tidy_Data <- aggregate(. ~Subject + Activity, Extracted_Data, mean)
Tidy_Data <- Tidy_Data[order(Tidy_Data$Subject,Tidy_Data$Activity),]
write.table(Tidy_Data, file = "Tidy.txt", row.names = FALSE)
Tidy_Data
dim(Tidy_Data)






