# What is it 
GetCleanDataProject

A project done during a Johns Hopkins Data Science Specialization on coursera.
The whole goal of the project was to get some data from the listed location , 
analyze & clean the data where ever necessary and finally present the 
transformations done on the raw data and submit the tidy data

#Author of this Project/Anaylysis 

Project Implementation and analysis done by me - spidy001
Project info provided by Johns Hopkins Insturctors through Coursera.

#The raw data
The raw data thats used in this data analysis project was mentioned by 
Johnks Hopkins instructors during Data Science Course on Coursera.

This data contains human activity  measurements taken using the 
Samsung Galaxy S smartphone

As per the instructions listed in the course material the data was obtained from 
the following url location
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full detailed description of the data can be obtained from the location
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The exact R code that was used to download and extract this data is as follows.

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,method = "curl",destfile = "GCD_Project_UCI_HARDataset.zip")
unzip("GCD_Project_UCI_HARDataset.zip",exdir = "GCD_Project")

This data was extracted to a local folder with name GCD_Project_UCI_HARDataset.zip

Download date & time - 04/25/2015 11.17 AM Central Time U.S.A

No file or data was modified in actual raw dataset. 

#Software/tools used to analyze the data and share the analysis results

R, RStudio, github

R Packages Used - dplyr

#The tidy data set Rules followed to make the data tidy or pretty
(Provided by the Johns Hopkins Instructors through Coursera Website)

Each variable you measure should be in one column
Each different observation of that variable should be in a different row
There should be one table for each "kind" of variable
If you have multiple tables, they should include a column in the table that allows them to be linked

#Other Related Files listed in the course repository

CodeBook.Rmd or CodeBook.md  or CodeBook.html -
for more data transformation details from the code.

run_analasis.R - 
for the exact code used to perform the steps listed in the CodeBook.md

GCD_Project_UCI_HARDataset.zip        
downloaded zip file containing the raw data.



