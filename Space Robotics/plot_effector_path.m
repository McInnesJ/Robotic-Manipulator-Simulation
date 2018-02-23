function plot_effector_path(X,Y,Z,X_desired,Y_desired,Z_desired)

    figure
    
    plot3(X,Y,Z,'.','color','g');
    hold on
    plot3(X_desired,Y_desired,Z_desired, '--', 'color', 'r')
    
    title('End Effector Path')
    xlabel('X')
    ylabel('Y')
    zlabel('N')
    legend('Actual Path','Desired Path')
    
    grid on
    hold off
end

