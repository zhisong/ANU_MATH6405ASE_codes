function dydt = odefun(t,y,k)
q1 = y(1);
q2 = t;
p1 = y(2);

dq1 = p1;
dp1 = k * sin(2*q1-q2) + k*sin(3*q1-2*q2);

dydt = [dq1;dp1];
end
