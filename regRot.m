% start: TODO
% Comments about what the code does
% rename the funciton
% what is phi<>0, is it not equal to?
% and %pi
% end:  TODO
function [u]=regRot(r)
    phi=norm(r);
    u=r;
    if phi<>0 % TODO: is it phi~=0 ?
        k0=int(phi/(2*pi)+1/2);
        u=(phi-2*pi*k0)*r/phi;
    end
end