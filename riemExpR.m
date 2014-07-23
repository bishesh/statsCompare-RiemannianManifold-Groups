% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [f]=riemExpR(a,f0,v)
    f=riemExpIdR(a,inv(J_R(f0))*v)*. f0;
    %right-invariance of the right Riemannian geodesics
end