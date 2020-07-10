function [qp] = solve_ivp(qp0, tend, k)
% solve the initial value problem given the initial value qp0 for t from 0
% to tend

% set the time span (for each poincare iteration, we need to move t=2pi)
tspan = [0, tend];
% here we set both error
reltol = 1e-10;
abstol = 1e-10;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol);

[t,y] = ode45(@(t,y) odefun(t,y,k), tspan, qp0, opts);
        
        
% extract the solution
q1 = y(end,1);
p1 = y(end,2);

qp = [q1;p1];

end

