% start: TODO
% What the function does
% end:  TODO
function [R]=rotMat(r)
    r=regrot(r);
    theta=norm(r);
%     disp('theta=');disp(theta);
    Sr=skew(r);
    if (theta<(1e-5))
        s=1-theta^2/6;  % TODO: brackets :)
        k=1/2-theta^2;
        R=eye(3,3)+s*Sr+k*Sr^2;
%     elseif abs((theta-pi))<1e-5
    else
    R=eye(3,3)+(sin(theta)/theta)*Sr+(1-cos(theta))/(theta^2)*Sr^2;
    end
end
