% To limit the angle of rotation between 0 to 2*pi.
% See: Page 43 Normalization.
% rename the function, normalize ?
% Inputs:
% r: a rotation vector
% Outputs:
% u: a normalized rotation vector.

function [u]=regRot(r)
phi=norm(r);
u=r;
if phi ~= 0  
    k0=double(floor( (phi/(2*pi)) + (1/2)) );
    u=(phi-2*pi*k0)*r/phi;
end
end