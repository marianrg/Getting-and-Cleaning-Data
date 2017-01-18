# Getting-and-Cleaning-Data

##Steps to Run Script

1.	Download and unzip files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2.	Open the R script run_analysis.R using a text editor.
3.	Make the working directory the directory where the files where downloaded.
4.  The 'data.table' package should already be installed.
5.	Run the R script run_analysis.R. 

##Script Description

1.	The train and test data are merged into one data set 
2.	The measurements on the mean and standard deviation are kept. 
3.	The activity label numbers are replaced by their corresponding activity description 
4.	Each measurement is labeled with its corresponding label. 
5.	Using this data, a summary by subject and activity type is created with the mean for each measurement.

##Outputs produced

**‘summarydata.txt’:** it contains a summary with the average of each variable for each activity and each subject.
