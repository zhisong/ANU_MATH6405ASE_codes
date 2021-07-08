function boolAns =ishabitable(x, y, star_pos)

% define star positions
xi = star_pos(1, :); % first row
yi = star_pos(2, :);
test= 0;
% find x and y relative
for i=1:3
    r_dist = sqrt((y-yi(i))^2+(x-xi(i))^2);
    booltest = r_dist > 0.6; % || r_dist>1;
    if booltest==true 
        test = test + 1;
    end 
end 
if test~=3
    boolAns = false;
    return 
else % planet greater than 0.6R from all stars
    for i=1:3
        r_dist = sqrt((y-yi(i))^2+(x-xi(i))^2);
        booltest = r_dist<1;
        if booltest==true 
            boolAns = true;
            return 
        end 
    end
    boolAns = false;
end
