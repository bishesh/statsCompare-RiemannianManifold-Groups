% start: TODO
% What the function does: Group exponential from point f with initial vector v
% clearer function name ? yes : expG
% Inputs description: f shooting point, v shooted vector
% Outputs description: ff point reached after shooting
% end:  TODO

function [ff]=expL(f,v)
    v=reg(v);
    f=reg(f);
    ff=f*. expId(inv(jL(f))*v); % TODO: *. ?
end