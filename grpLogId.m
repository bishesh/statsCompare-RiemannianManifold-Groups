% Group logarithm from Identity
% Inputs description:
% f: an element of the group SE(3).
% Outputs description:
% v: 

function [v]=grpLogId(f)
    f=grpReg(f);
    r=f(1:3);
    t=f(4:6);
    theta=norm(r);
    v = zeros(6,1);
    v(1:3)=r;
    Sr=skew(r);
    if theta==0 
        v(4:6)=t;
    elseif theta < 1e-5
        v(4:6)=t-1/2*Sr*t+(1/2-theta^2/90)*Sr^2*t;
    else
        fact=0.5*theta*sin(theta)/(1-cos(theta));
        v(4:6)=t-1/2*Sr*t+(1-fact)/theta^2*Sr^2*t;
    end
end