% start: TODO
% What the function does
% clearer function name ?
% end:  TODO

% Differential of inversion for SE(3)

function [J]=jInv(f)
f=reg(f);
r=f(1:3);
R=rotMat(r);
Sr=skew(r);
theta=norm(r);
if theta<1e-5
    betA=1/2-theta^2/24;
    etA=1/6-theta^2/120;
else
    betA=(1-cos(theta))/theta^2;
    etA=1/theta^2*(1-sin(theta)/theta);
end

U=etA*Sr^2-betA*Sr+eye(3,3);
J(1:3,1:3)=-eye(3,3);
J(4:6,4:6)=-R';
J(4:6,1:3)=-skew(R'*t)*U;
end