% Exercise 7: 2D Animation - Bouncing Ball
% Create an animation of a bouncing ball

figure;
axis([-1 1 0 1]);
h = rectangle('Position', [-0.1, 0.9, 0.2, 0.2], 'Curvature', [1 1]);  % [x,y,w,h] , Use [1 1] to create an ellipse or circle.
xlabel('x');
ylabel('y');
title('Bouncing Ball');

y = 0.9;
vy = 0;
g = -9.8;
dt = 0.01;
coef = 0.8;  % coefficient of restitution

for t = 0:dt:10
    y = y + vy * dt;
    vy = vy + g * dt;
    
    if y < 0
        y = 0;
        vy = -vy * coef;
    end
    set(h, 'Position', [-0.1, y, 0.2, 0.2]);
    % drawnow;
    pause(0.01);
end