% start: TODO
% What the function does
% clearer function name ?
% end:  TODO

function [Jr]=jR(f)
    Jr(1:3,1:3)=jRotR(f(1:3));
    Jr(4:6,1:3)=-skew(f(4:6));
    Jr(4:6,4:6)=eye(3,3);
end