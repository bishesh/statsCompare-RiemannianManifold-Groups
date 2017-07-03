% start: TODO
% % Generation of a random element of SE(3)
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Statistical setting on SE(3) 

function [f]= unifRnd()
    Rnd_vec = (rand(3,1)-0.5*ones(3,1))*2;
    r=regRot(Rnd_vec);
    t=(rand(3,1)-0.5)*2;
    f(1:3)=r;
    f(4:6)=t;
end
