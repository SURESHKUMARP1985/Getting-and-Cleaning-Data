{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang16393{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil\fcharset0 Calibri;}{\f2\fnil\fcharset2 Symbol;}}
{\*\generator Riched20 6.3.9600}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\b\f0\fs28\lang9 Getting and Cleaning Data\par
\b0\f1\fs22 The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.\par
\b Required Steps\b0\par

\pard{\pntext\f2\'B7\tab}{\*\pn\pnlvlblt\pnf2\pnindent0{\pntxtb\'B7}}\fi-360\li720\sl240\slmult1 Merges the training and the test sets to create one data set.\par
{\pntext\f2\'B7\tab}Extracts only the measurements on the mean and standard deviation for each measurement. \par
{\pntext\f2\'B7\tab}Uses descriptive activity names to name the activities in the data set\par
{\pntext\f2\'B7\tab}Appropriately labels the data set with descriptive variable names. \par
{\pntext\f2\'B7\tab}From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.\par

\pard\sa200\sl276\slmult1\par
\b Steps in code for analysis.\par

\pard{\pntext\f2\'B7\tab}{\*\pn\pnlvlblt\pnf2\pnindent0{\pntxtb\'B7}}\fi-360\li720\sl276\slmult1\b0 Downloading and unzipping appropriate files was performed.\par
{\pntext\f2\'B7\tab}read.table is used as the files were in .txt format.\par
{\pntext\f2\'B7\tab}One data frame was produced using function rbind,cbind.\par
{\pntext\f2\'B7\tab}grep searching pattern mean,std.\par
{\pntext\f2\'B7\tab}Tidy data  created with the average of each variable for each activity and each subject based on the data.\par
{\pntext\f2\'B7\tab}Data written to file using write.table\par
}
 