function [value,isterminal,direction] = DPEventsFcn(t,y)

% event happens when t1 = 0
value(1) = y(1);
isterminal(1) = 1;
% theta changes from negative to positive
direction(1) = +1;

end

