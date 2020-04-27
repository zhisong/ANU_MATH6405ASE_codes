function [qnew,pnew] = stdmap(qold,pold,k)
pnew = pold + k * sin(qold);
qnew = qold + pnew;
end

