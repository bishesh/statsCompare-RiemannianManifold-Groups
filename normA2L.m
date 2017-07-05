% start: TODO
% What the function does
% clearer function name ? 
% end:  TODO

% Associated left- and right- invariant metrics in the principal chart
% Inputs:
% a 
% f
% v 
%  Outputs:
% n :
function [n]=normA2L(a,f,v)
    v=grpReg(v);
    n=v'*qL(a,f)*v;
end
