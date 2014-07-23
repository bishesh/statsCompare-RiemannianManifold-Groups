% start: TODO
% % Generation of a random element of SE(3)
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Statistical setting on SE(3) 

function [f]= unifRnd()
    M=(rand(3,3)-0.5*ones(3,3))*2;
    t=(rand(3,1)-0.5)*2;
    r=regrot(rotVect(rotMat(M)));
    f(1:3)=r;
    f(4:6)=t;
end