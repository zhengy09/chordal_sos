
%% Example 3.3 in the paper
clc;

pvar x y z;
P = [y^4+x^2*y^2+x^4 x^2*y^2 0;x^2*y^2 x^4+y^4 x^2*y^2;0 x^2*y^2 y^4+x^2*y^2+x^4];

P1 = (x^2+y^2)^3*P;


N = size(P1.degmat,1);
for k = 1:N
    Tmp = full(reshape(P1.coefficient(k,:),P1.matdim));
    if min(eig(Tmp)) < 0
        Tmp
        full(P1.degmat(k,:))
    end
end
