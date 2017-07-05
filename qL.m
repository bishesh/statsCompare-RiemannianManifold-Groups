% start: TODO
% What the function does
% clearer function name ? 
% end:  TODO

% Left- and right- invariant inner product in the principal chart (propagation of Frobenius inner product)
function [g]=qL(a,f)
    f=makeColVector(f,6);
    f=grpReg(f);
    g0=zeros(6,6);
    g0(1:3,1:3)=eye(3,3);
    g0(4:6,4:6)=a*eye(3,3);
    g=jL(f)'^(-1)*g0*jL(f)^(-1);
end
