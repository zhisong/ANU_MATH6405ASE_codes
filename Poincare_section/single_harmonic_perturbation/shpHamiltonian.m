function H = shpHamiltonian(q1,q2,p1,p2,k)

H = (p1.^2 + p2.^2)./2 - k .* cos(2.*q1 - q2);

end
