% start: TODO
% What the function does
% clearer function name ? 
% end:  TODO

% Group exponential and logarithm from Id

function [f]=expId(v)
    v=reg(v);
    r=v(1:3);
    dt=v(4:6);
    theta=norm(r);
    f(1:3)=r;
    Sr=skew(r);
    if theta==0 
        f(4:6)=dt;
    elseif theta<1e-5 
        f(4:6)=dt+(1/6-theta^3/120)*Sr^2*dt+(1/2-theta^2/24)*Sr*dt;
    else
        f(4:6)=dt+theta^(-2)*(1-sin(theta)/theta)*Sr^2*dt+theta^(-2)*(1-cos(theta))*Sr*dt;
    end
end
