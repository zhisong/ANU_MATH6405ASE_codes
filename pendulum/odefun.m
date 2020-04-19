function dydt = odefun(t,y,k)
q = y(1);
p = y(2);
dydt = [p; -k * sin(q)];
end
