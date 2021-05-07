function udata = u(x,y)

w = 1/2;

udata = -1/2*w^2*(x.^2+y.^2) - 1./sqrt((x-1).^2+y.^2) - 1./sqrt((x+1).^2+y.^2);

end

