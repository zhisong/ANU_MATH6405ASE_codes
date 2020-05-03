function poincare_plot_stdmap(k,np,nppts)

% the number of ps we hope to explore is np
% the number of times for each orbit is nppts

pmax = 2*pi;
pmin = 0;

% the list of p
plist = linspace(pmin,pmax,np);

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
        q = mod(qpout(1), 2*pi);
        p = qpout(2);
        qplot(j+1) = q;
        pplot(j+1) = p;
        qpin = [q;p];
    end
    
    scatter(qplot,pplot,'.')
end

end

