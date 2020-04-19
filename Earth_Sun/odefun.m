function dydt = odefun(t,y,k)
r = y(1);
theta = y(2);
pr = y(3);
ptheta = y(4);

drdt = pr;
dthetadt = ptheta/r.^2;
dprdt = ptheta^2./r.^3 - 1./r.^2.*(1+k*sin(theta));
dpthetadt = 1./r*(k*cos(theta));


dydt = [drdt;dthetadt;dprdt;dpthetadt];
end
