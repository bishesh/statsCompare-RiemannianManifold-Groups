% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% a is not used inside the function ??
% Outputs description:
% end:  TODO

function [v]=riemLogIdR(a,f)
    r=f(1:3);
    v(1:3)=r;
    v(4:6)=RotMat(-r)*f(4:6);
end