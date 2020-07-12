# Codebook

## DataSet
This dataset has the following variables:
- id: these are the subject ids, in total 30 (1-30), of which 70% was allocated to the train set and 30% to the test set
- activity: these are the activity labels, in total six:
    - walking (1)
    - walkingupstairs (2)
    - walkingdownstairs (3)
    - sitting (4)
    - standing (5)
    - laying (6)
- feature variables: these features are abbreviated in the variable names. These can be explained as follows: 
    - leading t = time measurement
    - leading f = frequency measurements 
    - Body = related to body movement. 
    - Gravity = acceleration of gravity 
    - Acc = accelerometer measurement 
    - Gyro = gyroscopic measurements 
    - Jerk = sudden movement acceleration 
    - Mag = magnitude of movement 
    - mean and SD are calculated for each subject for each activity for each mean and SD measurements
    - X/Y/Z refer to three-axial signals in the X, Y and Z directions. In total, there are 33 measurements including these three dimensions.
In the original data set, there were 561 feature variables. This data set has 66 feature variables: 33 variables with a mean and SD each (33*2). The variables are presented in the following units: g’s for the accelerometer and rad/sec for the gyro; g/sec and rad/sec/sec for the corresponding jerks.

## Averages
The ids and activities in this dataset are the same as in the dataset above, but the features are averaged for each id and activity. Therefore, each feature as described above has a '_mean' added to the variable name. There are 180 different combinations of subjects and activities (30*6), therefore this dataset has 180 records with again 66 feature variables in addition to the subject ids and activity labels.
