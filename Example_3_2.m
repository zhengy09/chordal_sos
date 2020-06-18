
%% Example 3.2

% clc;
% sdpvar x y z
% 
% P1 = [(x^2+2*y^2)^2 -x*y*(x^2+2*y^2);-x*y*(x^2+2*y^2) x^2*y^2];
% 
% F = sos(P1);
% solvesos(F);
% 
% P2 = [(y^2+2*z^2)*(x^2+2*y^2)-x^2*y^2 -y*z*(x^2+2*y^2);-y*z*(x^2+2*y^2) (z^2+2*x^2)*(x^2+2*y^2)];
% F = sos(P2);
% solvesos(F);


%%

sdpvar x y z

P = [x^2+y^2 -x*y 0;-x*y y^2+z^2 -y*z; 0 -y*z x^2+z^2];
F = sos(P);
solvesos(F);

F = sos(P*(x^2+y^2));
solvesos(F);


P2 = [x^2*z^2+y^2*z^2+y^4 -y*z*(x^2+y^2);-y*z*(x^2+y^2) (x^2+z^2)*(x^2+y^2)];
F = sos(P*(x^2+y^2+z^2));
solvesos(F);


