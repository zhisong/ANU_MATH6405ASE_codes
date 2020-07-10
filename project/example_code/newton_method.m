function [qp, qphis, issuccess, jac] = newton_method(qpguess, k, m, n, abserr, niter)
% Inputs
% qpgues - initial guess
% k      - the standard map parameter
% m,n    - rotation number m/n
% abserr - target absolute error
% niter  - the maximum number of iterations
% Outputs
% qp     - the solution
% qphis  - the history of solution
% issuccess - if successfully find the solution (1) or not (0)

% the first element of qpguess is q, second element is p

% put the initial guess as the current guess of q0 and p0
qp0 = qpguess;
% store it in history
qphis = qpguess;

% we set the success flag to 0 (not successful) first
issuccess = 0;

% run the Newton's method iteration maximum niter times
for i = 1:niter
    
    % set qi and pi, zeroth step, qi=q0, pi=p0
    qpi = qp0;
  
        
   [qpi, jac] = solve_ivp_jac(qpi, 2*pi*n, k);
        
    
    % calculate the target function for the Newton's method
    % the first element of qpguess is q, second element is p
    f1 = qpi(1) - qp0(1) - m * 2 * pi;
    f2 = qpi(2) - qp0(2);
    
    % is the accuracy already good enough? We set the error as the
    % Euclidean norm here
    err = sqrt(f1^2 + f2^2);
    
    % if we have met our target, we've found our solution, exit the main loop
    if (err < abserr)
        issuccess = 1;
        break
    end
    
    % if not yet, compute the next guess
    
    % The Hessian should be the jacobian multiplied together minus identity
    % matrix
    H = jac - eye(2);
    
    % the Newton's method
    qp0_next = qp0 - inv(H) * [f1;f2];
    
    % update qp_0 and put it into history
    qp0 = qp0_next;
    qphis = [qphis qp0];
    
end

% set the output
qp = qp0;

% if we exit the main loop with the solution found, issuccess will be 1,
% otherwise if niter iterations are done and still nothing found, issuccess
% will be 0
