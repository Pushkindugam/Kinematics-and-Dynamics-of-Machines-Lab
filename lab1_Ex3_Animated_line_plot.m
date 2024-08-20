% Exercise 3: Animated Line Plot
% Create an animation of a growing sine wave

figure;
x = linspace(0, 2*pi, 100);
y = sin(x);
% h = plot(x, y);
xlabel('x');
ylabel('y');
title('Growing Sine Wave');

for i = 1:length(x)
    plot(x(1:i), y(1:i))
    % set(h, 'XData', x(1:i), 'YData', y(1:i));
    axis([0 2*pi -1 1]);
    axis square
    pause(0.05);
    drawnow;
end