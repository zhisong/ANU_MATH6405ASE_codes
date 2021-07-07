
% create a grid from x in [-3,3], y in [-3,3]
x = linspace(-3,3,100);
y = linspace(-3,3,100);
[X,Y] = meshgrid(x,y);

% compute the potential V
V = u2(X,Y);
figure;

% plot V, linspace(-3,-1,100) means we only show values in [-3, -1] with
% 100 contour steps
contourf(x,y,V, linspace(-5,-1,100));
axis equal

hold on

% Find Lagrange point from gradV=0, given some initial guess
x = fsolve(@vfun2,[0,0])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[-1,-1.7])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[0.8,-1.4])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[2,0])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[-1.6,0])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[-1,1.7])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[0.2,0.3])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[-0.4,0])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[0.2,-0.3])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

x = fsolve(@vfun2,[0.8,1.4])
test_stable(x);
plot([x(1)], [x(2)], 'kx');

function test_stable(xin)
  x = xin(1);
  y = xin(2);
  w=1/sqrt(sqrt(3));
  V = eig(vfun2jacobian([x;y;-w*y;w*x]));
  isstable = 1;
  for i = 1:numel(V)
      if real(V(i)) > 0
          isstable = 0;
      end
  end
  
  if isstable == 1
      disp 'stable'
  else
      disp 'unstable'
  end
  
end