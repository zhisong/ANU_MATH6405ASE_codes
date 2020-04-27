% Example 3.5
% Note: it takes a few minutes to complete a run
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

% At q1=q2=0, what is the allowed range of p1?

% the min and max allowed p1 at q1=q2=0
p1max = sqrt(2 * (H0 + k));
p1min = -p1max;


% If we calculate using min and max p1, we will run into trouble, so we
% move them slightly
p1max = 0.99 * p1max;
p1min = 0.99 * p1min;

% the list of p1
p1list = linspace(p1min,p1max,np1);

% create an array to store results
p1plot = zeros(1,nppts+1);
q1plot = zeros(1,nppts+1);

for i = 1:numel(p1list)

    % the initial p1
    p10 = p1list(i);
    % the initial p2, what is the value of p20 that gives
    % H(0,0,p10,p20)=H0?
    % we also want dq2/dt > 0;
    p20 = sqrt(2 * (H0 + k) - p10.^2);
    
    % set a range of initial conditions [t1,t2,p1,p2]
    ic=[0;0;p10;p20];

    q1plot(1) = 0;
    p1plot(1) = p10;
    
    % solve the ODE nppts times
    
    for j = 1:nppts

        [t,y,te,ye,ie] = ode45(@(t,y) shpodefun(t,y,k), tspan, ic, opts);
        
        id = 1;
        
        % extract the solution
        q1 = ye(id,1);
        q2 = ye(id,2);
        p1 = ye(id,3);
        p2 = ye(id,4);
        
        q1plot(j+1) = mod(q1,2*pi);
        p1plot(j+1) = p1;
        
        ic = [q1;0;p1;p2];
        
    end
    
    scatter(q1plot,p1plot,'.');
    
end

xlabel('q_1');
ylabel('p_1');
xlim([0,2*pi]);
        

