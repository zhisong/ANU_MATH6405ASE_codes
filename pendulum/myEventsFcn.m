function [value,isterminal,direction] = myEventsFcn(t,y)

value(1) = y(1);
isterminal(1) = 1;
direction(1) = +1;

end

