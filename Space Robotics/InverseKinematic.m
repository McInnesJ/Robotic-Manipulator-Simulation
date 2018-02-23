function [theta1,theta2,theta3,theta4,theta5,theta6] = InverseKinematic(T)

    %twistAngles = [-pi/2, 0, pi/2, -pi/2, pi/2, 0];
    %Note, twist angles should be inputted in radians.
    linkLengths = [0, 0.5, 0, 0, 0, 0];
    offsets = [0, 0.25, 0, 1, 0, 0.5];
    
    %I_F_matrices;
    
    p_arm = generatePArm(T,offsets);
    
    joint_angles = generateJointAngles(p_arm,linkLengths,offsets,T);
    
    joint_angles_set_1 = joint_angles(:,1);
    
    theta1 = joint_angles_set_1(1);
    theta2 = joint_angles_set_1(2);
    theta3 = joint_angles_set_1(3);
    theta4 = joint_angles_set_1(4);
    theta5 = joint_angles_set_1(5);
    theta6 = joint_angles_set_1(6);
    
end

