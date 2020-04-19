% Example 3.3
clear all
close all

figure
hold on

% set the time span
tspan = [0, 100*pi];
% set the relative error
reltol = 1e-8;
% generate ODE solving options
opts = odeset('RelTol',reltol);

for i = -16:16
    % set a range of initial conditions ptheta0
    ptheta0 = 4 / 16 * i;
    theta0 = 0;
    ic=[theta0;ptheta0];
 

    % solve the ODE
    k = 1;
    [t,y] = ode45(@(t,y) odefun(t,y,k), tspan, ic, opts);
    % extract q and p from solution
    theta = y(:,1);
    theta = mod(theta+pi, 2 * pi)-pi;
    ptheta = y(:,2);

    % plot the trajectory
    plot(theta,ptheta,'.');

end

xlim([-pi,pi]);

xlabel('\theta');
ylabel('p_\theta');