a = 24;
b = 80;
c = 0;
omega2 = 10;
alpha2 = 40;
theta2 = 45;
theta3 = asin((c-a*sin(theta2))/b);

% omega3 = -(a/b)*cos(theta2)*omega2;
omega3 = ((-(a/b).*cos(theta2)) ./ cos(theta3)) * (omega2);

Ax = a*cos(theta2);
Ay = a*sin(theta2);

Bx = b.*cos(theta3) + a.*cos(theta2);
By = c;

v2x = -a*sin(theta2)*omega2;
v2y = a*cos(theta2)*omega2;

v3x = -a.*omega2.*sin(theta2) - b.*omega3.*sin(theta3);
v3y = 0;

vec_a = [Ax;Ay;0];
Acc_a_radial =  (omega2*omega2).*vec_a;
Acc_a_radial = -Acc_a_radial;
% Acc_a_tangential = alpha2.*vec_a;
basic_z = [0;0;1];

vect_n = cross(Acc_a_radial,basic_z);
unitvect_n = vect_n / norm(Acc_a_radial) ;
unitvect_n = -unitvect_n;

Acc_a_tangential = unitvect_n .* (alpha2.*vec_a);

% Net_acc_a = Acc_a_radial + Acc_a_tangential ;

vec_b = [Bx-Ax;By-Ay;0];
Acc_b_radial = (omega3*omega3).*vec_b;
Acc_b_radial = -Acc_b_radial;



figure;
plot([0 Acc_a_radial(1)],[0 Acc_a_radial(2)],'blue');
hold on ; 
plot([Acc_a_radial(1), Acc_a_radial(1) - Acc_a_tangential(1)], ...
     [Acc_a_radial(2), Acc_a_radial(2) - Acc_a_tangential(2)], 'red');
hold on ; 
plot([Acc_a_radial(1) - Acc_a_tangential(1)  0], ...
     [Acc_a_radial(2) - Acc_a_tangential(2)  0], 'black');
% hold on ;

% plot([Acc_a_radial(1) - Acc_a_tangential(1)  Acc_a_radial(1) - Acc_a_tangential(1) + Acc_b_radial(1)], ...
     %[Acc_a_radial(2) - Acc_a_tangential(2)  Acc_a_radial(2) - Acc_a_tangential(2) + Acc_b_radial(2)], 'black','--');
hold off

% axis([-20 20 -20 20]);
axis square;
drawnow ;



