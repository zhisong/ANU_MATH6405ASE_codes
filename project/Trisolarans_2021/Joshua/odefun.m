function drdt = odefun(t, r, omega, star_pos)
x = r(1);
y = r(2);
xd = r(3);
yd = r(4);

% define separation vectors
xi = star_pos(1, :); % first row
yi = star_pos(2, :);

ri = zeros(1,3);
sum_x = 0;
sum_y = 0;

for n=1:3
    ri(n) = sqrt((x-xi(n))^2+(y-yi(n))^2);
    
    % do var sums here as well
    sum_x = sum_x + (x-xi(n))/ri(n)^3;
    sum_y = sum_y + (y-yi(n))/ri(n)^3;
end 

dxdt = xd;
dydt = yd;

ddxddt = 2*omega*yd + omega^2*x - sum_x;
ddyddt = -2*omega*xd + omega^2*y - sum_y;

drdt = [dxdt; dydt; ddxddt; ddyddt];
end 