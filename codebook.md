# Codebook

## Description of variables - dataSet
This dataset has the following variables:
- id: these are the subject ids, in total 30 (1-30), of which 70% was allocated to the train set and 30% to the test set
- activity: these are the activity labels, in total six:
    - walking (1)
    - walkingupstairs (2)
    - walkingdownstairs (3)
    - sitting (4)
    - standing (5)
    - laying (6)
- description of abbreviated features (in total 561 for the complete dataSet, 66 for this dataSet): 
    - leading t = time measurement
    - leading f = frequency measurements 
    - Body = related to body movement. 
    - Gravity = acceleration of gravity 
    - Acc = accelerometer measurement 
    - Gyro = gyroscopic measurements 
    - Jerk = sudden movement acceleration 
    - Mag = magnitude of movement 
    - mean and SD are calculated for each subject for each activity for each mean and SD measurements
    - XYZ: used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.
  This results in 66 variables: 33 variables with a mean and SD each. The variables are presented in the following units: g’s for the accelerometer and rad/sec for the gyro; g/sec and rad/sec/sec for the corresponding jerks.

## Description of data - averages set
The ids and activities in this dataset are the same as in the dataset above, but the features are averaged for each id and activity. Therefore, each feature as described above has a '_mean' added to the variable name. There are 180 different combinations of subjects and activities (30*6), therefore this dataset has 180 records with again 66 feature variables in addition to the subject ids and activity labels.
