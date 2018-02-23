function [P,I,D] = identify_gains(X_desired,Y_desired,Z_desired)

    static_x_desired;
    static_y_desired;
    static_z_desired;
    
    errors = zeros(1,1000);
    gain_vals = zeros(3,1000);
    
    iterator = 0;
    PID_Controller;
    
    for p = 1:10
        for i = 1:10
            for d = 1:10
                iterator = iterator + 1;
                
                set_param('PID_Controller/Subsystem2/P', 'Gain', num2str(p));
                set_param('PID_Controller/Subsystem2/I', 'Gain', num2str(i));
                set_param('PID_Controller/Subsystem2/D', 'Gain', num2str(d));

                sim('PID_Controller.slx');
                
                x_error = x_desired_static - X;
                y_error = y_desired_static - Y;
                z_error = z_desired_static - Z;
                
                rms_errors = sqrt(x_error.^2 + y_error.^2 + z_error.^2);
                sum_error = sum(rms_errors);
                
                errors(iterator) = sum_error;
                gain_vals(1,iterator) = p;
                gain_vals(2,iterator) = i;
                gain_vals(3,iterator) = d;
                
            end
        end
    end
    
    [~,index] = min(errors);
    P = gain_vals(1,index);
    I = gain_vals(2,index);
    D = gain_vals(3,index);
    
    set_param('PID_Controller/Subsystem2/P', 'Gain', num2str(P));
    set_param('PID_Controller/Subsystem2/I', 'Gain', num2str(I));
    set_param('PID_Controller/Subsystem2/D', 'Gain', num2str(D));
    
    disp('P Gain: ');
    disp(P);
    disp('I Gain: ');
    disp(I);
    disp('D Gain: ');
    disp(D);
    
end

