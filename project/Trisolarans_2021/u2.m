function udata = u2(x,y)

w = 1/sqrt(sqrt(3));

x1 = 1;
x2 = -1/2;
x3 = -1/2;

y1 = 0;
y2 = sqrt(3)/2;
y3 = -sqrt(3)/2;

udata = -1/2*w^2*(x.^2+y.^2) - 1./sqrt((x-x1).^2+(y-y1).^2) - 1./sqrt((x-x2).^2+(y-y2).^2)- 1./sqrt((x-x3).^2+(y-y3).^2);

end

