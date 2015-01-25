run_analysis <- function() {
   ## 
   ## run_analysis:
   ##    This function assumes the location of the data files
   ## are in a subdirectory of where the function is located.
   ##
   ##  Writen by Kendall Southwick
   
   merged_data <- read.table("UCI HAR Dataset/test/X_test.txt")
   train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
   merged_data_header <- read.table("UCI HAR Dataset/features.txt")
   activities_str <- read.table("UCI HAR Dataset/activity_labels.txt")
   activity <- read.table("UCI HAR Dataset/test/y_test.txt")
   subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
   len <- nrow(merged_data_header)
   for(i in 1:len) {
      header <- as.character(merged_data_header[i,c("V2")])
      names(merged_data)[i] <- header
   }   
   merged_data["test_type"] <- "test"
   merged_data["activity"] <- activity
   merged_data["subject"] <- subjects
   for(i in 1:len) {
      header <- as.character(merged_data_header[i,c("V2")])
      names(train_data)[i] <- header
   }   
   train_data["test_type"] <- "train"
   activity <- read.table("UCI HAR Dataset/train/y_train.txt")
   subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
   train_data["activity"] <- activity
   train_data["subject"] <- subjects
   
   merged_data <-rbind(merged_data, train_data)
   len <- nrow(merged_data)
   for(i in 1:len) {
      merged_data[i,"activity"] <- 
            as.character(activities_str[merged_data[i,"activity"],"V2"])
   } 
   write.table(merged_data, file="merged_data.txt", append=FALSE ,sep=" ",
               col.names=TRUE)

   mean_list <- grep(pattern="mean\\(", merged_data_header[,2], value=TRUE)
   std_list <- grep(pattern="std\\(", merged_data_header[,2], value=TRUE)
   ms_list <- c(mean_list, std_list)

   extract_data <- merged_data[,c("activity","subject", mean_list, std_list)]
   write.table(extract_data, file="extract_data.txt", append=FALSE ,sep=" ",
               col.names=TRUE)
   tidy_data <- aggregate(extract_data[,ms_list],
         by = list(extract_data[,"subject"], extract_data[,"activity"]), mean)
   names(tidy_data)[1] <- "subject"
   names(tidy_data)[2] <- "activity"
   write.table(tidy_data, file="tidy_data.txt", append=FALSE ,sep=" ",
               row.names=FALSE, col.names=TRUE)
   tidy_data
}