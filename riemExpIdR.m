% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [f]=riemExpIdR(a,v)
    f=grpInv(riemExpIdL(a,-v));
end