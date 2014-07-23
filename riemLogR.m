% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [v]=riemLogR(a,f0,f)
    v=jR(f0)*riemLogIdR(a,f*. INV(f0));
end