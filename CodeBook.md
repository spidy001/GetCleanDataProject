---
title: "CodeBook"
output: html_document
---

#Transformations done on the Raw data
Note : Data in the source location was never modified .
A local copy of data was made and all the further analyis were performed on the
local copy of raw data.

Files Used from the extracted zip folder
activity_labels.txt -lists all possible activities 
features.txt     - lists all the features measured through the phone
README.txt       - lists the over all details of data and how it flows through these files  
/test/subject_test.txt - lists the subjects who performed the test activities
X_test.txt             - actual measurement test data for each feature in features.txt        
/test/y_test.txt       - lists the corresponding activity performed while measuring the test data
/train/subject_train.txt - lists the subjects who performed the train activities
X_train.txt             - actual measurement train data for each feature in features.txt 
/train/y_train.txt     - lists the corresponding activity performed while measuring the train data

Based on the info above whats list in the above files, it was found that 
every row index in subject_test corresponds to same row index in y_test and 
same row index in X_test i.e all these files have same number of rows and they 
correspond to same row number in another file.

1. Read the test subject data from the subject_test.txt (1 column)
2. Read the test activity data from the y_test.txt (1 column)
3. Read the test measurement data from the X_test.txt (all 561 columns)
4. As the data from steps 1 through 3 relate to each other row by 
   row , cbind command was used to merge the test data.   (563 columns)
5. Read the train subject data from the subject_train.txt (1 column)
6. Read the train activity data from the y_train.txt   (1 column)
7. Read the train measurement data from the X_train.txt (all 561 columns)
8. As the data from steps 1 through 3 relate to each other row by 
   row , cbind command was used to merge the train data.   (563 columns)
9. Merged the test and train data from Step 4 by row wise using rbind command.
   (all the rows from step 4 and step 8 and 563 columns)
10. Made another copy of the merge data to do futher analysis (part1 output).
    incase we want the merged  output of test train and activity data we would 
    have at this point from step 9. merged copy of the data from step 10 is used 
    futher to apply any transformations/tidying.
11. Read the features data from features.txt
12. Renamed the features data columns with more descriptive names 
    featureId and featureName
13. Retrieved all the featureNames from the features data from step 11.
14. To avoid any issues with Caps locks converted all the featuresNames to lower
15. Removed extra characters such as ( ) , -  from the featureNames. 
16. Renamed all the column names of the merged data copy from step 10 with the 
    more descriptive names in the order below
    "subjectId","activityId,all column names output from step15. (563 columns)
17. from 563 columns of merged copy data , filtered columns only to include
    columns such as "subjectId",
    "activityId", all other columns matching the string "mean|std".
    Because for this analysis we are only interested in the measurement names 
    containing mean or std. matching logic was set to look for "mean" or "std" 
    any where in the column name , not necessarily in the begining , middle or 
    end. (88 columns)
     Columns used during the analysis (88 columns)
         [1] "subjectId"                         "activityId"                       
         [3] "tbodyaccmeanx"                     "tbodyaccmeany"                    
         [5] "tbodyaccmeanz"                     "tbodyaccstdx"                     
         [7] "tbodyaccstdy"                      "tbodyaccstdz"                     
         [9] "tgravityaccmeanx"                  "tgravityaccmeany"                 
        [11] "tgravityaccmeanz"                  "tgravityaccstdx"                  
        [13] "tgravityaccstdy"                   "tgravityaccstdz"                  
        [15] "tbodyaccjerkmeanx"                 "tbodyaccjerkmeany"                
        [17] "tbodyaccjerkmeanz"                 "tbodyaccjerkstdx"                 
        [19] "tbodyaccjerkstdy"                  "tbodyaccjerkstdz"                 
        [21] "tbodygyromeanx"                    "tbodygyromeany"                   
        [23] "tbodygyromeanz"                    "tbodygyrostdx"                    
        [25] "tbodygyrostdy"                     "tbodygyrostdz"                    
        [27] "tbodygyrojerkmeanx"                "tbodygyrojerkmeany"               
        [29] "tbodygyrojerkmeanz"                "tbodygyrojerkstdx"                
        [31] "tbodygyrojerkstdy"                 "tbodygyrojerkstdz"                
        [33] "tbodyaccmagmean"                   "tbodyaccmagstd"                   
        [35] "tgravityaccmagmean"                "tgravityaccmagstd"                
        [37] "tbodyaccjerkmagmean"               "tbodyaccjerkmagstd"               
        [39] "tbodygyromagmean"                  "tbodygyromagstd"                  
        [41] "tbodygyrojerkmagmean"              "tbodygyrojerkmagstd"              
        [43] "fbodyaccmeanx"                     "fbodyaccmeany"                    
        [45] "fbodyaccmeanz"                     "fbodyaccstdx"                     
        [47] "fbodyaccstdy"                      "fbodyaccstdz"                     
        [49] "fbodyaccmeanfreqx"                 "fbodyaccmeanfreqy"                
        [51] "fbodyaccmeanfreqz"                 "fbodyaccjerkmeanx"                
        [53] "fbodyaccjerkmeany"                 "fbodyaccjerkmeanz"                
        [55] "fbodyaccjerkstdx"                  "fbodyaccjerkstdy"                 
        [57] "fbodyaccjerkstdz"                  "fbodyaccjerkmeanfreqx"            
        [59] "fbodyaccjerkmeanfreqy"             "fbodyaccjerkmeanfreqz"            
        [61] "fbodygyromeanx"                    "fbodygyromeany"                   
        [63] "fbodygyromeanz"                    "fbodygyrostdx"                    
        [65] "fbodygyrostdy"                     "fbodygyrostdz"                    
        [67] "fbodygyromeanfreqx"                "fbodygyromeanfreqy"               
        [69] "fbodygyromeanfreqz"                "fbodyaccmagmean"                  
        [71] "fbodyaccmagstd"                    "fbodyaccmagmeanfreq"              
        [73] "fbodybodyaccjerkmagmean"           "fbodybodyaccjerkmagstd"           
        [75] "fbodybodyaccjerkmagmeanfreq"       "fbodybodygyromagmean"             
        [77] "fbodybodygyromagstd"               "fbodybodygyromagmeanfreq"         
        [79] "fbodybodygyrojerkmagmean"          "fbodybodygyrojerkmagstd"          
        [81] "fbodybodygyrojerkmagmeanfreq"      "angletbodyaccmeangravity"         
        [83] "angletbodyaccjerkmeangravitymean"  "angletbodygyromeangravitymean"    
        [85] "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                
        [87] "angleygravitymean"                 "anglezgravitymean" 
        
#ColumnType        

        For all 88 columns ( 2 columns - subjectId,activityId)
                           (86 columns containing name "mean" or "std")     
                           
        columnName      columnType
        
        subjectId       numeric
        activityId      numeric
        
#All the following columns are from measurement data and they were all numeric in the raw data
and also numeric in our local copy / analysis. 
        
        "tbodyaccmeanx"                     "tbodyaccmeany"                    
        "tbodyaccmeanz"                     "tbodyaccstdx"                     
        "tbodyaccstdy"                      "tbodyaccstdz"                     
        "tgravityaccmeanx"                  "tgravityaccmeany"                 
        "tgravityaccmeanz"                  "tgravityaccstdx"                  
        "tgravityaccstdy"                   "tgravityaccstdz"                  
        "tbodyaccjerkmeanx"                 "tbodyaccjerkmeany"                
        "tbodyaccjerkmeanz"                 "tbodyaccjerkstdx"                 
        "tbodyaccjerkstdy"                  "tbodyaccjerkstdz"                 
        "tbodygyromeanx"                    "tbodygyromeany"                   
        "tbodygyromeanz"                    "tbodygyrostdx"                    
        "tbodygyrostdy"                     "tbodygyrostdz"                    
        "tbodygyrojerkmeanx"                "tbodygyrojerkmeany"               
        "tbodygyrojerkmeanz"                "tbodygyrojerkstdx"                
        "tbodygyrojerkstdy"                 "tbodygyrojerkstdz"                
        "tbodyaccmagmean"                   "tbodyaccmagstd"                   
        "tgravityaccmagmean"                "tgravityaccmagstd"                
        "tbodyaccjerkmagmean"               "tbodyaccjerkmagstd"               
        "tbodygyromagmean"                  "tbodygyromagstd"                  
        "tbodygyrojerkmagmean"              "tbodygyrojerkmagstd"              
        "fbodyaccmeanx"                     "fbodyaccmeany"                    
        "fbodyaccmeanz"                     "fbodyaccstdx"                     
        "fbodyaccstdy"                      "fbodyaccstdz"                     
        "fbodyaccmeanfreqx"                 "fbodyaccmeanfreqy"                
        "fbodyaccmeanfreqz"                 "fbodyaccjerkmeanx"                
        "fbodyaccjerkmeany"                 "fbodyaccjerkmeanz"                
        "fbodyaccjerkstdx"                  "fbodyaccjerkstdy"                 
        "fbodyaccjerkstdz"                  "fbodyaccjerkmeanfreqx"            
        "fbodyaccjerkmeanfreqy"             "fbodyaccjerkmeanfreqz"            
        "fbodygyromeanx"                    "fbodygyromeany"                   
        "fbodygyromeanz"                    "fbodygyrostdx"                    
        "fbodygyrostdy"                     "fbodygyrostdz"                    
        "fbodygyromeanfreqx"                "fbodygyromeanfreqy"               
        "fbodygyromeanfreqz"                "fbodyaccmagmean"                  
        "fbodyaccmagstd"                    "fbodyaccmagmeanfreq"              
        "fbodybodyaccjerkmagmean"           "fbodybodyaccjerkmagstd"           
        "fbodybodyaccjerkmagmeanfreq"       "fbodybodygyromagmean"             
        "fbodybodygyromagstd"               "fbodybodygyromagmeanfreq"         
        "fbodybodygyrojerkmagmean"          "fbodybodygyrojerkmagstd"          
        "fbodybodygyrojerkmagmeanfreq"      "angletbodyaccmeangravity"         
        "angletbodyaccjerkmeangravitymean"  "angletbodygyromeangravitymean"    
        "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                
        "angleygravitymean"                 "anglezgravitymean" 
18. Read the activity labels  from the activity_labels.txt 
    i.e. RUNNING , WALKING etc   
19. merged the merged copy data with acitivity data from step 18
20. excluded columns such as activityId, as we are going to use activity Name 
21. Group the data by subjectId and activity name to find number of observations 
    per subjectId and activityName
    
    This is the final tidy data with 180 observations for 88 columns 
    (descriptive column names and activityName column instead activityId)
            
           [1] "subjectId"                         "activityName"                     
         [3] "tbodyaccmeanx"                     "tbodyaccmeany"                    
         [5] "tbodyaccmeanz"                     "tbodyaccstdx"                     
         [7] "tbodyaccstdy"                      "tbodyaccstdz"                     
         [9] "tgravityaccmeanx"                  "tgravityaccmeany"                 
        [11] "tgravityaccmeanz"                  "tgravityaccstdx"                  
        [13] "tgravityaccstdy"                   "tgravityaccstdz"                  
        [15] "tbodyaccjerkmeanx"                 "tbodyaccjerkmeany"                
        [17] "tbodyaccjerkmeanz"                 "tbodyaccjerkstdx"                 
        [19] "tbodyaccjerkstdy"                  "tbodyaccjerkstdz"                 
        [21] "tbodygyromeanx"                    "tbodygyromeany"                   
        [23] "tbodygyromeanz"                    "tbodygyrostdx"                    
        [25] "tbodygyrostdy"                     "tbodygyrostdz"                    
        [27] "tbodygyrojerkmeanx"                "tbodygyrojerkmeany"               
        [29] "tbodygyrojerkmeanz"                "tbodygyrojerkstdx"                
        [31] "tbodygyrojerkstdy"                 "tbodygyrojerkstdz"                
        [33] "tbodyaccmagmean"                   "tbodyaccmagstd"                   
        [35] "tgravityaccmagmean"                "tgravityaccmagstd"                
        [37] "tbodyaccjerkmagmean"               "tbodyaccjerkmagstd"               
        [39] "tbodygyromagmean"                  "tbodygyromagstd"                  
        [41] "tbodygyrojerkmagmean"              "tbodygyrojerkmagstd"              
        [43] "fbodyaccmeanx"                     "fbodyaccmeany"                    
        [45] "fbodyaccmeanz"                     "fbodyaccstdx"                     
        [47] "fbodyaccstdy"                      "fbodyaccstdz"                     
        [49] "fbodyaccmeanfreqx"                 "fbodyaccmeanfreqy"                
        [51] "fbodyaccmeanfreqz"                 "fbodyaccjerkmeanx"                
        [53] "fbodyaccjerkmeany"                 "fbodyaccjerkmeanz"                
        [55] "fbodyaccjerkstdx"                  "fbodyaccjerkstdy"                 
        [57] "fbodyaccjerkstdz"                  "fbodyaccjerkmeanfreqx"            
        [59] "fbodyaccjerkmeanfreqy"             "fbodyaccjerkmeanfreqz"            
        [61] "fbodygyromeanx"                    "fbodygyromeany"                   
        [63] "fbodygyromeanz"                    "fbodygyrostdx"                    
        [65] "fbodygyrostdy"                     "fbodygyrostdz"                    
        [67] "fbodygyromeanfreqx"                "fbodygyromeanfreqy"               
        [69] "fbodygyromeanfreqz"                "fbodyaccmagmean"                  
        [71] "fbodyaccmagstd"                    "fbodyaccmagmeanfreq"              
        [73] "fbodybodyaccjerkmagmean"           "fbodybodyaccjerkmagstd"           
        [75] "fbodybodyaccjerkmagmeanfreq"       "fbodybodygyromagmean"             
        [77] "fbodybodygyromagstd"               "fbodybodygyromagmeanfreq"         
        [79] "fbodybodygyrojerkmagmean"          "fbodybodygyrojerkmagstd"          
        [81] "fbodybodygyrojerkmagmeanfreq"      "angletbodyaccmeangravity"         
        [83] "angletbodyaccjerkmeangravitymean"  "angletbodygyromeangravitymean"    
        [85] "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                
        [87] "angleygravitymean"                 "anglezgravitymean" 

   
