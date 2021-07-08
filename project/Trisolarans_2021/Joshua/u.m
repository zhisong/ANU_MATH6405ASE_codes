function udata = u(x,y)

w = (1/3)^(1/4);

udata = -1/2*w^2*(x.^2+y.^2) - 1./sqrt((x-1).^2+y.^2) - 1./sqrt((x+1/2).^2+(y-sqrt(3)/2).^2)-1./sqrt((x+1/2).^2+(y+sqrt(3)/2).^2);

end