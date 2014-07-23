% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Group exponential barycenter on SE(3):
%  - the previous mean for the rotation part,
%  - closed form from article of Xavier Pennec "Exponential Barycenters of...",(2012)

% Intermediate function
function [M]=matDeExp(v)
    v=regRot(v);
    r=v(1:3);
    theta=norm(r);
    Sr=skew(r);
    if theta==0 
        M=eye(3,3);
    elseif theta<1e-5 
        M=eye(3,3)+(1/6-theta^3/120)*Sr^2+(1/2-theta^2/24)*Sr;
    else
        M=eye(3,3)+theta^(-2)*(1-sin(theta)/theta)*Sr^2+theta^(-2)*(1-cos(theta))*Sr;
    end
end