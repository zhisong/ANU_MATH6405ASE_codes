% Example 2.1
% clean all the variables
clear
close all

% plot the exact solution
figure;
t1 = linspace(0,pi/3,1025);
plot(t1, sin(t1));
xlabel('t');
ylabel('y');
hold on

% the number of intervals
n = [2,4,8];
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
    
    % the Euler method, total n(j) steps to reach t=pi/2
    for i = 1:n(j)
        % the time for each time step
        t(i+1) = t(i) + dt;
        % the 
        y(i+1) = y(i) + sqrt(1-y(i)^2) * dt;
    end
    
    % add the plot
    plot(t, y);

end

legend('exact','\Delta t=\pi/6','\Delta t=\pi/12', '\Delta t=\pi/24');

hold off
    
