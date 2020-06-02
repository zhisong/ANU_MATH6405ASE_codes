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

% WE ONLY NEED THE 'o' points for Greene's residue
% all the o points are located at q=pi
% we can choose to iterate only on p and keep q=pi fixed (iterate 1
% variable p)
% Keep only one equation f_1, drop f_2,
% the Hessian only have df1/dp_0

% the first element of qpguess is q, second element is p

% put the initial guess as the current guess of q0 and p0
qp0 = qpguess;
% store it in history
qphis = qpguess;

% we set the success flag to 0 (not successful) first
issuccess = 0;

% run the Newton's method iteration maximum niter times
for i = 1:niter
    
    % let jac be the identity matrix
    jac = eye(2);
    
    % set qi and pi, zeroth step, qi=q0, pi=p0
    qpi = qp0;
    
    % iterate the standard map for n times
    for j = 1:n
        
        % get q_i+1 and p_i+1 and jacobian from stdmap
        [qpi, J] = stdmap(qpi, k);
        % the jacobian should multiply together
        jac = J * jac;
        
    end
    
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
    qp0_next(2) = qp0(2) - f1 / H(1,2);
    
    % update qp_0 and put it into history
    qp0(2) = qp0_next(2);
    qphis = [qphis qp0];
    
end

% set the output
qp = qp0;

% if we exit the main loop with the solution found, issuccess will be 1,
% otherwise if niter iterations are done and still nothing found, issuccess
% will be 0
