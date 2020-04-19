% Example 3.4
clear all
close all

figure
hold on

% set the time span
tspan = [0, 100];
% set the relative error
reltol = 1e-8;
% generate ODE solving options
opts = odeset('RelTol',reltol);

% set a range of initial conditions ptheta0
ic=[1;0;0;0.5];


% solve the ODE
% k is the size of the non-symmetric part
k = 0;
[t,y] = ode45(@(t,y) odefun(t,y,k), tspan, ic, opts);
% extract r and theta from solution
r = y(:,1);
theta = y(:,2);

% plot the trajectory in x=r cos(theta) and y=r sin(theta)
plot(r.*cos(theta),r.*sin(theta));

xlabel('x');
ylabel('y');

% plot the position of the sun
hold on
plot([0],[0],'ro');
axis equal


figure
% now let us repeat the case for non-symmetric potential
% set the time span
tspan = [0, 100];
% set the relative error (let us make it lower)
reltol = 1e-9;
% generate ODE solving options
opts = odeset('RelTol',reltol);
% solve the ODE
% k is the size of the non-symmetric part
k = 0.1;
[t,y] = ode45(@(t,y) odefun(t,y,k), tspan, ic, opts);
% extract r and theta from solution
r = y(:,1);
theta = y(:,2);

% plot the trajectory in x=r cos(theta) and y=r sin(theta)
plot(r.*cos(theta),r.*sin(theta));

xlabel('x');
ylabel('y');

% plot the position of the sun
hold on
plot([0],[0],'ro');
axis equal
