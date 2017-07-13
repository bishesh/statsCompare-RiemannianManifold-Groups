% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [m]=expBar(tabf,tabw) 
    
    % tabf: SE3 data points, 6xN array
    % tabw: data point weights, 1xN array

    siz=size(tabf,2);  %TODO:
    if siz < 2 
        disp('Calculating mean requires at least 2 points'); 
    end
    
    tabr=tabf(1:3,:);
    tabt=tabf(4:6,:);
    rmean=rotMean(tabr,tabw);
    
    % Partie translation, p34 de expbar
    M = zeros(3,3);
    t = zeros(3,1);
    
    for i=1:siz
        Maux=inv(matDeExp(rotVect(rotMat(rmean)*rotMat(-tabr(:,i)))));
        M=M+tabw(i)*Maux;
        t=t+tabw(i)*Maux*rotMat(-tabr(:,i))*tabt(:,i);
    end
    
    m(1:3)=rmean;
    m(4:6)=M\t; %inv(M)*t;
end
