
close all

% set the time span
tspan = [0, 200];
% set the relative error
reltol = 1e-10;
% generate ODE solving options
opts = odeset('RelTol',reltol);
% opts = odeset('AbsTol', reltol);

stable_fine1 = []; % init empty sol array]
% omega is rotational speed of 3 stars
w = (1/3)^(1/4);

% give position of stars in their static frame
star_pos = [1, -1/2, -1/2;0, sqrt(3)/2, -sqrt(3)/2];
% i=1.7; % set initial x_pos

for j=linspace(1.65, 1.75,10) % x range, resolution of 0.1
    i = 0; % vx
        for m=linspace(-1.7, -1.65, 10) % vy range
            add_bool = true; % by default we add

            ic=[j;0;i;m];
            % solve the ODE
            [t,r] = ode45(@(t,y) odefun(t,y,w,star_pos), tspan, ic, opts);
            % extract x' and y' from solution
            x = r(:,1);
            y = r(:,2);
            % xd = r(:, 3);
            % yd = r(:, 4);

            % now we can filter out orbits that leave the habitable zone
            for k=2:numel(x)
                if ishabitable(x(k), y(k), star_pos)==false
                    add_bool = false; % if it is not habitable at any step k we revoke addition
                    continue % just finish up the for loop once orbit escapes
                end 
            end

            % orbit does not leave habitable zone
            if add_bool==true
                stable_fine1(:, end+1) = [j;i;m];
            end 
        end
%     end
end


stable_fine2 = []; % init empty sol array]


for j=linspace(1.92, 1.97,10) % x range, resolution of 0.1
    i = 0; % vx
        for m=linspace(-1.7, -1.65, 10) % vy range
            add_bool = true; % by default we add

            ic=[j;0;i;m];
            % solve the ODE
            [t,r] = ode45(@(t,y) odefun(t,y,w,star_pos), tspan, ic, opts);
            % extract x' and y' from solution
            x = r(:,1);
            y = r(:,2);
            % xd = r(:, 3);
            % yd = r(:, 4);

            % now we can filter out orbits that leave the habitable zone
            for k=2:numel(x)
                if ishabitable(x(k), y(k), star_pos)==false
                    add_bool = false; % if it is not habitable at any step k we revoke addition
                    continue % just finish up the for loop once orbit escapes
                end 
            end

            % orbit does not leave habitable zone
            if add_bool==true
                stable_fine2(:, end+1) = [j;i;m];
            end 
        end
end

