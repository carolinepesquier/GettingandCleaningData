## Code Book

This file presents a description for each variable shown in the output file (please see README.md for data background, output file and R script explanation).

As described in the raw dataset (see README.md for link):
*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.* 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.* 

Variable | Description
---------|------------
"Subject ID" | num., unique ID for each subject, between 1:30
"Activity" | char., physical activity description. 6 activities possible: Laying, Sitting,, Standing, Walking, Walking Downstairs, Walking Upstairs
"Time Body Accelerometer Mean()-X" | num., between -1:1
"Time Body Accelerometer Mean()-Y" | num., between -1:1
"Time Body Accelerometer Mean()-Z" | num., between -1:1
"Time GravityAccelerometer Mean()-X" | num., between -1:1
"Time GravityAccelerometer Mean()-Y" | num., between -1:1
"Time GravityAccelerometer Mean()-Z" | num., between -1:1
"Time Body Accelerometer JerkSignal Mean()-X" | num., between -1:1
"Time Body Accelerometer JerkSignal Mean()-Y" | num., between -1:1 num., between -1:1
"Time Body Accelerometer JerkSignal Mean()-Z" | num., between -1:1
"Time Body Gyroscope Mean()-X" | num., between -1:1
"Time Body Gyroscope Mean()-Y" | num., between -1:1
"Time Body Gyroscope Mean()-Z" | num., between -1:1
"Time Body Gyroscope JerkSignal Mean()-X" | num., between -1:1
"Time Body Gyroscope JerkSignal Mean()-Y" | num., between -1:1
"Time Body Gyroscope JerkSignal Mean()-Z" | num., between -1:1
"Time Body Accelerometer Magnitude Mean()" | num., between -1:1
"Time GravityAccelerometer Magnitude Mean()" | num., between -1:1
"Time Body Accelerometer JerkSignal Magnitude Mean()" | num., between -1:1
"Time Body Gyroscope Magnitude Mean()" | num., between -1:1
"Time Body Gyroscope JerkSignal Magnitude Mean()" | num., between -1:1
"Frequency Body Accelerometer Mean()-X" | num., between -1:1
"Frequency Body Accelerometer Mean()-Y" | num., between -1:1
"Frequency Body Accelerometer Mean()-Z" | num., between -1:1
"Frequency Body Accelerometer JerkSignal Mean()-X" | num., between -1:1
"Frequency Body Accelerometer JerkSignal Mean()-Y" | num., between -1:1
"Frequency Body Accelerometer JerkSignal Mean()-Z" | num., between -1:1
"Frequency Body Gyroscope Mean()-X" | num., between -1:1
"Frequency Body Gyroscope Mean()-Y" | num., between -1:1
"Frequency Body Gyroscope Mean()-Z" | num., between -1:1
"Frequency Body Accelerometer Magnitude Mean()" | num., between -1:1
"Frequency Body  Accelerometer JerkSignal Magnitude Mean()" | num., between -1:1
"Frequency Body  Gyroscope Magnitude Mean()" | num., between -1:1
"Frequency Body  Gyroscope JerkSignal Magnitude Mean()" | num., between -1:1
"Time Body Accelerometer StandardDeviation()-X" | num., between -1:1
"Time Body Accelerometer StandardDeviation()-Y" | num., between -1:1
"Time Body Accelerometer StandardDeviation()-Z" | num., between -1:1
"Time GravityAccelerometer StandardDeviation()-X" | num., between -1:1
"Time GravityAccelerometer StandardDeviation()-Y" | num., between -1:1
"Time GravityAccelerometer StandardDeviation()-Z" | num., between -1:1
"Time Body Accelerometer JerkSignal StandardDeviation()-X" | num., between -1:1
"Time Body Accelerometer JerkSignal StandardDeviation()-Y" | num., between -1:1
"Time Body Accelerometer JerkSignal StandardDeviation()-Z" | num., between -1:1
"Time Body Gyroscope StandardDeviation()-X" | num., between -1:1
"Time Body Gyroscope StandardDeviation()-Y" | num., between -1:1
"Time Body Gyroscope StandardDeviation()-Z" | num., between -1:1
"Time Body Gyroscope JerkSignal StandardDeviation()-X" | num., between -1:1
"Time Body Gyroscope JerkSignal StandardDeviation()-Y" | num., between -1:1
"Time Body Gyroscope JerkSignal StandardDeviation()-Z" | num., between -1:1
"Time Body Accelerometer Magnitude StandardDeviation()" | num., between -1:1
"Time GravityAccelerometer Magnitude StandardDeviation()" | num., between -1:1
"Time Body Accelerometer JerkSignal Magnitude StandardDeviation()" | num., between -1:1
"Time Body Gyroscope Magnitude StandardDeviation()" | num., between -1:1
"Time Body Gyroscope JerkSignal Magnitude StandardDeviation()" | num., between -1:1
"Frequency Body Accelerometer StandardDeviation()-X" | num., between -1:1
"Frequency Body Accelerometer StandardDeviation()-Y" | num., between -1:1
"Frequency Body Accelerometer StandardDeviation()-Z" | num., between -1:1
"Frequency Body Accelerometer JerkSignal StandardDeviation()-X" | num., between -1:1
"Frequency Body Accelerometer JerkSignal StandardDeviation()-Y" | num., between -1:1
"Frequency Body Accelerometer JerkSignal StandardDeviation()-Z" | num., between -1:1
"Frequency Body Gyroscope StandardDeviation()-X" | num., between -1:1
"Frequency Body Gyroscope StandardDeviation()-Y" | num., between -1:1
"Frequency Body Gyroscope StandardDeviation()-Z" | num., between -1:1
"Frequency Body Accelerometer Magnitude StandardDeviation()" | num., between -1:1
"Frequency Body  Accelerometer JerkSignal Magnitude StandardDeviation()" | num., between -1:1
"Frequency Body  Gyroscope Magnitude StandardDeviation()" | num., between -1:1
"Frequency Body  Gyroscope JerkSignal Magnitude StandardDeviation()"| num., between -1:1
 
