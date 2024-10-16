br = 10;    % Base radius
h = 8;      % Height of cam follower rise

t = 0:359;  % Time steps (degrees)
theta = linspace(0, 2*pi, 360);  % Angular position in radians
n = 360;    % Number of points

s = zeros(1, n);  % Preallocate the displacement array

% Loop through time steps and calculate displacement `s(i)`
for i = 1:length(t)
    if (i >= 1 && i < 60)  % First segment: Constant base radius
        s(i) = br;

    elseif (i >= 60 && i < 120)  % Second segment: Rise
        normalized_i = (i - 60) / 60;  % Normalize i for the segment
        s(i) = br + h * ( (64 * normalized_i^3) - (192 * normalized_i^4) + (192 * normalized_i^5) - (64 * normalized_i^6) );

    elseif (i >= 120 && i < 240)  % Third segment: Constant maximum displacement
        s(i) = br + h;

    elseif (i >= 240 && i < 300)  % Fourth segment: Fall
        normalized_i = (300 - i) / 60;  % Normalize i for the segment
        s(i) = br + h * ( (35 * normalized_i^4) - (84 * normalized_i^5) + (70 * normalized_i^6) - (20 * normalized_i^7) );

    else  % Last segment: Constant base radius
        s(i) = br;
    end
end

% Calculate velocity v(i), acceleration a(i), and jerk j(i) using numerical differentiation
dtheta = theta(2) - theta(1);  % Angular step size

% Velocity (first derivative of displacement)
v = [diff(s) / dtheta, 0];  % Append a 0 to match the length of the original array

% Acceleration (second derivative of displacement)
a = [diff(v) / dtheta, 0];  % Append a 0 to match the length of the original array

% Jerk (third derivative of displacement)
j = [diff(a) / dtheta, 0];  % Append a 0 to match the length of the original array

% Plot the cam-follower displacement in polar coordinates
figure;
subplot(2,2,1);
polarplot(theta, s, 'LineWidth', 2);
title('Displacement (s)');

% Plot velocity
subplot(2,2,2);
plot(theta, v, 'LineWidth', 2);
title('Velocity (v)');
xlabel('Theta (radians)');
ylabel('Velocity');

% Plot acceleration
subplot(2,2,3);
plot(theta, a, 'LineWidth', 2);
title('Acceleration (a)');
xlabel('Theta (radians)');
ylabel('Acceleration');

% Plot jerk
subplot(2,2,4);
plot(theta, j, 'LineWidth', 2);
title('Jerk (j)');
xlabel('Theta (radians)');
ylabel('Jerk');

