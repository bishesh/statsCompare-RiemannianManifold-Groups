% start: TODO
% % Generation of a random element of SE(3)
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Statistical setting on SE(3) 

function [f]= unifRnd()
    f(1:3) = regRot(rand(3,1) * 2 - 1);     % rotation
    f(4:6) = rand(3,1) * 2 - 1;             % translation
end
