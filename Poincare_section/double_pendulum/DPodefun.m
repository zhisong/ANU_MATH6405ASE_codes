function dydt = DPodefun(t,y,m1,m2,l1,l2,g)
t1 = y(1);
t2 = y(2);
p1 = y(3);
p2 = y(4);

dt1 = (l2*p1-l1*p2 * cos(t1-t2))/(l1^2*l2*(m1+m2*(sin(t1-t2))^2));
dt2 = (l1*(m1+m2)*p2 - l2*m2*p1*cos(t1-t2))/(l1*l2^2*m2*(m1+m2*(sin(t1-t2)^2)));
C1 = (p1*p2*sin(t1-t2))/(l1*l2*(m1+m2*(sin(t1-t2))^2));
C2 = (l2^2*m2*p1^2+l1^2*(m1+m2)*p2^2-2*l1*l2*m2*p1*p2*cos(t1-t2))*sin(2*(t1-t2))/(2*l1^2*l2^2*((m1+m2*(sin(t1-t2))^2))^2);
dp1 = -(m1+m2)*g*l1*sin(t1) - C1 + C2;
dp2 = -m2*g*l2*sin(t2) + C1 - C2;

dydt = [dt1;dt2;dp1;dp2];
end
