% Exercise 4: Basic 2D Plotting
% Plot multiple functions on the same graph

x = linspace(-5, 5, 100);
y1 = x.^2;
y2 = x.^3;
y3 = exp(x);

figure;
% plot(x, y1, 'b-', x, y2, 'r--', x, y3, 'g:', 'LineWidth',4);
plot(x, y1, 'b-', 'LineWidth',4);
hold on
plot(x, y2, 'r--', 'LineWidth',4);
hold on
plot(x, y3, 'g:', 'LineWidth',4);
hold off
xlabel('x');
ylabel('y');
title('Multiple Functions Plot');
legend('x^2', 'x^3', 'e^x');
grid on;