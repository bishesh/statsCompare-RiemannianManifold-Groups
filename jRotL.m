% start: TODO
% What the function does
% clearer function name ?
% end:  TODO

% Differentials of the left and right translations for SO(3) in the principal chart

function [Jl]=jRotL(r)
    r=regRot(r);
    theta=norm(r);
    if theta<1e-5
        phi=1-(theta^2)/12;
        w=1/12+theta^2/720;
    elseif abs((theta-pi))<1e-5
        phi=theta*(pi-theta)/4;
        w=(1-phi)/theta^2;
    else phi=(theta/2)/(tan(theta/2));
        w=(1-phi)/theta^2;
    end
Jl=phi*eye(3,3) + (w*(r*r')) + skew(r)/2;
end
