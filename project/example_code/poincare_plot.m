figure
hold on

% the number of p1s we hope to explore
np1 = 50;
% the number of times for each orbit
nppts = 1000;

% set the parameter k
k = 0.00204;

% the min and max p1 

p1max = 0.75;
p1min = 0.4;

% the list of p1
p1list = linspace(p1min,p1max,np1);

% create an array to store results
p1plot = zeros(1,nppts+1);
q1plot = zeros(1,nppts+1);

for i = 1:numel(p1list)

    % the initial p1
    p10 = p1list(i);
    % the initial p2, whatever it is, it does not affect anything
    
    % set a range of initial conditions [t1,t2,p1,p2]
    ic=[2/5*pi;p10];

    q1plot(1) = 0;
    p1plot(1) = p10;
    
    % solve the ODE nppts times
    
    for j = 1:nppts

        qp = solve_ivp(ic, 2 * pi, k);
        
        
        % extract the solution
        q1 = qp(1);
        p1 = qp(2);
        
        q1plot(j+1) = mod(q1,2*pi);
        p1plot(j+1) = p1;
        
        ic = [q1;p1];
        
    end
    
    scatter(q1plot,p1plot,'.');
    
end

xlabel('q_1');
ylabel('p_1');
xlim([0,2*pi]);
        

