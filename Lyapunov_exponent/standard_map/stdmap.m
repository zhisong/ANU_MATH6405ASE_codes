function [qpnew, jac] = stdmap(qpold,k)

qold = qpold(1);
pold = qpold(2);

pnew = pold + k * sin(qold);
qnew = qold + pnew;

jac = [1+k*cos(qold), 1; k*cos(qold), 1];

qpnew = [qnew;pnew];
end

