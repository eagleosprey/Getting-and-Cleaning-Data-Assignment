CodeBook.md
========================================================
This code book describes the dataset:
Average.of.all.variables.for.each.subject.and.activity.combination.txt

The dataset was produced for the Coursera Getting and Cleaning Data Project in the Data Science track.

The sections of this code book are:

1. Variables 
2. Data
3. Transformations and other work
4. Details of the run_analysis.R script


1) Variables
---------------------------------
#### Note: the details of variables appears below, in the Data section. 

1. Subject
 * Character (2)
 * The subjects are people who participated in the study. 
 * Their identity is kept private and they are noted by a number from 1 to 30.

2. Activity
 * Character(18)
 * The 6 activities are:
        1. WALKING
        2. WALKING_UPSTAIRS
        3. WALKING_DOWNSTAIRS
        4. SITTING
        5. STANDING
        6. LAYING

3. Time.Body.Acceleration.Mean.X
4. Time.Body.Acceleration.Mean.Y
5. Time.Body.Acceleration.Mean.Z
6. Time.Gravity.Acceleration.Mean.X
7. Time.Gravity.Acceleration.Mean.Y
8. Time.Gravity.Acceleration.Mean.Z
9. Time.Body.Acceleration.Jerk.Mean.X
10. Time.Body.Acceleration.Jerk.Mean.Y
11. Time.Body.Acceleration.Jerk.Mean.Z
12. Time.Body.Gyro.Mean.X
13. Time.Body.Gyro.Mean.Y
14. Time.Body.Gyro.Mean.Z
15. Time.Body.Gyro.Jerk.Mean.X
16. Time.Body.Gyro.Jerk.Mean.Y
17. Time.Body.Gyro.Jerk.Mean.Z
18. Time.Body.Acceleration.Magnitude.Mean
19. Time.Gravity.Acceleration.Magnitude.Mean
20. Time.Acceleration.Jerk.Magnitude.Mean
21. Time.Body.Gyro.Magnitude.Mean
22. Time.Body.Gyro.Jerk.Magnitude.Mean
23. Frequency.Body.Acceleration.Mean.X
24. Frequency.Body.Acceleration.Mean.Y
25. Frequency.Body.Acceleration.Mean.Z
26. Frequency.Body.Acceleration.Jerk.Mean.X
27. Frequency.Body.Acceleration.Jerk.Mean.Y
28. Frequency.Body.Acceleration.Jerk.Mean.Z
29. Frequency.Body.Gyro.Mean.X
30. Frequency.Body.Gyro.Mean.Y
31. Frequency.Body.Gyro.Mean.Z
32. Frequency.Body.Acceleration.Magnitude.Mean
33. Frequency.Body.Acceleration.Jerk.Magnitude.Mean
34. Frequency.Body.Gyro.Magnitude.Mean
35. Frequency.Body.Gyro.Jerk.Magnitude.Mean
36. Time.Body.Acceleration.Standard.Deviation.X
37. Time.Body.Acceleration.Standard.Deviation.Y
38. Time.Body.Acceleration.Standard.Deviation.Z
39. Time.Gravity.Acceleration.Standard.Deviation.X
40. Time.Gravity.Acceleration.Standard.Deviation.Y
41. Time.Gravity.Acceleration.Standard.Deviation.Z
42. Time.Body.Acceleration.Jerk.Standard.Deviation.X
43. Time.Body.Acceleration.Jerk.Standard.Deviation.Y
44. Time.Body.Acceleration.Jerk.Standard.Deviation.Z
45. Time.Body.Gyro.Standard.Deviation.X
46. Time.Body.Gyro.Standard.Deviation.Y
47. Time.Body.Gyro.Standard.Deviation.Z
48. Time.Body.Gyro.Jerk.Standard.Deviation.X
49. Time.Body.Gyro.Jerk.Standard.Deviation.Y
50. Time.Body.Gyro.Jerk.Standard.Deviation.Z
51. Time.Body.Acceleration.Magnitude.Standard.Deviation
52. Time.Gravity.Acceleration.Magnitude.Standard.Deviation
53. Time.Acceleration.Jerk.Magnitude.Standard.Deviation
54. Time.Body.Gyro.Magnitude.Standard.Deviation
55. Time.Body.Gyro.Jerk.Magnitude.Standard.Deviation
56. Frequency.Body.Acceleration.Standard.Deviation.X
57. Frequency.Body.Acceleration.Standard.Deviation.Y
58. Frequency.Body.Acceleration.Standard.Deviation.Z
59. Frequency.Body.Acceleration.Jerk.Standard.Deviation.X
60. Frequency.Body.Acceleration.Jerk.Standard.Deviation.Y
61. Frequency.Body.Acceleration.Jerk.Standard.Deviation.Z
62. Frequency.Body.Gyro.Standard.Deviation.X
63. Frequency.Body.Gyro.Standard.Deviation.Y
64. Frequency.Body.Gyro.Standard.Deviation.Z
65. Frequency.Body.Acceleration.Magnitude.Standard.Deviation
66. Frequency.Body.Acceleration.Jerk.Magnitude.Standard.Deviation
67. Frequency.Body.Gyro.Magnitude.Standard.Deviation
68. Frequency.Body.Gyro.Jerk.Magnitude.Standard.Deviation


Data
---------------------------------
The data Representative by variables 3 to 68 should be interpreted as follows:

All data elements represent an **average** of multiple 3-axial (that is, X, Y, and Z) accelerometer and gyroscope reading measurements for a Subject and Activity combination.

The readings are normalized and bounded within [-1,1].

Variables 3 to 68 from Section 1. Variables (above) reflects transformations and combinations of the raw signals as indicated by the terms the variable name includes, as follows:

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

1. "Time Body Acceleration Mean X" is an **average** of multiple mean values of the time domain signal of the body component of the accelerometer reading  of the x-axis. 

2. "Frequency Body Acceleration Jerk Standard Deviation Z" is an **average** of multiple standard deviation values of the Jerk derivation from the body component of the accelerometer reading of the Z-axis.



Transformations
---------------------------------
Each element in the data table represents an **average** of multiple Subject-and-Activity combination readings from the input table.  Details of the input table are documented in the main script.

The script also performs a t() function (transform function) to flip the data frame so that the variables appear in columns and the Subject and Activity combinations appear as row names.


4. Details of the run_analysis.R script
---------------------------------------
The run_analysis.R script is well documented within the script, with explanations of the input file, steps taken, purpose of each step, and output produced by the steps.  The README file also contains the script and documentation.