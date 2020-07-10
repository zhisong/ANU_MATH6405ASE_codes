% what is the rotation number of the last standing KAM surface?
% in our problem, it is not 1/phi, where phi=(sqrt(5)+1)/2
% I've tested a few candidate and find it is [0,1,1,3,1,1,..]
%
% A simple way (in this file) goes like:
% 1. guess a candidate rotation number, compute the critical k
% 2. plot the Poincare plot, see if there are still KAM surfaces
% 3. if there is, estimate its rotation nubmer, put it as the new guess,
%    repeat 1 and 2 until satisfactory
% This simply method is only for a rough estimate, since it is hard to tell
% which rotation number will last until the end, except it is a nobel
% number.
%
% A better way to explore more rotation numbers is detailed in the paper
% J.M. Greene, R.S. Mackay, and J. Stark, Phys. D Nonlinear Phenom. 21, 267 (1986).
% This method uses a Farey tree search for all the noble numbers and estimate
% their existence using "Mackay residue" (an improvement for the Greene
% one).
% This method will explore more rotation numbers, but still it is possible
% to miss some of them as it only estimate their KAM existence from a few
% term in the continued fraction expansion.
% 
% Finaly, there is the converse KAM method
% R.S. MacKay and I.C. Percival, Commun. Math. Phys. 98, 469 (1985).
% This method goes reversely from higher k to lower k. It can give a upper
% bound of critical k.
%
% All the above methods have their pros and cons. This question is still an
% active research topic.

[pp,qq] = from_continued_fraction([0,1,1,3,1,1,1,1]);

pp1 = pp(end);
qq1 = qq(end);

% we guess the location of the fixed point for k=0
qpguess = [0;pp1/qq1];

% here we start from very small perturbation, and gradually increase it
% we use the fixed points for lower k to initialize those of higher k
klist = linspace(0.00001,0.0025,300);

% store the history of trace of J as we increase k
traceJ = zeros(size(klist));

qp = qpguess;
for i = 1:numel(klist)
    [qp, qphis, issuccess, jac] = newton_method(qp, klist(i), pp1, qq1, 1e-9, 100);
    traceJ(i) = trace(jac);
    
    if (issuccess == 0)
        disp('failed')
        klist(i);
    end

end

figure
plot(klist, ((2-traceJ)).^(1/qq1));
xlabel('k');
ylabel('R_G');
