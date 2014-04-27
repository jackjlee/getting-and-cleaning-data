# getting-and-cleaning-data

This is a project for "Getting and Cleaning Data" (Coursera). The goal of this project is to merge training and testing datasets obtained to identify [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The respository contains:  

* **README.md**  
* **run\_analysis.R:** one R script that produces two tidy datasets. The first reduces a 561-column dataset to columns containing mean and standard deviation. Columns containing subject and activity information were also added. The second dataset groups the first based on subject and activity (aggregation is performed by calculating averages).
* **CodeBook.md:** a description of output variables/files and an outline of how the script works. 