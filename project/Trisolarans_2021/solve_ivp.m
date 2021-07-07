function [t,x,y,px,py] = solve_ivp(qp0, tend, k)
% solve the initial value problem given the initial value qp0 for t from 0
% to tend

% set the time span (for each poincare iteration, we need to move t=2pi)
tspan = [0, tend];
% here we set both error
reltol = 1e-9;
abstol = 1e-9;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol);
opts = odeset('RelTol',reltol);

[t,u] = ode15s(@(t,u) odefun(t,u,k), tspan, qp0, opts);
        
        
% extract the solution
x = u(:,1);
y = u(:,2);
px = u(:,3);
py = u(:,4);


end