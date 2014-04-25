CodeBook.md
========================================================
This code book describes the dataset:
Average.of.all.variables.for.each.subject.and.activity.combination.txt

The dataset was produced for the Coursera Getting and Cleaning Data Course Project.

The sections of this code book are:

1. Variables 
2. Data
3. Transformations and other work
4. Details of the run_analysis.R script

Variables
---------------------------------
* Column variables (note: the description of each variable appears in the next section, Data)

1. Time Body Acceleration Mean X
2. Time Body Acceleration Mean Y
3. Time Body Acceleration Mean Z
4. Time Gravity Acceleration Mean X
5. Time Gravity Acceleration Mean Y
6. Time Gravity Acceleration Mean Z
7. Time Body Acceleration Jerk Mean X
8. Time Body Acceleration Jerk Mean Y
9. Time Body Acceleration Jerk Mean Z
10. Time Body Gyro Mean X
11. Time Body Gyro Mean Y
12. Time Body Gyro Mean Z
13. Time Body Gyro Jerk Mean X
14. Time Body Gyro Jerk Mean Y
15. Time Body Gyro Jerk Mean Z
16. Time Body Acceleration Magnitude Mean
17. Time Gravity Acceleration Magnitude Mean
18. Time Acceleration Jerk Magnitude Mean
19. Time Body Gyro Magnitude Mean
20. Time Body Gyro Jerk Magnitude Mean
21. Frequency Body Acceleration Mean X
22. Frequency Body Acceleration Mean Y
23. Frequency Body Acceleration Mean Z
24. Frequency Body Acceleration Jerk Mean X
25. Frequency Body Acceleration Jerk Mean Y
26. Frequency Body Acceleration Jerk Mean Z
27. Frequency Body Gyro Mean X
28. Frequency Body Gyro Mean Y
29. Frequency Body Gyro Mean Z
30. Frequency Body Acceleration Magnitude Mean
31. Frequency Body Acceleration Jerk Magnitude Mean
32. Frequency Body Gyro Magnitude Mean
33. Frequency Body Gyro Jerk Magnitude Mean
34. Time Body Acceleration Standard Deviation X
35. Time Body Acceleration Standard Deviation Y
36. Time Body Acceleration Standard Deviation Z
37. Time Gravity Acceleration Standard Deviation X
38. Time Gravity Acceleration Standard Deviation Y
39. Time Gravity Acceleration Standard Deviation Z
40. Time Body Acceleration Jerk Standard Deviation X
41. Time Body Acceleration Jerk Standard Deviation Y
42. Time Body Acceleration Jerk Standard Deviation Z
43. Time Body Gyro Standard Deviation X
44. Time Body Gyro Standard Deviation Y
45. Time Body Gyro Standard Deviation Z
46. Time Body Gyro Jerk Standard Deviation X
47. Time Body Gyro Jerk Standard Deviation Y
48. Time Body Gyro Jerk Standard Deviation Z
49. Time Body Acceleration Magnitude Standard Deviation
50. Time Gravity Acceleration Magnitude Standard Deviation
51. Time Acceleration Jerk Magnitude Standard Deviation
52. Time Body Gyro Magnitude Standard Deviation
53. Time Body Gyro Jerk Magnitude Standard Deviation
54. Frequency Body Acceleration Standard Deviation X
55. Frequency Body Acceleration Standard Deviation Y
56. Frequency Body Acceleration Standard Deviation Z
57. Frequency Body Acceleration Jerk Standard Deviation X
58. Frequency Body Acceleration Jerk Standard Deviation Y
59. Frequency Body Acceleration Jerk Standard Deviation Z
60. Frequency Body Gyro Standard Deviation X
61. Frequency Body Gyro Standard Deviation Y
62. Frequency Body Gyro Standard Deviation Z
63. Frequency Body Acceleration Magnitude Standard Deviation
64. Frequency Body Acceleration Jerk Magnitude Standard Deviation
65. Frequency Body Gyro Magnitude Standard Deviation
66. Frequency Body Gyro Jerk Magnitude Standard Deviation

* Rows/Observations:

Each row has a row name which indicates a combination of 1) an anonymous Subject, and 2) one of 6 Activities, as described below.

The subjects are people who participated in the study. Their identity is kept private and they are noted by a number from 1 to 30.

The 6 activities are:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

EXAMPLES:

1. Row name "1.LAYING" indicates Subject number 1 doing Activity Laying.

2. Row name "26.WALKING" indicates Subject number 26 doing Activity Walking. 


Data
---------------------------------
The data Representative by the variables should be interpreted as follows:

All data elements represent an average of multiple 3-axial (that is, X, Y, and Z) accelerometer and gyroscope reading measurements for a Subject-and-Activity combination.

The readings are normalized and bounded within [-1,1].

The variable list from Section 1. Variables (above) reflects transformations and combinations of the raw signals as indicated by which of the following terms the variable name includes, as follows:

1. Time :  time domain signals.
2. Frequency:  frequency domain signals.
3. Acceleration: an accelerometer reading.
4. Gyro: a gyroscope reading.
5. Body: the body component of the acceleration signal.
6. Gravity: the gravity component of the acceleration signal.
7. Jerk: a derivation from the body linear acceleration and angular velocity readings.
8. Magnitude: a calculation using the Euclidean norm.
9. Mean: a statistical mean value calculation of the raw signals.
10. Standard Deviation: a statistical standard deviation calculation of the raw signals.
11. X indicates a reading for the X-axis.
12. Y indicates a reading for the y-axis.
13. Z indicates a reading for the z-axis.


EXAMPLES:

1. "Time Body Acceleration Mean X" is an average of  multiple mean values of the time domain signal of the body component of the accelerometer reading  of the x-axis. 

2. "Frequency Body Acceleration Jerk Standard Deviation Z" is an average of multiple standard deviation values of the Jerk derivation from the body component of the accelerometer reading of the Z-axis.



Transformations
---------------------------------
Each element in the data table represents an average of multiple Subject-and-Activity combination readings from the input table.  Details of the input table are documented in the main script.

The script also performs a t() function (transform function) to flip the data frame so that the variables appear in columns and the Subject and Activity combinations appear as row names.


4. Details of the run_analysis.R script
---------------------------------------
The run_analysis.R script is well document within the script, with explanations of the input file, steps taken, purpose of each step, and output produced by steps.  The README file also contains the script and documentation.