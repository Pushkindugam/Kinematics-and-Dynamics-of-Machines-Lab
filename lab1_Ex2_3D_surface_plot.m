% Exercise 2: 3D Surface Plot
% Create a 3D surface plot of z = sin(x) * cos(y)

[X, Y] = meshgrid(-2*pi:0.1:2*pi, -2*pi:0.1:2*pi);
Z = sin(X) .* cos(Y);

figure;
surf(X, Y, Z);
xlabel('x');
ylabel('y');
zlabel('z');
title('3D Surface Plot: z = sin(x) * cos(y)');
colorbar;