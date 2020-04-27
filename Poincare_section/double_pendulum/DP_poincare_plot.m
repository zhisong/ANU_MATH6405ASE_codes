% Example 3.6
% Note: it takes a few minutes to complete a run
clear all
close all

figure
hold on

% the number of p2s we hope to explore
np2 = 50;
% the number of times for each orbit
nppts = 1000;

% set the parameters of our pendulum
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
g = 9.8;

% set the time span
tspan = [0, 50];
% here we set both error
reltol = 1e-9;
abstol = 1e-9;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol,'Events', @DPEventsFcn);

% The value of H if the pendulum is at rest, the lowest allowed H of the
% system
Hmin = DPHamiltonian(0,0,0,0,m1,m2,l1,l2,g);

% The fixed value of Hamiltonian we are looking at
Hfixed = Hmin + 15;

% the min and max allowed p2
p2max = sqrt(2*(Hfixed - Hmin)*(l1^2*l2^2*m2*m1)/(m1*l1^2));
p2min = -p2max;

% If we calculate using min and max p2, we will run into trouble, so we
% move them slightly
p2max = 0.99 * p2max;
p2min = 0.99 * p2min;

% the list of p2
p2list = linspace(p2min,p2max,np2);

% create an array to store results
p2plot = zeros(1,nppts+1);
t2plot = zeros(1,nppts+1);

for i = 1:numel(p2list)

    % the initial p2
    p20 = p2list(i);
    % the initial p1
    p10 = (sqrt(2*(Hfixed - DPHamiltonian(0,0,p20,p20,m1,m2,l1,l2,g))*(l1^2*l2^2*m2*m1)/m2)+l1*p20)/l2;
    
    % set a range of initial conditions [t1,t2,p1,p2]
    ic=[0;0;p10;p20];
    
    % is dt1/dt > 0? yes, continue; no, switch to another root
    dydt = DPodefun(0,ic,m1,m2,l1,l2,g);
    if (dydt(1) <= 0)
        p10 = (-sqrt(2*(Hfixed - DPHamiltonian(0,0,p20,p20,m1,m2,l1,l2,g))*(l1^2*l2^2*m2*m1)/m2)+l1*p20)/l2;
        ic=[0;0;p10;p20];
    end
    
    p2plot(1) = p20;
    t2plot(1) = 0;

    % solve the ODE nppts times
    
    for j = 1:nppts

        [t,y,te,ye,ie] = ode45(@(t,y) DPodefun(t,y,m1,m2,l1,l2,g), tspan, ic, opts);
        
        id = 2;
        
        % extract the solution
        t1 = ye(id,1);
        t2 = ye(id,2);
        p1 = ye(id,3);
        p2 = ye(id,4);
        
        t2plot(j+1) = mod(t2+pi,2*pi)-pi;
        p2plot(j+1) = p2;
        
        ic = [0;t2;p1;p2];
        
    end
    
    scatter(t2plot,p2plot,'.');
    
end

xlabel('\theta_2');
ylabel('p_{2}');
        

