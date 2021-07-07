case_triangle

% example 1 (valid choice)
x0 = 1.66;
y0 = 0;
px0 = 0;
ic=[x0;y0;px0;py0];
[py0] = get_py(ic, -1.7, k, -1)

% example 2 (valid choice)
x0 = 1.969;
y0 = 0;
px0 = 0;
ic=[x0;y0;px0;py0];
[py0] = get_py(ic, -1.48, k, -1)

% example 3.1 (invalid choice)
x0 = 1.7273;
y0 = 0;
px0 = 0;
ic=[x0;y0;px0;py0];
[py0] = get_py(ic, -2.0, k, -1)

% example 3.2 (invalid choice)
x0 = 1.80;
y0 = 0;
px0 = 0;
ic=[x0;y0;px0;py0];
[py0] = get_py(ic, -1.7, k, -1)

% example 4 (invalid choice)
x0 = 1.24;
y0 = 0;
px0 = 0;
ic=[x0;y0;px0;py0];
[py0] = get_py(ic, -3.0, k, -1)

% example 5 (invalid choice)
x0 = 1.44;
y0 = 0;
px0 = 0;
ic=[x0;y0;px0;py0];
[py0] = get_py(ic, -1.0, k, -1)


qp0 = [x0;y0;px0;py0]
tend = 1000;

[t,x,y,px,py] = solve_ivp(qp0, tend, k);


H = zeros(size(x));

for i = 1:numel(x)
    H(i) = get_H([x(i);y(i);px(i);py(i)], k);
end

H0 = H(1);
dH = abs(H-H0)/abs(H0);
odefun(0,qp0,k)
figure;
plot(x,y);
hold on
plot([x1, x2, x3], [y1, y2, y3],'x');
axis equal

%figure;
%semilogy(t,dH);

% figure;
% x = linspace(-2,3,100);
% H = zeros(size(x));
% for i = 1:numel(x)
%     H(i) = get_H([x(i);0;0;omega*x(i)], k);
% end
% plot(x,H)
% ylim([-5, -2.5]);
