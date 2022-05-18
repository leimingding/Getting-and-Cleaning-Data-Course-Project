# Getting-and-Cleaning-Data-Course-Project

The whole data set is about human activity recognition using smartphones. The data is from a group of 30 volunteers within an age range of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 70% of the volunteers was selected for generating the training data and 30% the test data.

The first step is to merge the training and the test sets to create one data set.
In this step, all of the data is uploaded. First, use row-binds to merge x_train and x_test, then to merge y_train and y_test, and next to merge subject_train and subject_test. Finally, use column-binds to merge the above three sets together into one full set Merged_Data.

For the second task, first define the columns with mean or standard deviation, and then extract all the columns with mean or standard deviation from Merged_Data into Extracted_Data.

For the third task, change the names of the column Activity in the Extracted_Data.

For the fourth task, use full names to label the data.

For the fifth task, create a tidy data with the average of each variable for each subject and each activity.
