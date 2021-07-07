function dv = vfun2(u)

x = u(1);
y = u(2);

w = 1/sqrt(sqrt(3));



x1 = 1;
x2 = -1/2;
x3 = -1/2;

y1 = 0;
y2 = sqrt(3)/2;
y3 = -sqrt(3)/2;

r1 = sqrt((x-x1)^2+(y-y1)^2);
r2 = sqrt((x-x2)^2+(y-y2)^2);
r3 = sqrt((x-x3)^2+(y-y3)^2);

dv(1) = -w^2 * x + (x-x1)/r1^3 + (x-x2)/r2^3 + (x-x3)/r3^3;
dv(2) = -w^2 * y + (y-y1)/r1^3 + (y-y2)/r2^3 + (y-y3)/r3^3;

end

