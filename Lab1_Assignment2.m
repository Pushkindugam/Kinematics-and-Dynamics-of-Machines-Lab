% Four-bar linkage simulation with fixed link lengths and Grashof's criterion
% Example with a rocking mechanism

% Define the lengths of the links (in meters)
L1 = 3;    % Length of link 1 (fixed)
L2 = 2.5;  % Length of link 2 (input link)
L3 = 2.2;  % Length of link 3 (coupler)
L4 = 2.3;  % Length of link 4 (output link)

% Check Grashof's condition
s = min([L1, L2, L3, L4]); % Shortest link
l = max([L1, L2, L3, L4]); % Longest link
p_plus_q = sum([L1, L2, L3, L4]) - (s + l); % Sum of the two intermediate links

% Verify Grashof's condition
if s + l <= p_plus_q
    disp('Grashof condition is satisfied. At least one link will revolve.');
else
    disp('Grashof condition is not satisfied. All links will rock.');
end

% Define the range of motion for the input link (Link 2)
theta2_range = linspace(pi/2, 3*pi/4, 50); % Restricted motion due to rocking

% Set up the figure
figure;
hold on;
axis equal;
xlabel('X');
ylabel('Y');
title('Four-bar Linkage Simulation (Rocking Mechanism)');

% Loop over the range of theta2 values for rocking motion
for i = 1:length(theta2_range)
    theta2 = theta2_range(i); % Current angle of input link
    
    % Using cosine law to determine angles and positions
    A = 2*L2*L4*cos(theta2) - 2*L1*L4;
    B = 2*L2*L4*sin(theta2);
    C = L1^2 + L2^2 + L4^2 - L3^2 + 2*L1*L2*cos(theta2);
    
    % Calculate the output link angle (theta4) using the quadratic formula
    discriminant = A^2 + B^2 - C^2;
    if discriminant >= 0
        theta4 = 2 * atan2(-B + sqrt(discriminant), A + C);
    else
        theta4 = NaN; % Infeasible solution, this should not happen if Grashof's condition is met
    end
    
    % Calculate positions
    xC = L2 * cos(theta2);
    yC = L2 * sin(theta2);
    xD = L1 + L4 * cos(theta4);
    yD = L4 * sin(theta4);
    
    % Update the angles of the links
    theta3 = atan2((yD - yC), (xD - xC));
    
    % Calculate the position of point B (pivot point of coupler and output link)
    xB = xC + L3 * cos(theta3);
    yB = yC + L3 * sin(theta3);
    
    % Plot the four-bar linkage
    clf;
    hold on;
    plot([0 L1], [0 0], 'k-', 'LineWidth', 2); % Link 1 (fixed)
    plot([0 xC], [0 yC], 'b-', 'LineWidth', 2); % Link 2 (input)
    plot([xC xB], [yC yB], 'r-', 'LineWidth', 2); % Link 3 (coupler)
    plot([xB L1], [yB 0], 'g-', 'LineWidth', 2); % Link 4 (output)
    
    % Plot the pivot points
    plot(0, 0, 'ko', 'MarkerFaceColor', 'k');
    plot(xC, yC, 'bo', 'MarkerFaceColor', 'b');
    plot(xB, yB, 'ro', 'MarkerFaceColor', 'r');
    plot(L1, 0, 'go', 'MarkerFaceColor', 'g');
    
    % Set axis limits
    axis([-4 4 -4 4]);
    
    % Pause for animation
    pause(0.05);
end

% Reverse the rocking motion
for i = length(theta2_range):-1:1
    theta2 = theta2_range(i); % Current angle of input link
    
    % Using cosine law to determine angles and positions
    A = 2*L2*L4*cos(theta2) - 2*L1*L4;
    B = 2*L2*L4*sin(theta2);
    C = L1^2 + L2^2 + L4^2 - L3^2 + 2*L1*L2*cos(theta2);
    
    % Calculate the output link angle (theta4) using the quadratic formula
    discriminant = A^2 + B^2 - C^2;
    if discriminant >= 0
        theta4 = 2 * atan2(-B + sqrt(discriminant), A + C);
    else
        theta4 = NaN; % Infeasible solution, this should not happen if Grashof's condition is met
    end
    
    % Calculate positions
    xC = L2 * cos(theta2);
    yC = L2 * sin(theta2);
    xD = L1 + L4 * cos(theta4);
    yD = L4 * sin(theta4);
    
    % Update the angles of the links
    theta3 = atan2((yD - yC), (xD - xC));
    
    % Calculate the position of point B (pivot point of coupler and output link)
    xB = xC + L3 * cos(theta3);
    yB = yC + L3 * sin(theta3);
    
    % Plot the four-bar linkage
    clf;
    hold on;
    plot([0 L1], [0 0], 'k-', 'LineWidth', 2); % Link 1 (fixed)
    plot([0 xC], [0 yC], 'b-', 'LineWidth', 2); % Link 2 (input)
    plot([xC xB], [yC yB], 'r-', 'LineWidth', 2); % Link 3 (coupler)
    plot([xB L1], [yB 0], 'g-', 'LineWidth', 2); % Link 4 (output)
    
    % Plot the pivot points
    plot(0, 0, 'ko', 'MarkerFaceColor', 'k');
    plot(xC, yC, 'bo', 'MarkerFaceColor', 'b');
    plot(xB, yB, 'ro', 'MarkerFaceColor', 'r');
    plot(L1, 0, 'go', 'MarkerFaceColor', 'g');
    
    % Set axis limits
    axis([-4 4 -4 4]);
    
    % Pause for animation
    pause(0.05);
end

hold off;
