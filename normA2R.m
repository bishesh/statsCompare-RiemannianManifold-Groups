% start: TODO
% What the function does
% clearer function name ? 
% end:  TODO

function [n]=normA2R(a,f,v)
    v=reg(v);
    n=v'*qR(a,f)*v;
end