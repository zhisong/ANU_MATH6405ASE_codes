% Example 6.5

clear all
close all

% set the perturbation parameter k
k = 0.9718;

% estimate the rotation number for each p starting from q = pi
[plist, rlist] = get_R_from_poincare_plot_stdmap(k,0,2*pi,100,1000);

% the irrational rotation number - inverse of golden ratio
omega = 1/((1 + sqrt(5))/ 2);

% constructing its continued fraction expansion using fibonacci

n = 0:12;
ri = fibonacci(n);
n = 1:13;
si = fibonacci(n);

RG = zeros(size(ri));
f = zeros(size(si));

% set our target absolute error of the solution
abserr = 1e-10;
% set the maximum number of iterations
niter = 100;

% we start from 
istart = 4;

% find the fixed points for i=istart
i = istart;

r = ri(i);
s = si(i);

% estimate the staring point
[startp] = estimate_start_point(plist, rlist, r/s);

% use the newton method to find fixed point with rotation number r/s
qpguess = [pi; startp];
[qp, qphis, issuccess, jac] = newton_method(qpguess, k, r, s, abserr, niter);

% compute Greene's residue and the mean residue
RG(i) = (2 - trace(jac))  / 4;
f(i) = nthroot((4 * abs(RG(i))), s);

disp(strcat('r/s=',num2str(r),'/',num2str(s), ',RG=',num2str(RG(i)),',f=',num2str(f(i))));

% do the same for i=istart+1
i = i+1;

r = ri(i);
s = si(i);

% guess a p to start from our list
[startp] = estimate_start_point(plist, rlist, r/s);
qpguess = [pi; startp];
[qp2, qphis, issuccess, jac] = newton_method(qpguess, k, r, s, abserr, niter);

RG(i) = (2 - trace(jac))  / 4;
f(i) = nthroot((4 * abs(RG(i))), s);

disp(strcat('r/s=',num2str(r),'/',num2str(s), ',RG=',num2str(RG(i)),',f=',num2str(f(i))));

for i = istart+2:numel(ri)
    r = ri(i);
    s = si(i);
    % calculate the approximate rotation number between the last two fixed
    % points found
    %[plist, rlist] = get_R_from_poincare_plot_stdmap(k,qp(2),qp2(2),100,3000);
    % estimate the new starting point
    %[startp] = estimate_start_point(plist, rlist, r/s);
    qpguess = qp2;
    [qp3, qphis, issuccess, jac] = newton_method(qpguess, k, r, s, abserr, niter);
    
    if (issuccess == 0)
        disp(strcat('cannot find fixed point for r/s=',num2str(r),'/',num2str(s)));
    end

    RG(i) = (2 - trace(jac))  / 4;
    f(i) = nthroot((4 * abs(RG(i))), s);
    disp(strcat('r/s=',num2str(r),'/',num2str(s), ',RG=',num2str(RG(i)),',f=',num2str(f(i))));
    %disp(strcat('$',num2str(r),'/',num2str(s), '$ & $',num2str(RG(i)),'$ & $',num2str(f(i)), '$'));
    
    % keep only the newest two fixed points
    qp = qp2;
    qp2 = qp3;
end