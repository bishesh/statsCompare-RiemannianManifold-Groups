% Computation of the closest rotation matrix R of a given matrix M 
% (avoids computational errors.)
function [R]=getClosestRotationMatrix(M)
    [u,s,v]=svd(M);
    R=u*v';
    if (det(R)<0)
        s(1,1)=1;
        s(2,2)=1;
        s(3,3)=-1;
        R=u*s*v';
    end
end
