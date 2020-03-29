% Example 2.3
clear all
close all

% part 1, the trajectory

figure

% set the time span
tspan = [0, 10*pi];
% set the initial condition
ic = [1;0];
% set the relative error
reltol = 1e-1;
% generate ODE solving options
opts = odeset('RelTol',reltol);
% solve the ODE
[t,y] = ode45(@(t,y) odefun(t,y), tspan, ic, opts);
% extract q and p from solution
q = y(:,1);
p = y(:,2);

% plot the trajectory
plot(q,p);

% generate the exact solution
t = linspace(0,2*pi,1001);
hold on
plot(cos(t), -sin(t));

xlabel('q');
ylabel('p');
legend('numerical solution', 'exact solution')

% part 2, energy conservation

clear all

% time span
tspan = [0 10000];
% initial condition
ic = [1;0];

% a list of relative errors we what to investigate
reltol = [1e-3, 1e-4, 1e-5, 1e-6];

figure
hold on

% investigate a list of relative error
for i = 1:numel(reltol)
    % set the option for ode45
    opts = odeset('RelTol',reltol(i));
    % solve the ODE using ode45
    [t,y] = ode45(@(t,y) odefun(t,y), tspan, ic, opts);

    % extract the solution
    q = y(:,1);
    p = y(:,2);
    
    % compute the energy H
    eng = 0.5*(q.^2 + p.^2);

    % plot it
    plot(t,eng);
end

xlabel('t');
ylabel('H');
legend(num2str(reltol'));

