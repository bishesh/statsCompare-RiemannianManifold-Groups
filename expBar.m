% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [m]=expBar(tabf,tabw)
    siz=size(tabf(1,,"*");   %TODO
    if siz <> size(tabw,"*") % TODO
        disp('longueurs de tableaux incompatibles'); 
    end
    for i=1:siz
        f=tabf(:,i);
        tabr(1:3,i)=f(1:3);  
        tabt(1:3,i)=f(4:6);
    end
    rmean=RotMean(tabr,tabw);
    % Partie translation, p34 de expbar
    M=zeros(3,3);
    t=zeros(3,1);
    for i=1:siz
        Maux=inv(matDeExp(rotVect(rotMat(rmean)*rotMat(-tabr(:,i)))));
        M=M+tabw(i)*Maux;
        t=t+tabw(i)*Maux*rotMat(-tabr(:,i))*tabt(:,i);
    end
    m(1:3,1)=rmean;
    m(4:6,1)=inv(M)*t;
end
