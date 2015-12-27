setwd("E:\\DataScience\\GettingData")

#Download the data from website and unzip at the destination


if(!file.exists("./input")){dir.create("./input")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./input/InputData.zip")

unzip(zipfile="./input/InputData.zip",exdir="./input")

path_input <- file.path("./input" , "UCI HAR Dataset")


Merges the training and the test sets to create one data set

inputActTest  <- read.table(file.path(path_input, "test" , "Y_test.txt" ),header = FALSE)
inputActTrain <- read.table(file.path(path_input, "train", "Y_train.txt"),header = FALSE)

inputSubTrain <- read.table(file.path(path_input, "train", "Subject_train.txt"),header = FALSE)
inputSubTest  <- read.table(file.path(path_input, "test" , "Subject_test.txt"),header = FALSE)

inputFTest  <- read.table(file.path(path_input, "test" , "X_test.txt" ),header = FALSE)
inputFTrain <- read.table(file.path(path_input, "train", "X_train.txt"),header = FALSE)

ActivityL <- read.table(file.path(path_input, "Activity_labels.txt"),header = FALSE)
inputActTest$V1 <- factor(inputActTest$V1,levels=ActivityL$V1,labels=ActivityL$V2)
inputActTrain$V1 <- factor(inputActTrain$V1,levels=ActivityL$V1,labels=ActivityL$V2)


inputSub <- rbind(inputSubTrain, inputSubTest)
inputAct<- rbind(inputActTrain, inputActTest)
inputF<- rbind(inputFTrain, inputFTest)

names(inputSub)<-c("Subject")
names(inputAct)<- c("Activity")
inputFNames <- read.table(file.path(path_input, "features.txt"),head=FALSE)
names(inputF)<- inputFNames$V2

inputC <- cbind(inputSub, inputAct)
ProcData <- cbind(inputF, inputC)

# Extracts only the measurements on the mean and standard deviation for each measurement. 

subinputFNames<-inputFNames$V2[grep("mean\\(\\)|std\\(\\)", inputFNames$V2)]
sNames<-c(as.character(subinputFNames), "Subject", "Activity" )
ProcData<-subset(ProcData,select=sNames)


names(ProcData)<-gsub("^t", "Time", names(ProcData))
names(ProcData)<-gsub("^f", "Frequency", names(ProcData))
names(ProcData)<-gsub("Acc", "Accelerometer", names(ProcData))
names(ProcData)<-gsub("Gyro", "Gyroscope", names(ProcData))
names(ProcData)<-gsub("Mag", "Magnitude", names(ProcData))
names(ProcData)<-gsub("BodyBody", "Body", names(ProcData))

library(plyr);
FinalData<-aggregate(. ~Subject + Activity, ProcData, mean)
FinalData<-FinalData[order(FinalData$Subject,FinalData$Activity),]
write.table(FinalData, file = "outputdata.txt",row.name=FALSE)


