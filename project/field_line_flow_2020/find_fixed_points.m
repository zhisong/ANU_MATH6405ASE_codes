
clc
clear all
close all

k=0.0015;

% for 3/5 fixed point, the first set
disp('Rotation number 3/5, first set of fixed point');
qpguess = [0;3/5];
[qp, qphis, issuccess, jac] = newton_method(qpguess, k, 3, 5, 1e-7, 100);
qp
disp('Tr(J)')
trace(jac)
if (abs(trace(jac))<2)
    disp('elliptic')
else
    disp('hyperbolic')
end

% plot it for a range of k

figure

klist = linspace(0.001,0.005,20);
traceJ = zeros(size(klist));
qp = qpguess;
for i = 1:numel(klist)
    [qp, qphis, issuccess, jac] = newton_method(qp, klist(i), 3, 5, 1e-7, 100);
    traceJ(i) = trace(jac);
end

plot(klist, traceJ);
hold on


% the second set
disp('Rotation number 3/5, second set of fixed point');
qpguess = [3/5*pi;3/5];
[qp, qphis, issuccess, jac] = newton_method(qpguess, k, 3, 5, 1e-7, 100);
qp
disp('Tr(J)')
trace(jac)
if (abs(trace(jac))<2)
    disp('elliptic')
else
    disp('hyperbolic')
end

% plot trace J for a range of k
klist = linspace(0.001,0.005,20);
traceJ = zeros(size(klist));
qp = qpguess;
for i = 1:numel(klist)
    [qp, qphis, issuccess, jac] = newton_method(qp, klist(i), 3, 5, 1e-7, 100);
    traceJ(i) = trace(jac);
end

plot(klist, traceJ);

xlabel('k');
ylabel('Tr(J)');
legend('first set', 'second set');
title('Stability of fixed points with rotation number 3/5');

% for 5/8 fixed point, the first set
disp('Rotation number 5/8, first set of fixed point');
qpguess = [0;5/8];
[qp, qphis, issuccess, jac] = newton_method(qpguess, k, 5, 8, 1e-7, 100);
qp
disp('Tr(J)')
trace(jac)
if (abs(trace(jac))<2)
    disp('elliptic')
else
    disp('hyperbolic')
end

% plot it for a range of k

figure

klist = linspace(0.001,0.003,20);
traceJ = zeros(size(klist));
qp = qpguess;
for i = 1:numel(klist)
    [qp, qphis, issuccess, jac] = newton_method(qp, klist(i), 5, 8, 1e-7, 100);
    traceJ(i) = trace(jac);
end

plot(klist, traceJ);
hold on

% the second set
disp('Rotation number 5/8, second set of fixed point');
qpguess = [5/8*pi;5/8];
[qp, qphis, issuccess, jac] = newton_method(qpguess, k, 5, 8, 1e-7, 100);
qp
disp('Tr(J)')
trace(jac)
if (abs(trace(jac))<2)
    disp('elliptic')
else
    disp('hyperbolic')
end

% plot trace J for a range of k
klist = linspace(0.001,0.003,20);
traceJ = zeros(size(klist));
qp = qpguess;
for i = 1:numel(klist)
    [qp, qphis, issuccess, jac] = newton_method(qp, klist(i), 5, 8, 1e-7, 100);
    traceJ(i) = trace(jac);
end

plot(klist, traceJ);

xlabel('k');
ylabel('Tr(J)');
legend('first set', 'second set');
title('Stability of fixed points with rotation number 5/8');