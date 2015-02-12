# run_analysis.R
# Author: Jack Thompson
# Date: 2/12/2015

if("data.table" %in% rownames(installed.packages()) == FALSE)
  install.packages("data.table")
require(data.table)
# read column names
columnNames<-read.table("UCI HAR Dataset//features.txt", header=FALSE)
# combine test and training data
data<-rbind(read.table("UCI HAR Dataset//test//X_test.txt", header=FALSE), read.table("UCI HAR Dataset//train//X_train.txt", header=FALSE))
# label the data set with descriptive variable names
names(data)<-gsub("-", "_", columnNames[[2]])
# extract only the measurements on the mean and standard deviation for each measurement
data<-data[union(grep('mean\\(\\)+', columnNames[[2]], ignore.case=TRUE), grep("std\\(\\)", columnNames[[2]], ignore.case=TRUE))]
# fix variable names - R doesn't play well with ()
names(data)<-gsub("\\(", "", gsub("\\)", "", names(data)))
# read subject test and training data
subjects<-data.frame(apply(rbind(read.table("UCI HAR Dataset//test//subject_test.txt", header=FALSE), read.table("UCI HAR Dataset//train//subject_train.txt", header=FALSE)),2,as.numeric))
# read labels for test and training data
labels<-rbind(read.table("UCI HAR Dataset//test//y_test.txt", header=FALSE), read.table("UCI HAR Dataset//train//y_train.txt", header=FALSE))
# read activity names
activities<-data.frame(read.table("UCI HAR Dataset//activity_labels.txt", header=FALSE))
names(activities)[1]<-"Activity"
# combine all data into one data frame
data<-cbind(subjects,labels,data)
# clean up
rm(subjects)
rm(labels)
rm(columnNames)
# fix column names
names(data)[1]<-"Subject"
names(data)[2]<-"Activity"
# convert to data.table for processing
mydt<-data.table(data)
# choose columns to be summarized
cols<-names(mydt[, 3:68, with=F])
# calculate means per column
mydt<-mydt[, lapply(.SD, mean), by="Subject,Activity", .SDcols=cols]
# merge (join) on column "Activity"
mydt<-data.table(merge(mydt, activities, by="Activity"))
# clean up
rm(activities)
# order by Subject, Activity
setorder(mydt, Subject, Activity)
# reorder columns
mydt<-mydt[, c(2,69,3:68), with=FALSE]
# fix column name after merge
setnames(mydt, "V2", "Activity")
# write output file
write.table(mydt, file="tidydata.txt", row.names=FALSE)
