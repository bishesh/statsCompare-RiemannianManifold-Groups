% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [v]=riemLogL(a,f0,f)
    v=jL(f0)*riemLogIdL(a,grpCompose(grpInv(f0), f));
end