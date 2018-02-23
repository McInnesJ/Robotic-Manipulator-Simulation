function plot_scopes(time,tau,theta,theta_d,theta_dd)

    plot_tau(time,tau);
    plot_theta(time,theta);
    plot_theta_d(time,theta_d);
    plot_theta_dd(time,theta_dd);
    
end

function plot_tau(time,Tau)

    figure
    hold on
    grid on
    
    Tau(:,1) = [];
    
    plot(time,Tau);
    axis([0 10 -6 1.5])
    
    title('Tau')
    xlabel('Time')
    ylabel('Tau')
    legend('Tau 1','Tau 2','Tau 3','Tau 4','Tau 5','Tau 6',...
        'Location','bestoutside')
    hold off
    
end

function plot_theta(time,Theta)

    figure
    hold on
    grid on
    
    Theta(:,1) = [];
    
    plot(time,Theta);
    axis([0 10 -3 1.5])
    
    title('Theta')
    xlabel('Time')
    ylabel('Theta')
    legend('Theta1','Theta2','Theta3','Theta4','Theta5','Theta6',...
        'Location','bestoutside')
    
    hold off
    
end

function plot_theta_d(time,Theta_d)

    figure
    hold on
    grid on
    
    Theta_d(:,1) = [];
    
    plot(time,Theta_d);
    axis([0 10 -0.5 0.3])
    
    title('Angular Velocity')
    xlabel('Time')
    ylabel('Angular Velocity')
    legend('Theta1\_d','Theta2\_d','Theta3\_d','Theta4\_d','Theta5\_d',...
        'Theta6\_d','Location','bestoutside')
    
    hold off
    
end

function plot_theta_dd(time,Theta_dd)

    figure
    hold on
    grid on
    
    Theta_dd(:,1) = [];
    
    plot(time,Theta_dd);
    axis([0 10 -0.2 0.2])
    
    title('Angular Acceleration')
    xlabel('Time')
    ylabel('Angular Acceleration')
    legend('Theta1\_dd','Theta2\_dd','Theta3\_dd','Theta4\_dd',...
        'Theta5\_dd','Theta6\_dd','Location','bestoutside')
    
    hold off
    
end