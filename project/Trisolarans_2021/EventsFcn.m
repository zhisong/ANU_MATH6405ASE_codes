function [value,isterminal,direction] = DPEventsFcn(t,y,ydotsign)

% event happens when y = 0
value(1) = y(2);
isterminal(1) = 1;
% theta changes from negative to positive
direction(1) = ydotsign;

end

