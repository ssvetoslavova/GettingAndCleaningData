## Running in R 3.2.0

library("reshape2")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
features <- features[2]
features <- as.vector(features[,1])
a_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = c("numeric"), col.names = features)
b_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
a_test <- a_test[c(201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 503, 504, 516, 517, 529, 530, 542, 543)]
a_test[,"activity"] <- b_test
a_test$activity <- as.factor(a_test$activity)
a_test[, "subject"] <- subject_test
a_test$subject <- as.factor(a_test$subject)
a_test$activity_labels <- a_test$activity
a_test$activity_labels <- factor(a_test$activity_labels, levels = c(1,2,3,4,5,6),
                                 labels = c("WALKING","WALKING_UPSTAIRS",
                                            "WALKING_DOWNSTAIRS","SITTING",
                                            "STANDING","LAYING"))
a_train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses = c("numeric"), col.names = features)
b_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
a_train <- a_train[c(201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 503, 504, 516, 517, 529, 530, 542, 543)]
a_train[,"activity"] <- b_train
a_train$activity <- as.factor(a_train$activity)
a_train[, "subject"] <- subject_train
a_train$subject <- as.factor(a_train$subject)
a_train$activity_labels <- a_train$activity
a_train$activity_labels <- factor(a_train$activity_labels, levels = c(1,2,3,4,5,6),
                                 labels = c("WALKING","WALKING_UPSTAIRS",
                                            "WALKING_DOWNSTAIRS","SITTING",
                                            "STANDING","LAYING"))
all_data <- rbind(a_test, a_train)
rm(subject_test)
rm(a_test)
rm(b_test)
rm(subject_train)
rm(a_train)
rm(b_train)
rm(features)
agg_all <- aggregate(all_data, by= list(all_data$activity_labels, all_data$subject), FUN = mean, na.rm = FALSE)
write.table(agg_all, file="tidy_data_final.txt", col.names=TRUE)
