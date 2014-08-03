% Group logarithm 
% "logG"
% start: TODO
% Inputs description:
% Outputs description:
% end:  TODO

function [v]=logG(f,ff)
    ff=reg(ff);
    f=reg(f);
    v=jL(f)*logId(INV(f)*. ff);  %TODO: *.?
end