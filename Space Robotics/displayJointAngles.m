function displayJointAngles(jointAngles)
%Handles formatting and display for the 4 sets of joint angles

    set1 = rad2deg(jointAngles(:,1));
    set2 = rad2deg(jointAngles(:,2));
    set3 = rad2deg(jointAngles(:,3));
    set4 = rad2deg(jointAngles(:,4));

    results = table({'Theta 1'; 'Theta 2'; 'Theta 3'; 'Theta 4'; 'Theta 5';...
        'Theta 6'}, set1, set2, set3, set4);

    disp(results);
    disp('**                              **                              **');
    disp(' ');

end

