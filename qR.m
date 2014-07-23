% start: TODO
% What the function does
% clearer function name ? 
% end:  TODO

function [g]=qR(a,f)
    g0=zeros(6,6);
    g0(1:3,1:3)=eye(3,3);
    g0(4:6,4:6)=a*eye(3,3);
    g=jR(f)'^(-1)*g0*jR(f)^(-1);
end