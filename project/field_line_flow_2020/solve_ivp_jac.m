function [qp, jac] = solve_ivp_jac(qp0, tend, k)
% solve the initial value problem given the initial value qp0 for t from 0
% to tend, also construct the jacobian

% set the time span (for each poincare iteration, we need to move t=2pi)
tspan = [0, tend];
% here we set both error
reltol = 1e-10;
abstol = 1e-10;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol);

ic = [qp0(1);qp0(2);1.0;0.0;0.0;1.0];

[t,y] = ode45(@(t,y) odefun_tangent(t,y,k), tspan, ic, opts);
        
        
% extract the solution
q1 = y(end,1);
p1 = y(end,2);

qp = [q1;p1];

jac = eye(2);

jac(1,1) = y(end,3);
jac(2,1) = y(end,4);
jac(1,2) = y(end,5);
jac(2,2) = y(end,6);

end

