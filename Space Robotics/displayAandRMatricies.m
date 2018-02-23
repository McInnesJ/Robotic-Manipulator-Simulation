function  displayAandRMatricies(jointAngles,twistAngles,linkLengths,offsets)
%Handles formatting and display for R and A matricies.

    for i = 1:4

        setI = jointAngles(:,i);

        A1 = generateAMatrix(setI(1),twistAngles(1),linkLengths(1),offsets(1));
        header1 = ['Set ', int2str(i), ', A1:'];
        disp(header1);
        disp(' ');
        disp(A1);

        A2 = generateAMatrix(setI(2),twistAngles(2),linkLengths(2),offsets(2));
        header2 = ['Set ', int2str(i), ', A2: '];
        disp(header2);
        disp(' ');
        disp(A2);

        A3 = generateAMatrix(setI(3),twistAngles(3),linkLengths(3),offsets(3));
        header3 = ['Set ', int2str(i), ', A3:'];
        disp(header3);
        disp(' ');
        disp(A3);

        A4 = generateAMatrix(setI(4),twistAngles(4),linkLengths(4),offsets(4));
        header4 = ['Set ', int2str(i), ', A4:'];
        disp(header4);
        disp(' ');
        disp(A4);

        A5 = generateAMatrix(setI(5),twistAngles(5),linkLengths(5),offsets(5));
        header5 = ['Set ', int2str(i), ', A5:'];
        disp(header5);
        disp(' ');
        disp(A5);

        A6 = generateAMatrix(setI(6),twistAngles(6),linkLengths(6),offsets(6));
        header6 = ['Set ', int2str(i), ', A6:'];
        disp(header6);
        disp(' ');
        disp(A6);

        disp('**                              **                              **');
        disp(' ');
        D_H_matrix = generateD_HMatrix(A1,A2,A3,A4,A5,A6);
        header7 = ['set ', int2str(i), ', D H Matrix:'];
        disp(header7);
        disp(' ');
        disp(D_H_matrix);

        disp('******************************************************************');
        disp(' ');

    end
end

