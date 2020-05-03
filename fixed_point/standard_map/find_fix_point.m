% Example 4.1, 4.2

clear all
close all

figure
hold on

% set the perturbation parameter k
k = 1.0;

% we put the poincare plot as the background of our figure
poincare_plot_stdmap(k,50,1000);

% set our target absolute error of the solution
abserr = 1e-9;
% set the maximum number of iterations
niter = 100;

% find the fixed point with rotation number 2/3

% (1) initial guess q0 = 0, p0 = 2/3 * 2 pi

disp('initial guess q0 = 2 pi, p0 = 2/3 * 2 pi');

qpguess = [2*pi; 4*pi/3];
[qp, qphis, issuccess, jac] = newton_method(qpguess, k, 2, 3, abserr, niter);

% obtain P(x), P^2(x)
[qp1,jac1] = stdmap(qp,k);
[qp2,jac2] = stdmap(qp1,k);

% put them in an array
qpplot = [mod(qp,2*pi) mod(qp1,2*pi) mod(qp2,2*pi) qp];

% output to the screen
qp
disp('eigenvalues')
eig(jac)

% plot the history of the Newton's method
plot(qphis(1,:), qphis(2,:), 'b-x');
% plot the final result
plot(qpplot(1,:) ,qpplot(2,:),'bo');

% (2) initial guess q0 = pi, p0 = 2/3 * 2 pi

disp('initial guess q0 = pi, p0 = 2/3 * 2 pi');

qpguess = [pi; 4*pi/3];
[qp, qphis, issuccess,jac] = newton_method(qpguess, k, 2, 3, abserr, niter);

% obtain P(x), P^2(x)
[qp1,jac1] = stdmap(qp,k);
[qp2,jac2] = stdmap(qp1,k);

% put them in an array
qpplot = [mod(qp,2*pi) mod(qp1,2*pi) mod(qp2,2*pi)];

% output to the screen
qp
disp('eigenvalues')
eig(jac)

% plot the history of the Newton's method
plot(qphis(1,:), qphis(2,:), 'r-x');
% plot the final result
plot(qpplot(1,:) ,qpplot(2,:),'ro');


xlabel('Q');
ylabel('P');
xlim([0,2*pi]);
ylim([3,5]);