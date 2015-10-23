setwd("C:/Users/Smrutijz/Desktop/Getting Data/DATA")
#Reproducible Code
#############################################################################

#Create a new directory (if not exist already)
if(!dir.exists("Project Data")){dir.create("Project Data")}

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download zip file
download.file(fileurl,destfile = "./Project Data/UCI HAR Dataset.zip")

#Unzip the file in the earlier created directory
unzip("./Project Data/UCI HAR Dataset.zip",exdir="./Project Data")

##Reading Data
#############################################################################

#Reading Header & Label File
HeaderFile<-read.table("./Project Data/UCI HAR Dataset/features.txt",sep="",header=FALSE)
LabelFile<-read.table("./Project Data/UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)

#Reading Training Data
X_train<-read.table("./Project Data/UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE)

y_train<-read.table("./Project Data/UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)

subject_train<-read.table("./Project Data/UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE,colClasses="factor")

TrainData<-cbind(subject_train,y_train,X_train)

#Reading Test Data
X_test<-read.table("./Project Data/UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE)

y_test<-read.table("./Project Data/UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE)

subject_test<-read.table("./Project Data/UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE,colClasses="factor")

TestData<-cbind(subject_test,y_test,X_test)

#Step1(Merges the training and the test sets to create one data set)
#############################################################################

CompleteData<-rbind(TrainData,TestData)

#Step2(Extracts only the measurements on the mean and standard deviation for each measurement.)
#############################################################################

ColIndex<-sort(c(grep(pattern="mean()",HeaderFile[,2])
,grep(pattern="meanFreq()",HeaderFile[,2])
,grep(pattern="std()",HeaderFile[,2])))

ColIndex<-ColIndex+2
ColIndex<-c(1,2,ColIndex)

CompleteData<-CompleteData[,ColIndex]

#step3(Uses descriptive activity names to name the activities in the data set)
#############################################################################

CompleteData[,2]<-factor(CompleteData[,2], levels=LabelFile[,1], labels=LabelFile[,2])

#Step4(Appropriately labels the data set with descriptive variable names. )
#############################################################################

ColName<-as.character(HeaderFile[(sort(c(grep(pattern="mean()",HeaderFile[,2])
                 ,grep(pattern="meanFreq()",HeaderFile[,2])
                 ,grep(pattern="std()",HeaderFile[,2])))),2])

ColName<-c("SubjectID","Activity",ColName)

names(CompleteData)<-ColName

#Step5(From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.)
#############################################################################

#"reshape2" package, if exist then load or else installed & load automatically

if("reshape2" %in% rownames(installed.packages())==TRUE)
{
  library(reshape2)
}else
{
  install.packages("reshape2")
  library(reshape2)  
}

#melt data by "SubjectID","Activity"
CompleteData_Melt<-melt(CompleteData,id=c("SubjectID","Activity"))
#decast
CompleteData_Mean <- dcast(CompleteData_Melt, SubjectID + Activity ~ variable, mean)

#Create Tidy Data
write.table(CompleteData_Mean, "./Project Data/Tidy_Data.txt", row.names = FALSE, quote = FALSE)
