% Exercise 6: 3D Animation - Rotating Spiral
% Create an animation of a rotating 3D spiral

t = linspace(0, 10*pi, 1000);
x = cos(t) .* t;
y = sin(t) .* t;
z = t;

figure;
h = plot3(x, y, z);
xlabel('x');
ylabel('y');
zlabel('z');
title('Rotating 3D Spiral');
axis equal;
grid on;

for angle = 0:5:360
    view(angle, 20);
    drawnow;
    pause(0.05);
end