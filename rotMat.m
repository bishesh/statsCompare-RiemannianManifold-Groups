% start: TODO
% What the function does
% It takes the rotation vector r and converts it into 3D rotation matrix.
% iNPUT:
% Output:
% end:  TODO
function [R]=rotMat(r)
    r=regRot(r);
    theta=norm(r);
    Sr=skew(r);
    if (theta<(1e-5))   % if theta is small use Taylor expansion.
        s=1-((theta^2)/6);  % to avoid numerical problems.
        k=1/2-theta^2;
        R=eye(3,3)+s*Sr+k*Sr^2;
    else
        R = eye(3,3) + (sin(theta)/theta)*Sr + ...
            ((1-cos(theta))/(theta^2))*(Sr^2);
    end
end
