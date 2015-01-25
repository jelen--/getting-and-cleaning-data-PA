# Codebook

## Data

Original data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The database contains recordings of a group of 30 volunteers performing six activities of daily living while wearing a smartphone(Samsung Galaxy S II) with embedded inertial sensors on their waist.

## Data analysis

1. The zip document mentioned in the README file was extracted and the .txt files read using read.table() function.
2. Since the x_files corresponded to the features and the y_files to the activities, the features were assigned as names for the x_files.
3. Train and Test subjects, features and activities were placed together in a new data frame named "completedata".
4. Then, mean(), std(), subjects and labels were extracted and put in a new data frame (newdataset).
5. The new dataset was arranged by activity and subject using the melt (reshape2 package) and dcast function.
6. Finally, the tidy dataset with the average of each column for each subject/activity was saved as .txt following the instructions of the assignment (write.table() function with row.name attribute as FALSE).

