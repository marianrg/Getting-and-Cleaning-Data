#Getting and Cleaning Data Course Project
library(data.table)

#1. Merges the training and the test sets to create one data set.
#   Read subject tables
subject.train <- read.table("train/subject_train.txt", col.names="subject")
subject.test <- read.table("test/subject_test.txt", col.names="subject")

#   Read label tables
y.train <- read.table("train/y_train.txt", col.names="label")
y.test <- read.table("test/y_test.txt", col.names="label")

#   Read data tables
x.train <- read.table("train/X_train.txt")
x.test <- read.table("test/X_test.txt")

#   Merge tables
data <- rbind(cbind(subject.test, y.test, x.test),cbind(subject.train, y.train, x.train))

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#   read table with measurement labels
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
#   filter table by selecting only the labels with mean and std
filtered.features <- features[grep(c("*mean","*std"),features$V2, ignore.case = TRUE),]
#   filter data frame by the column numbers in filtered.feature
#   added + 2 to keep subject and labels column
datafiltered <- data[,c(1,2,filtered.features$V1+2)]

#3. Uses descriptive activity names to name the activities in the data set
#   Read Activity Labels table with the description to each Label Number
activity.labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
#   Replace label number in data table with label description
datafiltered$label <- activity.labels[datafiltered$label, 2]

#4. Appropriately labels the data set with descriptive variable names
#   Get current column names from data table
data_labels = colnames(datafiltered[3:48])
#   Remove V from the labels
dlabels <- data.frame(sub("*V","", data_labels))
#   Replace label number with corresponding measurement description
dlabels <- merge(filtered.features, dlabels, by.x="V1",by.y="sub...V.......data_labels.")  

#   Rename columns
colnames(datafiltered) <- c("subject","label",dlabels$V2)

#5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject
summary.data <- aggregate(datafiltered[,3:48],  by=list(subject = datafiltered$subject, label = datafiltered$label), mean)
write.table(summary.data, file = "summarydata.txt",row.name=FALSE)
