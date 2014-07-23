% start: TODO
% What the function does
% end:  TODO
function [r]=rotVect(R)
    M=R*R'-eye(3,3);
    if trace(M)>1e-20 % TODO: do we have numeric precision less than 1e-12?
        R=Rot(R); 
    end
    c=(trace(R)-1)/2;
    if c>1
        c=1;
    end
    if c<-1
        c=-1;
    end
    theta=acos(c);
    
    if theta<1e-5 
        fact=0.5*(1+theta^2/6);
        Sr=fact*(R-R');
        r=[Sr(3,2), Sr(1,3), Sr(2,1)]';
    elseif abs(theta-pi)<1e-5
        disp('attention r');    % TODO: ? a remplir
    else
        fact=0.5*theta/sin(theta);
        Sr=fact*(R-R');
        r=[Sr(3,2), Sr(1,3), Sr(2,1)]';
    end
end