% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [ff]=expL(f,v)
    v=reg(v);
    f=reg(f);
    ff=f*. expId(inv(jL(f))*v); % TODO: *. ?
end