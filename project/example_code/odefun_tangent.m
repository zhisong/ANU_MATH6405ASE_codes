function dydt = odefun_tangent(t,y,k)
q1 = y(1);
q2 = t;
p1 = y(2);

dq1 = p1;
dp1 = k * sin(2*q1-q2) + k*sin(3*q1-2*q2);

% this part is for the construction of the Jacobian
deltaqp = eye(2);
deltaqp(1,1) = y(3);
deltaqp(2,1) = y(4);
deltaqp(1,2) = y(5);
deltaqp(2,2) = y(6);

% construct the M matrix
M = eye(2);
M(1,1) = 0;
M(1,2) = 1;
M(2,1) = 2 * k * cos(2*q1-q2) + 3 * k * cos(3*q1-2*q2);
M(2,2) = 0;

ddeltaqp = M * deltaqp;

dydt = [dq1;dp1;ddeltaqp(1,1);ddeltaqp(2,1);ddeltaqp(1,2);ddeltaqp(2,2)];
end
