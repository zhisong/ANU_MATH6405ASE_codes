function [pp,qq] = from_continued_fraction(ai)
% calculate the fraction from its continued fraction expansion
% input a list of ai
% output the numerator and denominator of the fraction for each length

n = numel(ai);

pp = ones(size(ai));
qq = ones(size(ai));

for i = 1:n
    
    pp(i) = ai(i);
    qq(i) = 1;
    
    for j = i-1:-1:1
        tmp = pp(i);
        pp(i) = qq(i);
        qq(i) = tmp;
        pp(i) = ai(j) * qq(i) + pp(i);
    end
end
        

end

