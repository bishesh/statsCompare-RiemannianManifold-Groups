% start: TODO
% What the function does
% end:  TODO
function [ff]=reg(f)
    ff=zeros(6,1);
    r=f(1:3,1);
    t=f(4:6,1);
    r=regrot(r);
    ff(1:3)=r;
    ff(4:6)=t;
end