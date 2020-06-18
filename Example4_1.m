%% Example 4.1

sdpvar x y

P = [y^4+x^2*y^2 x^2*y^2;
    x^2*y^2 x^4];

% F = sos(P);
% solvesos(F);

P = [y^4+x^2*y^2 x^2*y^2 0;
    x^2*y^2 2*x^4 x^2*y^2;
    0  x^2*y^2  y^4+x^2*y^2 ];

% F = sos(P);
% solvesos(F);

pvar x y

% P = [y^4+x^2*y^2 x^2*y^2 0;
%     x^2*y^2 2*x^4 x^2*y^2;
%     0  x^2*y^2  y^4+x^2*y^2 ];

P = [y^4 x^2*y^2 0;
    x^2*y^2 2*x^4 x^2*y^2;
    0  x^2*y^2  y^4 ];


det(P)

P1 = (x^2+y^2)^20*P;


N = size(P1.degmat,1);
for k = 1:N
    Tmp = full(reshape(P1.coefficient(k,:),P1.matdim));
    if min(eig(Tmp)) < 0
        Tmp
        full(P1.degmat(k,:))
    end
end
