# Robotic-Manipulator-Simulation
Models a 6 degree of freedom robotic manipulator.


program_control
    This is the top level script from which all functions are called.
    
InverseKinematic
    This is primarily a shell function responsible for formatting results such that they
    can be accessed correctly by the PID_Controller.slx file. 
    
generateJointAngles
    This does the bulk of the processing in the inverse kinematic calculations. This file
    contains several sub-functions to help perform these calculations. There is one 
    function for the generation of each set of joint angles (i.e. for each arm
    configuration). In addition there is a function for each theta (1 through 6) and 
    the positive square root and negative square root variations of theta 1 and 2.
    
displayJointAngles
    simply handles the display of the joint angles calculated by the generateJointAngles
    function. 
    
ForwardsKinematic_copy
    This contains a copy of the code contained in the ForwardsKinematic file created
    through the 'matlab function' block in simulink. As with InverseKinematic this is 
    primarily a shell function that ensure PID_Controller.slx can correctly access the 
    relevant information
    
generateAMatrix and generateD_HMatrix
    These two functions handle the bulk of the processing for the forward kinematic
    calculations. 
    
displayAandRMatricies
    This function calls generateAMatrix and generateD_HMatrix and prepares and displays
    the results.
    
plot_effector_path and plot_scopes
    These functions plot the various results produced by the simulink file
    (PID_Controller.slx). They also control the formatting of the graphs, and ensure each 
    graph is displayed simultaneously.
    
identify_gain
    An iterative method of identifying the optimal gain value.
    
inspectTMatrix
    Used at various points in the program, this function allows the user to extract the 
    n,s,a, and p vectors from the t-matrix.
    
generatePArm
    Calculates the position vector of the arm.
    
