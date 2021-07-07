clear all
%close all

figure
hold on

% the number of pxs we hope to explore
np2 = 30;
% the number of times for each orbit
nppts = 300;
% the sign of the passing (dy/dt), choose +1 or -1
ydotsign = -1;

% set the parameters 
case_triangle

% set the time span
tspan = [0, 1000];
% here we set both error
reltol = 1e-9;
abstol = 1e-9;
% generate ODE solving options
opts = odeset('RelTol',reltol,'AbsTol',abstol,'Events', @(t,y) EventsFcn(t,y,ydotsign));

H = -2;
xlist = linspace(1.2, 2 , np2);
pxlist = 0 * xlist;

% create an array to store results
pxplot = zeros(1,nppts+1);
xplot = zeros(1,nppts+1);


for i = 1:numel(xlist)

    px0 = pxlist(i);
    x0 = xlist(i);
    y0 = 0;
    ic=[x0;y0;px0;0];
    
    [py0] = get_py(ic, H, k, +1);
    
    ic=[x0;y0;px0;py0];
    
    
    if abs(imag(py0)) > 0
        continue
    end
    
    % is ydot having the correct sign we want? yes, continue; no, switch to another root
    dudt = odefun(0,ic,k);
    if (dudt(2) * ydotsign <= 0)
        [py0] = get_py(ic, H, k, -1);
        ic=[x0;y0;px0;py0];
    end
    pxplot(1) = px0;
    xplot(1) = x0;

    % solve the ODE nppts times
    
    for j = 1:nppts
    
        [t,u,te,ue,ie] = ode45(@(t,u) odefun(t,u,k), tspan, ic, opts);
        
        id = 2;
        
        % extract the solution
        x = ue(id,1);
        y = ue(id,2);
        px = ue(id,3);
        py = ue(id,4);
        
        pxplot(j+1) = px;
        xplot(j+1) = x;
        
        ic = [x;0;px;py];
        
    end
    
    scatter(xplot,pxplot,'.');
    axis equal
    ylim([-1,1]);
    xlim([0.0,2.1])
    xlabel('x');
    ylabel('px');

    
end


