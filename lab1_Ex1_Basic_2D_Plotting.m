% Exercise 1: Basic 2D Plotting
% Plot a sine wave and a cosine wave on the same graph

x = linspace(0, 2*pi, 100);
y1 = sin(x);
y2 = cos(x);

figure;
% plot(x, y1, 'b-', x, y2, 'r--');
plot(x, y1, 'b-');
hold on
plot(x, y2, 'r--');
hold off
xlabel('x');
ylabel('y');
title('Sine and Cosine Waves');
legend('sin(x)', 'cos(x)');
grid on;