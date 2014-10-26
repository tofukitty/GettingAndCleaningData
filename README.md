GettingAndCleaningData Course Project
======================================

## **The R Script makes use of the following files from the UCI HAR Dataset**

* 'activity_labels.txt'

* 'train/X_train.txt'

* 'train/y_train.txt'

* 'train/subject_train.txt’

* 'test/X_test.txt'

* 'test/y_test.txt'

* 'test/subject_test.txt’


##**The R Script makes use of the following steps**


Step 1: Downloads the zip file to the working directory and unzips it

Step 2: Identifies the descriptive variable names for the measurement columns

Step 3: Reads the datasets into R, using the variable names from Step II as input for the column names for the test/train variable datasets

Step 4: Merges the test & train datasets with their subject and activity IDs, before merging both datasets into one - the “oneDataSet” - by common subject and activity IDs

Step 5: Updates the “oneDataSet” with only columns from the test/train variable datasets in step 4 which represent measurements on the means or standard deviation

Step 6: Descriptive activity numbers under the “Activity” ID column are now replaced with the activity names using the key from the file ‘features.txt’

Step 7: This is further processed in the “secondIndependentTidyDataSet” where values are averaged across each unique subject-activity ID

Step 8: “secondIndependentTidyDataSet” is written to the working directory as a text file, ready to be uploaded on Coursera!
