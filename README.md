##GETTING AND CLEANING DATA PROJECT

###INSTRUCTIONS
1. Put the data in your working directory (available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
2. Execute run_analysis.R
3. Output file is called tidydata.txt

###DATA INFORMATION (CODE BOOK)
A Samsung Galaxy S II was worn by volunteers on the waist. 3-axis linear acceleration and 3-axis angular velocity were captured at a constant rate of 50 Hz. These were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc\_XYZ and tGravityAcc\_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk\_XYZ and tBodyGyroJerk\_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc\_XYZ, fBodyAccJerk\_XYZ, fBodyGyro\_XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the prefix; 't' denotes time domain and 'f' denotes frequency domain signals).

These variables were then sampled in fixed-width sliding windows of duration 2.56 sec and with 50% overlap (128 readings/window). Features were normalized and bounded within [-1,1]. Labels were manually generated based on video recordings.

After data reduction, only the mean (\_mean) and standard deviation (\_std) for each sample period were retained. The means of these are calculated and presented, grouped by subject and activity, by the run_analysis.R script.

More information about the data set can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
