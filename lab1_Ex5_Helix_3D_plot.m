% Exercise 5: 3D Line Plot
% Create a 3D parametric plot of a helix

t = linspace(0, 10*pi, 1000);
x = cos(t);
y = sin(t);
z = t;

figure;
plot3(x, y, z);
xlabel('x');
ylabel('y');
zlabel('z');
title('3D Helix');
grid on;