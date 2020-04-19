% Example 3.3
clear all
close all

figure
hold on

% set the time span
tspan = [0, 1000*pi];
% set the relative error
reltol = 1e-9;
% generate ODE solving options
opts = odeset('RelTol',reltol, 'Events', @myEventsFcn);

% generate a list of inital values
plist = linspace(0,2,1000);
plist = plist(2:end-1);

% generate a empty array to store the data
T = zeros(size(plist));

for i = 1:numel(plist)
    % set a range of initial conditions ptheta0
    ptheta0 = plist(i);
    theta0 = 0;
    ic=[theta0;ptheta0];

    % solve the ODE
    k = 1;
    [t,y,te,ye,ie] = ode45(@(t,y) odefun(t,y,k), tspan, ic, opts);
    
    % store the period
    T(i) = te(2);
    
end

% frequency
omega = 2*pi./T;

% we know the data for the p0=0 and p0=2, let us append them
plist = [0 plist 2];
H0 = plist.^2/2 - 1;
omega = [1 omega 0];

plot(H0, omega);

xlabel('H_0');
ylabel('\omega');

