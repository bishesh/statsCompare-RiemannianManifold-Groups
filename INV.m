% start: TODO
% What the function does
% clearer function name ? e.g. invertSE3 ?
% What is the following line?
% deff('x=%s_5(a)','x=add3Zeros(rotVect(rotMat(a(1:3))^(-1)),1)+add3Zeros(-(rotMat(a(1:3))^(-1))*a(4:6),0)');
% end:  TODO

% Group inversion for SE(3)
function [in]=INV(a)
    a=reg(a);
    r=a(1:3);
    theta=norm(r);
    t=a(4:6);
    in=add3Zeros(-r,1)+ add3Zeros((rotMat(-r))*(-t),0);
end
