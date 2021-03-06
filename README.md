https://class.coursera.org/getdata-013

run_analysis.R works with reshape2 package (please install it before running) and it does the following: 

1 Merges the training and the test sets to create one data set.

2 Extracts only the measurements on the mean and standard deviation for each measurement. 

3 Uses descriptive activity names to name the activities in the data set

4 Appropriately labels the data set with descriptive variable names. 

5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

Repository structure

directory /project_data, contains all files needed for evaluation by run_analysis.R

README.md - describe how the script works 

codebook.md - describe variables

run_analysis.R - produces the tidyData.txt file


run_analysis.R script:

1 create directory on local machine to clone the repository

2 change directory to 1

3 clone this repository

4 change directory to GettingAndCleaningData

5 start R

6 source("run_analysis.R")
