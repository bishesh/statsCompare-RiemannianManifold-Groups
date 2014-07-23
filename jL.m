% start: TODO
% What the function does
% clearer function name ?
% end:  TODO

% Differential of left and right translations for SE(3) in the principal chart

function [Jl]=jL(f)
    f=reg(f);
    Jl(1:3,1:3)=jRotL(f(1:3));
    Jl(4:6,4:6)=rotMat(f(1:3));
end