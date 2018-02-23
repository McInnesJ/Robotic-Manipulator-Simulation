%URN: 6508014b
%
%This program will perform the inverse and forward kinematics for an
%arbitary robot arm. Simulink has been used to create a PID controller. 
%This program will launch that simulation and use it to plot the path of 
%the end effector in 3D space, and the scope outputs for Tau, Theta, Theta_d
%and Theta_dd where _d denotes the first time derrivative and _dd the second
%time derivative. 
%
%Finally, the program is able to calculate the optimal gain values. This
%uses a brute force approach, checkig all 1000 possible combinations. As
%such this element of the program takes around 20 minutes to run,
%depending on the exact performance of the machine. For this reason this
%element of the program has been left commented out. The values it obtains
%(2,3,2) have been pre-set. If you wish to run this aspect of the program
%simply uncomment the code in the 'IDENTIFY GAIN VALUES' section.
%
%A brief outline of the program's structure can be found in
%program_structure.txt

%*****INPUTS*****

twistAngles = [-pi/2, 0, pi/2, -pi/2, pi/2, 0];     
%Note, twist angles should be inputted in radians. 
linkLengths = [0, 0.5, 0, 0, 0, 0];
offsets = [0, 0.25, 0, 1, 0, 0.5];

C = 1/sqrt(2);  % just a place holder to make the t-matrix clearer.

t_matrix = [-C,0,C,1; 0,-1,0,1; C,0,C,0; 0,0,0,1];

I_F_matrices;

%*****PROGRAM FUNCTION*****

pArm = generatePArm(t_matrix, offsets);


jointAngles = generateJointAngles(pArm, linkLengths, offsets, t_matrix);
displayJointAngles(jointAngles);

displayAandRMatricies(jointAngles,twistAngles,linkLengths,offsets);



%******SIMULATION******

PID_Controller;
sim('PID_Controller.slx');

plot_effector_path(X,Y,Z,X_desired,Y_desired,Z_desired);

plot_scopes(tout,Tau,Theta,Theta_d,Theta_dd);


%******IDENTIFY GAIN VALUES*******

%Note, this will take a long time to run completely as the simulation must be
%run for each of the 1000 different possible combinations of P, I, and D.
%Running this function will identify P = 2, I = 3, D = 2, as the optimal
%solution.  I have chosen to leave the function commented out in this
%submission, however should you wish to run the function simply uncomment
%the line 'P,I,D] = identify_gains();' and run. 
% 
    %[P,I,D] = identify_gains();







