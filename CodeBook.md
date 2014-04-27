# CodeBook.md

This document details the variables produced by **run_analysis.R** and provides an outline for how these variables were created. Results are also written to CSV files in the working directory.

## Variables

The two variables created after running the script are **tidy\_data\_1** and **tidy\_data\_2**. 

* **tidy\_data\_1** represents the merge of the training and testing datasets. In total there are 10,299 records. 
* **tidy\_data\_2** groups the results of **tidy\_data\_1** by Subject and Activity, then calculates an average within each group. Because there are 30 subjects engaging in 6 distinct activities, there are 180 records.

### Columns (identical for both variables)

 [1] "Subject"                    
 [2] "Activity"                   
 [3] "tBodyAcc-mean()-X"          
 [4] "tBodyAcc-mean()-Y"          
 [5] "tBodyAcc-mean()-Z"          
 [6] "tBodyAcc-std()-X"           
 [7] "tBodyAcc-std()-Y"           
 [8] "tBodyAcc-std()-Z"           
 [9] "tGravityAcc-mean()-X"       
[10] "tGravityAcc-mean()-Y"       
[11] "tGravityAcc-mean()-Z"       
[12] "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"        
[14] "tGravityAcc-std()-Z"        
[15] "tBodyAccJerk-mean()-X"      
[16] "tBodyAccJerk-mean()-Y"      
[17] "tBodyAccJerk-mean()-Z"      
[18] "tBodyAccJerk-std()-X"       
[19] "tBodyAccJerk-std()-Y"       
[20] "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"         
[22] "tBodyGyro-mean()-Y"         
[23] "tBodyGyro-mean()-Z"         
[24] "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"          
[26] "tBodyGyro-std()-Z"          
[27] "tBodyGyroJerk-mean()-X"     
[28] "tBodyGyroJerk-mean()-Y"     
[29] "tBodyGyroJerk-mean()-Z"     
[30] "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"      
[32] "tBodyGyroJerk-std()-Z"      
[33] "tBodyAccMag-mean()"         
[34] "tBodyAccMag-std()"          
[35] "tGravityAccMag-mean()"      
[36] "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"     
[38] "tBodyAccJerkMag-std()"      
[39] "tBodyGyroMag-mean()"        
[40] "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"    
[42] "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"          
[44] "fBodyAcc-mean()-Y"          
[45] "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"           
[47] "fBodyAcc-std()-Y"           
[48] "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"      
[50] "fBodyAccJerk-mean()-Y"      
[51] "fBodyAccJerk-mean()-Z"      
[52] "fBodyAccJerk-std()-X"       
[53] "fBodyAccJerk-std()-Y"       
[54] "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"         
[56] "fBodyGyro-mean()-Y"         
[57] "fBodyGyro-mean()-Z"         
[58] "fBodyGyro-std()-X"          
[59] "fBodyGyro-std()-Y"          
[60] "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"         
[62] "fBodyAccMag-std()"          
[63] "fBodyBodyAccJerkMag-mean()"  
[64] "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-mean()"    
[66] "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()"  
[68] "fBodyBodyGyroJerkMag-std()"

## Data

From the [provided dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) the following files were used directly:

* **test\subject\_test.txt and train\subject\_train.txt**  
   Merged to provide first column in final variables

* **test\y\_test.txt and train\y\_train.txt**  
   Merged to provide second column in final variables  
   Numbers were replaced with text based on **activity_labels.txt**

* **test\X\_test.txt and train\X\_train.txt**  
    Merged to provide remaining columns in final variables  
    Columns were filtered based on names provided in **features.txt**


## Steps

1. Be in correct working directory (directory containing **UCI HAR Dataset** folder).
2. Read in required files (see above).
3. Use information from **features.txt** to populate column headers of X\_test and X\_train data.  
   Also add "Subject" and "Activity" headers to subject and y data, respectively.
4. Combine columns for training and testing data (separately). Resulting datasets will have:  
   **COLUMN 1:** Subject IDs  
   **COLUMN 2:** Activity codes (numbers 1-6)  
   **REMAINING COLUMNS:** All 561 columns present in X data
5. Isolate columns with names containing "mean()" or "std()".
6. Replace codes in Activity column with text descriptions (based on **activity\_labels.txt**).
7. The result is **tidy\_data\_1**.
8. Using **tidy\_data\_1**, group on Subject and Activity columns. Apply a mean function for aggregation.
9. The result is **tidy\_data\_2**.
10. Write results to **"tidy\_data\_1.csv"** and **"tidy\_data\_2.csv"**
11. Cleanup of variables other than **tidy\_data\_1** and **tidy\_data\_2**