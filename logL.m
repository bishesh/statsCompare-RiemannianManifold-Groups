% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [v]=logL(f,ff)
    ff=reg(ff);
    f=reg(f);
    v=jL(f)*logId(INV(f)*. ff);  %TODO: *.?
end