function [plist, rlist] = get_R_from_poincare_plot_stdmap(k,pmin,pmax,np,nppts)

% the number of ps we hope to explore is np
% the number of times for each orbit is nppts

pmin2 = min(pmin,pmax);
pmax2 = max(pmin,pmax);

pmax = pmax2;
pmin = pmin2;

% the list of p
plist = linspace(pmin,pmax,np);

% the estimated rotation number
rlist = zeros(size(plist));

% create an array to store results
pplot = zeros(1,nppts+1);
qplot = zeros(1,nppts+1);

for i = 1:numel(plist)
    p = plist(i);
    q = pi;
    
    qpin = [q;p];
    
    pplot(1) = p;
    qplot(1) = q;
    
    for j = 1:nppts
        [qpout,jac] = stdmap(qpin,k);
        qpin = qpout;
    end
    
    % the approximated rotation number
    rlist(i) = (qpout(1)-pi)/nppts/(2*pi);
end

end

