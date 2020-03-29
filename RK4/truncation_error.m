% Example 2.2
% clean all the variables
clear
close all

% the number of intervals
n = [2,4,8,16,32,64,128,256,512,1024];
% the list of Delta t we want to explore
Deltat = 1 ./n * pi / 3;

% for each precision
for j = 1:numel(n)
    
    % clean the variables
    
    % set up the initial condition
    y0 = 0;
    t0 = 0;
    
    y(1) = y0;
    t(1) = t0;
    
    % the time step
    dt = Deltat(j);
    
    % RK4, total n(j) steps to reach t=pi/2
    for i = 1:n(j)
        % the time for each time step
        t(i+1) = t(i) + dt;
        
        % compute all the mid steps
        k1 = sqrt(1-y(i)^2) * dt;
        k2 = sqrt(1-(y(i)+k1/2)^2) * dt;
        k3 = sqrt(1-(y(i)+k2/2)^2) * dt;
        k4 = sqrt(1-(y(i)+k3)^2) * dt;
        
        % sum up
        y(i+1) = y(i) + 1/6*(k1+2*k2+2*k3+k4);
    end
    
    % compute the maximum absolute error between the numerical solution and the
    % exact solution
    error(j) = max(abs(y-sin(t)));
end

% make a plot

figure;
loglog(1./Deltat, error, 'x');
xlabel('1/\Delta t');
ylabel('Error');

% make the asymtotic line
hold on
asym = 0.03 * Deltat.^4;
loglog(1./Deltat, asym,'--');

legend('Error','0.03 \Delta t^4');

    
    
