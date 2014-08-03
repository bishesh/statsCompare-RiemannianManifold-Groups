% Group exponential from point f with initial vector v
% expG
% Inputs: 
% f shooting point
% v shooted vector
% Outputs: 
% ff point reached after shooting

function [ff]=expG(f,v)
    v=reg(v);
    f=reg(f);
    ff=f*. expId(inv(jL(f))*v); % TODO: *. ?
end