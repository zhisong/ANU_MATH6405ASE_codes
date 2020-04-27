% Example 3.7

clear all
close all

figure
hold on

% the number of ps we hope to explore
np = 50;
% the number of times for each orbit
nppts = 1000;

% set the perturbation parameter k
k = 1.0;


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
    
    pplot(1) = p;
    qplot(1) = q;
    
    for j = 1:nppts
        [q,p] = stdmap(q,p,k);
        q = mod(q, 2*pi);
        qplot(j+1) = q;
        pplot(j+1) = p;
    end
    
    scatter(qplot,pplot,'.')
end

xlabel('Q');
ylabel('P');
xlim([0,2*pi]);
ylim([0,2*pi]);
    
