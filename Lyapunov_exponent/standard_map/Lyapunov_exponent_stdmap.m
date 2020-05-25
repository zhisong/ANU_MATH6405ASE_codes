% Example 7.1

clear all
close all

figure
hold on

% set the perturbation parameter k
k = 1.0;

% we put the poincare plot as the background of our figure
poincare_plot_stdmap(k,50,1000);

xlim([0,2 * pi]);
ylim([0,2 * pi]);
xlabel('Q');
ylabel('P');

% initial q and p
qp0 = [pi; pi+0.1];

% plot it on the poincare plot
plot(qp0(1),qp0(2),'ro', 'MarkerSize',10,'MarkerFaceColor','r');

% initial delta q and delta p
dqp0 = [1;0];

% normalization after M iterations
M = 10;

% the total number of normalization N, total number of iterations n=MN
N = 50000;

% array to store di
di = ones([1,N+1]);
% array to store the approximate exponent at each normalization
lambda = ones([1,N+1]);

% first normalization, in case ||dqp|| neq 1
di(1) = sqrt(sum(dqp0.^2));
lambda(1) = di(1);

% set initial condition
dqp = dqp0/di(1);
qp = qp0;

% outer loop, normalization
for i = 1:N
    
    % inner loop, for each normalization iterate the map M times
    for j = 1:M
        [qpnew, jac] = stdmap(qp,k);
        
        dqp = jac * dqp;
        qp = qpnew;
    end
    
    % compute normalization factor
    di(i+1) = sqrt(sum(dqp.^2));
    lambda(i+1) = sum(log(di(1:i+1))) / (i * M);
    % normalize
    dqp = dqp / di(i+1);
    
end

figure
loglog(lambda(2:end));
xlabel('N');
ylabel('\lambda');