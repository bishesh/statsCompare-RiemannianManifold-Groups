% Group exponential from point f with initial vector v
% Inputs: 
% f shooting point
% v shooted vector
% Outputs: 
% ff point reached after shooting

function [ff]=grpExp(f,v)
    v=grpReg(v);
    f=grpReg(f);
    ff=grpReg(grpCompose(f, grpExpId(jL(f)\v))); 
end