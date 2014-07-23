% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [a]=logRotL(r,rr)
    a=jRotL(r)*rotVect((rotMat(-r)*rotMat(rr)));
end