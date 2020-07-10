[pp,qq] = from_continued_fraction([0,1,1,3,1,1,1,1]);

pp1 = pp(end);
qq1 = qq(end);

qpguess = [0;pp1/qq1];

klist = linspace(0.00001,0.0025,300);
traceJ = zeros(size(klist));
qp = qpguess;
for i = 1:numel(klist)
    [qp, qphis, issuccess, jac] = newton_method(qp, klist(i), pp1, qq1, 1e-9, 100);
    traceJ(i) = trace(jac);
    
    if (issuccess == 0)
        disp('failed')
        klist(i);
    end
    %i
    %qp
end

figure
plot(klist, ((2-traceJ)).^(1/qq1));
xlabel('k');
ylabel('R_G');
