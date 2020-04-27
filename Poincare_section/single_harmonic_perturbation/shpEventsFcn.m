function [value,isterminal,direction] = shpEventsFcn(t,y)

% event happens when q2 = 2 pi
value(1) = y(2)-2*pi;
isterminal(1) = 1;
% theta changes from negative to positive
direction(1) = +1;

end

