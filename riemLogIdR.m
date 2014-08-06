% start: TODO
% What the function does
% clearer function name ?
% Inputs description:
% a is not used inside the function ??
% Outputs description:
% end:  TODO

function [v]=riemLogIdR(a,f)
v = f;
v(1:3)=f(1:3);
v(4:6)=rotMat(-f(1:3))*f(4:6);
end