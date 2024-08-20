% Given lengths
O = [0; 0]; % Origin
R2 = 5; % cm
R3 = 13; % cm
R4 = 7; % cm
c = 7; % cm
b = 13; % cm

% Range of theta2 (crank angle)
theta2_range = linspace(0, 2*pi, 100);

for theta2 = theta2_range
    % Calculate theta3 and theta4 using the provided equations
    theta3 = asin((sin(theta2) - c) / b);
    theta4 = asin((sin(theta2) - c) / b) + pi;

    % Position of A (O2 is origin)
    Ax = R2 * cos(theta2);
    Ay = R2 * sin(theta2);
    
    % Position of B using the length R3 and angle theta3
    Bx = Ax + R3 * cos(theta3);
    % By = Ay + R3 * sin(theta3);
    By = 7;
    
    % Plotting the links
    plot([O(1) Ax], [O(2) Ay], 'b-o') % Plotting O to A
    hold on;

    plot([Ax Bx], [Ay By], 'r-o') % Plotting A to B
    hold off;

    axis([-20 20 -20 20]);
    axis square;
    drawnow;
    pause(0.03);
end
