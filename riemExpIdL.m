% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Riemannian exponential and logarithm from Id (for left- and right-invariant metric)
function [f]=riemExpIdL(a,v)
    v=grpReg(v);
    f(1:3)=v(1:3);
    f(4:6)=a*v(4:6);
end
