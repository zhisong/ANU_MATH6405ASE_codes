function dudt = odefun(t,u,k)
omega = k(1);
x1 = k(2);
x2 = k(3);
x3 = k(4);
y1 = k(5);
y2 = k(6);
y3 = k(7);
m1 = k(8);
m2 = k(9);
m3 = k(10);

x = u(1);
y = u(2);
px = u(3);
py = u(4);

r1 = sqrt((x-x1)^2 + (y-y1)^2);
r2 = sqrt((x-x2)^2 + (y-y2)^2);
r3 = sqrt((x-x3)^2 + (y-y3)^2);

dx = px + omega * y;
dy = py - omega * x;
dpx = omega * py - m1*(x-x1)/r1^3 - m2*(x-x2)/r2^3 - m3*(x-x3)/r3^3;
dpy = -omega * px - m1*(y-y1)/r1^3 - m2*(y-y2)/r2^3 - m3*(y-y3)/r3^3;

dudt = [dx;dy;dpx;dpy];
end