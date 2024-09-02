a = 5;
b = 13;
c  =7;

theta2 = linspace(0,2*pi,100);
theta3 = asin((c-a*sin(theta2))/b);
omega2 = 2;
omega3 = ((-(a/b).*cos(theta2)) ./ cos(theta3)) * (omega2);
% omega3 = -(a/b)*cos(theta2)*omega2;

Ax = a*cos(theta2);
Ay = a*sin(theta2);

Bx = b.*cos(theta3) + a.*cos(theta2);
By = c;

v2x = -a*sin(theta2)*omega2;
v2y = a*cos(theta2)*omega2;

v3x = -a.*omega2.*sin(theta2) - b.*omega3.*sin(theta3);
v3y = 0;

figure;
title("Lab Assignment 2");
for i = 1:length(theta2)
    subplot(1,2,1);
    plot([0 Ax(i) Bx(i)],[0 Ay(i) By],'k-o');
    hold on;
    axis([-20 20 -20 20]);
    rectangle('Position', [Bx(i)-2,c-2 , 4, 4] , 'FaceColor',"g");
    %pause(0.05);
    axis square;
    hold off;

    subplot(1,2,2);
    quiver(0,0,v2x(i),v2y(i));
    hold on;
    plot([0 v2x(i)],[0 v2y(i)],'r-');
    hold on;
    % axis([-20 20 -20 20]);
    quiver(0,0,v3x(i),0);
    hold on
    plot([0 v3x(i)],[0 0],'b-');
    hold on;
    % axis([-20 20 -20 20]);
    % quiver(v2x(i),v2y(i),v3x(i),0);
    plot([v2x(i) v3x(i)],[v2y(i) 0],'g-');
    hold on;
    axis([-20 20 -20 20]);
    axis square;
    %pause(0.05);
    hold off;
    
    grid on;
    drawnow;
end