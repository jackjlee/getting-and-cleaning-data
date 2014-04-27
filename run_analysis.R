## Start by setting working directory to folder with files
## e.g. setwd("/Users/username/Documents/Coursera_GettingAndCleaningData")

## -----------------------------------------------------------------------------
## Read in data files

test_x <- read.table(file="UCI Har Dataset/test/X_test.txt")
test_y <- read.table(file="UCI Har Dataset/test/y_test.txt")
test_subject <- read.table(file="UCI Har Dataset/test/subject_test.txt")

train_x <- read.table(file="UCI Har Dataset/train/X_train.txt")
train_y <- read.table(file="UCI Har Dataset/train/y_train.txt")
train_subject <- read.table(file="UCI Har Dataset/train/subject_train.txt")

# column names (2nd column)
column_nms <- read.table(file="UCI Har Dataset/features.txt")

## -----------------------------------------------------------------------------
## Assign headers

colnames(test_x) <- column_nms[,2]
colnames(train_x) <- column_nms[,2]

colnames(test_y) <- "Activity"
colnames(train_y) <- "Activity"

colnames(test_subject) <- "Subject"
colnames(train_subject) <- "Subject"

## -----------------------------------------------------------------------------
## Combine columns

test_temp <- cbind(test_y,test_x)
test_data <- cbind(test_subject,test_temp)

train_temp <- cbind(train_y,train_x)
train_data <- cbind(train_subject,train_temp)

## -----------------------------------------------------------------------------
## Merge data files

merge_data <- rbind(test_data,train_data)

## -----------------------------------------------------------------------------
## Extract columns we want to keep

# Find columns with names containing "mean()" or "std()"
mean_cols <- grepl("mean()",names(merge_data),fixed=TRUE)
std_cols <- grepl("std()",names(merge_data),fixed=TRUE)

# Keep Subject and Activity columns (1st and 2nd, respectively)
keep_cols <- rep(FALSE,563)
keep_cols[1] = TRUE
keep_cols[2] = TRUE

tidy_data_1 <- merge_data[,mean_cols|std_cols|keep_cols]

## -----------------------------------------------------------------------------
## Substitute Activity names

tidy_data_1$Activity <- gsub("1","Walking",
                        gsub("2","Walking_Upstairs",
                        gsub("3","Walking_Downstairs",
                        gsub("4","Sitting",
                        gsub("5","Standing",
                        gsub("6","Laying",
                                tidy_data_1$Activity ))))))

## -----------------------------------------------------------------------------
## Calculate averages, grouping by subjects and activities

tidy_data_2 <- aggregate(. ~ Subject + Activity,
                         data = tidy_data_1,
                         FUN = mean)

## -----------------------------------------------------------------------------
## Output as files

write.csv(tidy_data_1,file="tidy_data_1.csv")
write.csv(tidy_data_2,file="tidy_data_2.csv")

## -----------------------------------------------------------------------------
## Cleanup

rm(test_x,test_y,test_subject,
   train_x,train_y,train_subject,
   column_nms,test_temp,test_data,
   train_temp,train_data,merge_data,
   keep_cols,mean_cols,std_cols)