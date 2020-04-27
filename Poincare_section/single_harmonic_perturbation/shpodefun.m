function dydt = shpodefun(t,y,k)
q1 = y(1);
q2 = y(2);
p1 = y(3);
p2 = y(4);

dq1 = p1;
dq2 = p2;
dp1 = - 2 * k * sin(2*q1 - q2);
dp2 = + k * sin(2*q1 - q2);

dydt = [dq1;dq2;dp1;dp2];
end
