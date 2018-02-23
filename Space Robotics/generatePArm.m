function pArm = generatePArm(tMatrix, offsets)
%Calculates the position vector of the arm.    

    pVector = inspectTMatrix(tMatrix, 'p');
    aVector = inspectTMatrix(tMatrix, 'a');
    
    pArm = pVector - offsets(6)*aVector;

end

