clear
close all

figure

tspan = [0, 4];
ic = [1;0];
reltol = 1e-1;
opts = odeset('RelTol',reltol);
[t,y] = ode45(@(t,y) odefun(t,y), tspan, ic, opts);
q = y(:,1);
p = y(:,2);

plot(q,p);


tspan = [0 10000];
ic = [1;0];

reltol = [1e-3, 1e-4, 1e-5, 1e-6];

figure
hold on

for i = 1:numel(reltol)
    opts = odeset('RelTol',reltol(i));
    [t,y] = ode45(@(t,y) odefun(t,y), tspan, ic, opts);

    q = y(:,1);
    p = y(:,2);
    eng = 0.5*(q.^2 + p.^2);

    plot(t,eng);
end

xlabel('t');
ylabel('H');
legend(num2str(reltol'));

