function dydt = odefun(t,y)
q = y(1);
p = y(2);
dydt = [p; -q];
end
% function dydt = odefun(t,y,ft,f,gt,g)
% f = interp1(ft,f,t); % Interpolate the data set (ft,f) at time t
% g = interp1(gt,g,t); % Interpolate the data set (gt,g) at time t
% dydt = [-f.*y(1) + g;0]; % Evaluate ODE at time t