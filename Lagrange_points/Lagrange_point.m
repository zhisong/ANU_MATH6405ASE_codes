
% create a grid from x in [-3,3], y in [-3,3]
x = linspace(-3,3,100);
y = linspace(-3,3,100);
[X,Y] = meshgrid(x,y);

% compute the potential V
V = u(X,Y);
figure;

% plot V, linspace(-3,-1,100) means we only show values in [-3, -1] with
% 100 contour steps
contourf(x,y,V, linspace(-3,-1,100));
axis equal

% Find Lagrange point from gradV=0, given some initial guess
x = fsolve(@vfun,[0.03,1.7])