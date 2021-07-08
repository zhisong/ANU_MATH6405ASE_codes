function h = circle(x,y,r, skey,lw)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit, skey, 'LineWidth', lw);
hold off