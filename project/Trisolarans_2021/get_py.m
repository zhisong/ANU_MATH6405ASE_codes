function [py] = get_py(u, H, k, sign)
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

r1 = sqrt((x-x1)^2 + (y-y1)^2);
r2 = sqrt((x-x2)^2 + (y-y2)^2);
r3 = sqrt((x-x3)^2 + (y-y3)^2);

a = 1/2;
b = - omega * x;
c = 1/2*(px^2) + omega * y * px - m1/r1 - m2/r2 - m3/r3 - H;

delta = b^2 - 4 * a * c;
py = (-b + sign * sqrt(delta))/(2 * a);

end

