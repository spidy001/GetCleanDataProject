#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,method = "curl",destfile = "GCD_Project_UCI_HARDataset.zip")
#unzip("GCD_Project_UCI_HARDataset.zip",exdir = "GCD_Project")

#part 1
#testSet
testSubjectData <- read.table("GCD_Project/UCI HAR Dataset/test/subject_test.txt")
testActivityData <- read.table("GCD_Project/UCI HAR Dataset/test/y_test.txt")
testMeasurementData <- read.table("GCD_Project/UCI HAR Dataset/test/X_test.txt")
mergedTestData<-cbind(testSubjectData,testActivityData,testMeasurementData)
#trainSet
trainSubjectData <- read.table("GCD_Project/UCI HAR Dataset/train/subject_train.txt")
trainActivityData <- read.table("GCD_Project/UCI HAR Dataset/train/y_train.txt")
trainMeasurementData <- read.table("GCD_Project/UCI HAR Dataset/train/X_train.txt")
mergedTrainData<-cbind(trainSubjectData,trainActivityData,trainMeasurementData)
#mergedTestTrain Data
mergedData<- rbind(mergedTestData,mergedTrainData)

#part4
features <- read.table("GCD_Project/UCI HAR Dataset/features.txt")
colnames(features)<-c("featureId","featureName")
featureNames <- features$featureName
tidyFeatureNames<- tolower(featureNames)
tidyFeatureNames<-gsub("\\(|\\)|\\,|\\-","",tidyFeatureNames)
mergedDataCopy <- mergedData
colnames(mergedDataCopy) <- c("subjectId","activityId",tidyFeatureNames)
#part2
interestedColumns <- c("subjectId","activityId")
interestedColumns <- c(interestedColumns,grep('mean|std', colnames(mergedDataCopy),value = TRUE))
interestedData<-mergedDataCopy[,interestedColumns]
#part3
activities <- read.table("GCD_Project/UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("activityId","activityName")
finalInterestedData<-merge(interestedData,activities,by.x="activityId",by.y = "activityId")
totCol<-ncol(finalInterestedData)
#subsetting and excluding the columns not needed such as activityId
finalInterestedData<- finalInterestedData[c(2,totCol,3:(totCol-1))]
#part5
tidyData<-finalInterestedData %>% group_by(subjectId,activityName) %>% summarise_each(funs(mean))
#default output -  part1 
mergedData