function dv = vfun(u)

x = u(1);
y = u(2);

w = (1/3)^(1/4);

r1 = sqrt((x-1)^2+y^2);
r2 = sqrt((x+1/2)^2+(y-sqrt(3)/2)^2);
r3 = sqrt((x+1/2)^2+(y+sqrt(3)/2)^2);

dv(1) = -w^2 * x + (x-1)/r1^3 + (x+1/2)/r2^3+(x+1/2)/r3^3;
dv(2) = -w^2 * y + (y)/r1^3 + (y-sqrt(3)/2)/r2^3+(y+sqrt(3)/2)/r3^3;

end