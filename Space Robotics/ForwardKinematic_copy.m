function [X,Y,Z] = ...
    ForwardKinematic_copy(theta1, theta2, theta3, theta4, theta5, theta6)

    %joint_angles = [theta1,theta2,theta3,theta4,theta5,theta6];
    twist_angles = [-90, 0, 90, -90, 90, 0];     
    %Note, twist angles should be inputted in radians. 
    link_lengths = [0, 0.5, 0, 0, 0, 0];
    offsets = [0, 0.25, 0, 1, 0, 0.5];
    
    
    A1 = generateAMatrix(theta1,twist_angles(1),link_lengths(1),...
        offsets(1));
    A2 = generateAMatrix(theta2,twist_angles(2),link_lengths(2),...
        offsets(2));
    A3 = generateAMatrix(theta3,twist_angles(3),link_lengths(3),...
        offsets(3));
    A4 = generateAMatrix(theta4,twist_angles(4),link_lengths(4),...
        offsets(4));
    A5 = generateAMatrix(theta5,twist_angles(5),link_lengths(5),...
        offsets(5));
    A6 = generateAMatrix(theta6,twist_angles(6),link_lengths(6),...
        offsets(6));
    
        
    D_H = generateD_HMatrix(A1,A2,A3,A4,A5,A6);
    
    
    X = D_H(1,4);
    Y = D_H(2,4);
    Z = D_H(3,4);
        
end

