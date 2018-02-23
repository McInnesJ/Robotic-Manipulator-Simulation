function jointAngles = generateJointAngles(pArm, linkLengths, offsets, tMatrix)
%Calculates the 4 sets of possible joint angles. Note, there are 4 sets due
%to the square root in the calculations for theta1, and theta2. Since the
%output of the sqrt could be either positive or negative we have a positve
%and negative version of the calculation functions for theta 1 and 2. THe
%streams are then generated ++,+-,-+,-- for theta 1 and 2 respectively. 

%User should also aim to keep angles in radians until point of display.

    set1 = generateSet1(pArm, linkLengths, offsets, tMatrix);
    set2 = generateSet2(pArm, linkLengths, offsets, tMatrix);
    set3 = generateSet3(pArm, linkLengths, offsets, tMatrix);
    set4 = generateSet4(pArm, linkLengths, offsets, tMatrix);
    
    jointAngles(:,1) = set1;
    jointAngles(:,2) = set2;
    jointAngles(:,3) = set3;
    jointAngles(:,4) = set4;
    
end

function set1 = generateSet1(pArm, linkLengths, offsets, tMatrix)

    theta1 = calculateTheta1Plus(pArm, offsets);
    
    A = calculateA(pArm, theta1);
    B = calculateB(A, pArm, linkLengths, offsets);
    theta2 = calculateTheta2Plus(pArm, A, B);
    theta3 = calculateTheta3(pArm,theta2,linkLengths,A);
    
    aVector = inspectTMatrix(tMatrix, 'a');
    theta4 = calculateTheta4(theta1,theta2,theta3, aVector);
    theta5 = calculateTheta5(theta1,theta2,theta3,aVector);
    
    sVector = inspectTMatrix(tMatrix, 's');
    nVector = inspectTMatrix(tMatrix, 'n');
    theta6 = calculateTheta6(theta1,theta2,theta3,sVector,nVector);
    
    set1 = [theta1,theta2,theta3,theta4,theta5,theta6];
end
function set2 = generateSet2(pArm, linkLengths, offsets, tMatrix)

    theta1 = calculateTheta1Plus(pArm, offsets);
    
    A = calculateA(pArm, theta1);
    B = calculateB(A, pArm, linkLengths, offsets);
    theta2 = calculateTheta2Minus(pArm, A, B);
    theta3 = calculateTheta3(pArm,theta2,linkLengths,A);
    
    aVector = inspectTMatrix(tMatrix, 'a');
    theta4 = calculateTheta4(theta1,theta2,theta3, aVector);
    theta5 = calculateTheta5(theta1,theta2,theta3,aVector);
    
    sVector = inspectTMatrix(tMatrix, 's');
    nVector = inspectTMatrix(tMatrix, 'n');
    theta6 = calculateTheta6(theta1,theta2,theta3,sVector,nVector);
    
    set2 = [theta1,theta2,theta3,theta4,theta5,theta6];
end
function set3 = generateSet3(pArm, linkLengths, offsets, tMatrix)

    theta1 = calculateTheta1Minus(pArm, offsets);
    
    A = calculateA(pArm, theta1);
    B = calculateB(A, pArm, linkLengths, offsets);
    theta2 = calculateTheta2Plus(pArm, A, B);
    theta3 = calculateTheta3(pArm,theta2,linkLengths,A);
    
    aVector = inspectTMatrix(tMatrix, 'a');
    theta4 = calculateTheta4(theta1,theta2,theta3, aVector);
    theta5 = calculateTheta5(theta1,theta2,theta3,aVector);
    
    sVector = inspectTMatrix(tMatrix, 's');
    nVector = inspectTMatrix(tMatrix, 'n');
    theta6 = calculateTheta6(theta1,theta2,theta3,sVector,nVector);
    
    set3 = [theta1,theta2,theta3,theta4,theta5,theta6];
end
function set4 = generateSet4(pArm, linkLengths, offsets, tMatrix)

    theta1 = calculateTheta1Minus(pArm, offsets);
    
    A = calculateA(pArm, theta1);
    B = calculateB(A, pArm, linkLengths, offsets);
    theta2 = calculateTheta2Minus(pArm, A, B);
    theta3 = calculateTheta3(pArm,theta2,linkLengths,A);
    
    aVector = inspectTMatrix(tMatrix, 'a');
    theta4 = calculateTheta4(theta1,theta2,theta3, aVector);
    theta5 = calculateTheta5(theta1,theta2,theta3,aVector);
    
    sVector = inspectTMatrix(tMatrix, 's');
    nVector = inspectTMatrix(tMatrix, 'n');
    theta6 = calculateTheta6(theta1,theta2,theta3,sVector,nVector);
    
    set4 = [theta1,theta2,theta3,theta4,theta5,theta6];
end


function theta1Plus = calculateTheta1Plus(pArm, offsets)

    pArmX = pArm(1);
    pArmY = pArm(2);
    d2 = offsets(2);
    
    rooted = pArmX^2 + pArmY^2 - d2^2;
    denominator = sqrt(rooted);
    
    theta1Plus = atan2(pArmY,pArmX) - atan2(d2,denominator);
end
function theta1Minus = calculateTheta1Minus(pArm, offsets)

    pArmX = pArm(1);
    pArmY = pArm(2);
    d2 = offsets(2);
    
    rooted = pArmX^2 + pArmY^2 - d2^2;
    denominator = -sqrt(rooted);
    
    theta1Minus = atan2(pArmY,pArmX) - atan2(d2,denominator);
end

function A = calculateA(pArm, theta1)

    pArmX = pArm(1);
    pArmY = pArm(2);
    
    A = cos(theta1)*pArmX + sin(theta1)*pArmY;
end

function B = calculateB(A,pArm,linkLengths,offsets)

    pArmZ = pArm(3);
    a2 = linkLengths(2);
    d4 = offsets(4);
    
    numerator = A^2 + pArmZ^2 + a2^2 - d4^2;
    denominator = 2*a2;
    
    B = numerator/denominator;
end

function theta2Plus = calculateTheta2Plus(pArm, A, B)

    pArmZ = pArm(3);
    
    rooted = A^2 + pArmZ^2 - B^2;
    
    denominator = sqrt(rooted);
    
    theta2Plus = atan2(A,pArmZ) - atan2(B,denominator);
    
end
function theta2Minus = calculateTheta2Minus(pArm, A, B)

    pArmZ = pArm(3);
    
    rooted = A^2 + pArmZ^2 - B^2;
    
    denominator = -sqrt(rooted);
    
    theta2Minus = atan2(A,pArmZ) - atan2(B,denominator);
    
end

function theta3 = calculateTheta3(pArm, theta2, linkLengths, A)

    pArmZ = pArm(3);
    c2 = cos(theta2);
    s2 = sin(theta2);
    a2 = linkLengths(2);
    
    numerator = A - a2*c2;
    denominator = pArmZ + a2*s2;
    
    theta3 = atan2(numerator,denominator) - theta2;
end
function theta4 = calculateTheta4(theta1, theta2, theta3, aVector)

    aX = aVector(1);
    aY = aVector(2);
    aZ = aVector(3);
    
    c1 = cos(theta1);
    s1 = sin(theta1);
    c23 = cos(theta2+theta3);
    s23 = sin(theta2+theta3);
    
    numerator = -s1*aX + c1*aY;
    denominator = c23*(c1*aX +s1*aY) - s23*aZ;
    
    theta4 = atan2(numerator,denominator);
end
function theta5 = calculateTheta5(theta1, theta2, theta3, aVector)

    aX = aVector(1);
    aY = aVector(2);
    aZ = aVector(3);
    
    c1 = cos(theta1);
    s1 = sin(theta1);
    c23 = cos(theta2+theta3);
    s23 = sin(theta2+theta3);
    
    lhs = (c1*c23*aX + s1*c23*aY - s23*aZ)^2;
    rhs = (-s1*aX + c1*aY)^2;
    
    numerator = sqrt(lhs + rhs);
    denominator = s23*(c1*aX + s1*aY) + c23*aZ;
    
    theta5 = atan2(numerator,denominator);

end
function theta6 = calculateTheta6(theta1, theta2, theta3, sVector, nVector)

    sX = sVector(1);
    sY = sVector(2);
    sZ = sVector(3);
    
    nX = nVector(1);
    nY = nVector(2);
    nZ = nVector(3);
    
    c1 = cos(theta1);
    s1 = sin(theta1);
    c23 = cos(theta2+theta3);
    s23 = sin(theta2+theta3);
    
    numerator = s23*(c1*sX + s1*sY) + c23*sZ;
    denominator = s23*(c1*nX + s1*nY) + c23*nZ;
    
    theta6 = atan2(numerator,-denominator);
end
