% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Group exponential and logarithm from any point f (first for SO(3))
%  Group geodesics are left- and right- invariant

function [rr]=expRotL(r,a)
    rr=rotVect(rotMat(r)*rotMat(inv(jRotL(r))*a));
%      R*Exp(DL(R^-1)*a)
end