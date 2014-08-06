% Regularize the input element of the group SE(3).
% This extracts the rotation vector r from the input [r t] and uses
% regRot to normalize the rotation and limit it to 0 to 2*pi.
% Inputs:
% f : An element in SE(3) represented as [r t]. i.e. it has 6 elements.
% Outputs:
% ff : An element in SE(3) but with it's rotation normalized.

function [ff]=grpReg(f)
    f = makeColVector(f,6);
    ff=f;
    ff(1:3)=regRot(f(1:3));
end