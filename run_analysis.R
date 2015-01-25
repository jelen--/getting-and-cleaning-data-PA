## Download and check all documents
data <- unzip("./dataset.zip")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
dim(trainx)
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
dim(testx)

ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
dim(trainy)
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
dim(testy)

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
dim(subjecttrain)
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
dim(subjecttest)

activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
dim(activitylabels)
activitylabels
features<-read.table("./UCI HAR Dataset/features.txt")
dim(features)
str(features)

# Place features as names
colnames(xtrain) <- features$V2
colnames(xtest) <- features$V2

# Put together train and test datasets
train <- cbind(subject_train, xtrain, ytrain)
colnames(train)[1] <- "Subject"
colnames(train)[563] <- "Activity"
dim(train)
test <- cbind(subject_test, xtest, ytest)
colnames(test)[1] <- "Subject"
colnames(test)[563] <- "Activity"
dim(test)

# Merge train and test datasets
completedata <- rbind(train, test)
dim(completedata)

# Extract the mean(), std() and subject data, and place labels in activity
mean <- completedata[, grep("mean()", colnames(completedata))]
sd <- completedata[, grep("std()", colnames(completedata))]
subject <- completedata[, 1]
labels <- factor(completedata$Activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# Merge the new dataset
newdataset <- cbind(subject, labels, mean, sd)
dim(newdataset)
colnames(newdataset)[1:2] <- c("Subject", "Activity")

# Arrange the new dataset by activity and subject
library(reshape2)
td <- melt(newdataset, id = c("Subject", "Activity"), na.rm = TRUE)
tidydataset <- dcast(td, formula = Activity + Subject ~ variable)
dim(tidydataset)

# Export as .txt
write.table(tidydataset, file = "tidy_dataset.txt", row.name=FALSE)






















