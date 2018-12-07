function [real_cuts] = caculateWearMaxCuts(R)

r1 = R(:,1);
r2 = R(:,2);
r3 = R(:,3);
real_cuts = zeros(1, 150);
for wear = 51:200
    i = wear - 50;
    flutes(1) = max(checkElements(find(r1 <= wear)));
    flutes(2) = max(checkElements(find(r2 <= wear)));
    flutes(3) = max(checkElements(find(r3 <= wear)));
    %disp(flutes);
    [a, ~] = max(flutes);
    if ~isempty(a)
        real_cuts(i) = a;
    end
end

real_cuts = real_cuts(:);

end