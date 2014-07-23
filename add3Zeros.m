% The function adds three zeros either in the beginning or at the end
% of a three dimensional vector.
% If n = 1, it adds in the beginning, if 0 adds in the end.
% start: TODO
% What is the following line ?
% deff('x=%s_u_s(a,b)','x=add3Zeros(rotVect(rotMat(a(1:3))*rotMat(b(1:3))),1)+add3Zeros(rotMat(a(1:3))*b(4:6)+a(4:6),0)');
% end:  TODO

% Group composition for SE(3), new operator: *.

function [u]=add3Zeros(v,n)
    u=zeros(6,1);
    if n==0 
        u(4:6,1)=v; 
    end
    if n==1
        u(1:3,1)=v; 
    end
end