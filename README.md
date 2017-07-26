# Kinematic analysis of a planar 4-RPR robotic manipulator

## About

Kinematic analysis on a 4RPR manipulator. 

Addresses:
  - Forward and Inverse Kinematics
  - Manipulability Measures (Yoshikawa and Isentropic)
  - Task space visualization
  - Open loop control
  - Close loop Joint space and Task space control
 
## Manipulator

The 4RPR manipulator is a parallel planar manipulator with 4 chains. Each
chain consists of a revolute-prismatic-revolute joint order.
The manipulator has a total of 3 degrees of freedom and thereby requires
only 3 active joints to control.

An image of the manipulator is given below
  
<img src="https://github.com/ramana-naga/4RPR-Parallel-Planar-Manipulator/blob/master/4rpr-schematic.JPG" width="592" height="592"/>

Further information regarding the system can be found in `4rpr-paper.pdf`.

## Implementation

The program and GUI are writting using MATLAB. The source code can be found
in `src/`

<img src="https://github.com/ramana-naga/4RPR-Parallel-Planar-Manipulator/blob/master/4rpr-gui.PNG" width="592" height="299" />


## Run

To run this you require MATLAB 2016a and above

## TODO
Improve documentation, both in this `README` and in the code
