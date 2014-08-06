% Compute the inverse of the group elemnt in SE(3).
% Inputs:
% f: an element in SE(3) with 6 elements: [r t]
% Outupts:
% fInv: inverse of f, with 6 elements.
% end:  TODO

% Group inversion for SE(3)
function fInv =grpInv(f)
f = makeColVector(f,6);
f=grpReg(f);
r=f(1:3);
t=f(4:6);
fInv = zeros(6,1);
fInv(1:3) = -r;
fInv(4:6)=rotMat(-r)*(-t);
end
