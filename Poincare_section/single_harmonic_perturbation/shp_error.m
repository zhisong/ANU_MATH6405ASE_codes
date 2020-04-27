% Example 3.5
% See how much H decays for our choice of relative error
clear all
close all

figure
hold on

% the number of p1s we hope to explore
np1 = 50;
% the number of times for each orbit
nppts = 1000;

% set the parameter k
k = 0.1;

% set the time span (maximum integration time)
tspan = [0, 100];
% here we set both error
reltol = 1e-8;
abstol = 1e-8;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol,'Events', @shpEventsFcn);

% The value of H we are interested in
H0 = 1;
% test p_1 = 0.3
p10 = 0.3;
p20 = sqrt(2 * (H0 + k) - p10.^2);

% set a range of initial conditions [t1,t2,p1,p2]
ic=[0;0;p10;p20];

% create an array to store results
Hplot = zeros(1,nppts+1);

Hplot(1) = shpHamiltonian(0,0,p10,p20,k) - H0;

% solve the ODE nppts times

for j = 1:nppts

    [t,y,te,ye,ie] = ode45(@(t,y) shpodefun(t,y,k), tspan, ic, opts);

    id = 1;

    % extract the solution
    q1 = ye(id,1);
    q2 = ye(id,2);
    p1 = ye(id,3);
    p2 = ye(id,4);

    Hplot(j+1) = shpHamiltonian(q1,q2,p1,p2,k) - H0;

    ic = [q1;0;p1;p2];

end

plot(Hplot);
xlabel('n');
ylabel('\Delta H');
    