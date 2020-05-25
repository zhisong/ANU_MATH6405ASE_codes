% Example 7.2
clear all
%close all

figure

% set the parameters of our pendulum
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
g = 9.8;

% set the time span
tspan = [0, 1];
% here we set both error
reltol = 1e-13;
abstol = 1e-13;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol);

% set initial conditions [t1,t2,p1,p2,dt1,dt2,dp1,dp2]
ic=[pi/2;pi/2;0;0;0;0;0;1];

% interval for normalization
tau = 1;
% the number of normalizations
N = 100;

% di and lambda
di = zeros([0,N+1]);
lambda = di;

di(1) = 1;
lambda(1) = di(1)/tau;

% solve the ODE N times
for i = 1:N

    [t,y] = ode45(@(t,y) DPodefun(t,y,m1,m2,l1,l2,g), tspan, ic, opts);
    % extract dy
    dy = y(end,5:8);
    % compute di
    di(i+1) = sqrt(sum(dy.^2));
    lambda(i+1) = sum(log(di(1:i+1)))/(i*tau);
    
    ic = y(end,:);
    ic(5:8) = ic(5:8)/di(i+1);

end

plot(lambda(2:end));
xlabel('N');
ylabel('\lambda');


figure
ic=[pi/2;pi/2;0;0;0;0;0;1];
[t1,y1] = ode45(@(t,y) DPodefun(t,y,m1,m2,l1,l2,g), [0,20], ic, opts);
ic=[pi/2;pi/2;0;0.00001;0;0;0;1];
[t2,y2] = ode45(@(t,y) DPodefun(t,y,m1,m2,l1,l2,g), [0,20], ic, opts);

plot(t1,y1(:,4),'b-',t2,y2(:,4),'r--');
ylabel('\theta_2');
xlabel('t');

