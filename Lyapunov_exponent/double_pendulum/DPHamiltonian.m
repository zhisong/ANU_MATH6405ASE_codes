function H = DPHamiltonian(t1,t2,p1,p2,m1,m2,l1,l2,g)

H = (l2^2*m2*p1.^2+l1^2*(m1+m2)*p2.^2-2*m2*l1*l2*p1.*p2.*cos(t1-t2))./(2*l1^2*l2^2*m2*(m1+m2*sin(t1-t2).^2)) - m2*g*l2*cos(t2)-(m1+m2)*g*l1*cos(t1);

end
