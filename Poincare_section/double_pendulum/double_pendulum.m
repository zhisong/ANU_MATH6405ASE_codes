% Example 3.6
clear all
close all

figure
hold on

% set the parameters of our pendulum
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
g = 9.8;

% set the time span
tspan = [0, 10];
% here we set both error
reltol = 1e-9;
abstol = 1e-9;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol);

% set initial conditions [t1,t2,p1,p2]
ic=[pi/2;pi/2;0;0];


% solve the ODE

[t,y] = ode45(@(t,y) DPodefun(t,y,m1,m2,l1,l2,g), tspan, ic, opts);
% extract the solution
t1 = y(:,1);
t2 = y(:,2);
p1 = y(:,3);
p2 = y(:,4);

% the trajectory of the first mass
x1 = l1 * sin(t1);
y1 = - l1 * cos(t1);
% the trajectory of the second mass
x2 = x1 + l2 * sin(t2);
y2 = y1 - l1 * cos(t2);


plot(x1,y1,'r');
hold on
plot(x2,y2,'b');

%plot the pivot
plot([0],[0],'ko');

ylim([-2.5,2]);


xlabel('x');
ylabel('y');

axis equal

% check how well the energy is conserved and see if the relative error is sufficiently small
H = DPHamiltonian(t1,t2,p1,p2,m1,m2,l1,l2,g);
% initial
H0 = DPHamiltonian(t1(1),t2(1),p1(1),p2(1),m1,m2,l1,l2,g);
figure
plot(t,H-H0);
xlabel('t');
ylabel('\Delta H');
