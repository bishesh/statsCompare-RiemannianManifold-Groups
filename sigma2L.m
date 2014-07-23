% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [s]=sigma2L(a,m,tabf,tabw)
    siz=size(tabf(1,,"*");
    s=0;
    if siz <> size(tabw,"*") 
        disp('longueurs de tableaux incompatibles');
    end
    for (i=1:siz)
        s=s+tabw(i)*norma2_L(a,m,Riem_L_Log(a,m,tabf(:,i)));
    end
end