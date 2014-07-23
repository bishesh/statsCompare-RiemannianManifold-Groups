% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Riemannian center of mass for the left-invariant metric
function [m]=frechetL(a,tabf,tabw)
    siz=size(tabf(1,,"*");  %TODO:
    if siz <> size(tabw,"*") 
        disp('longueurs de tableaux incompatibles'); 
    end
    m=tabf(:,1);
    aux=zeros(6,1);
    first=0;
    
    % convergence test
    % BRACKETS below:
    while first==0 | norma2_L(a,mbis,Riem_L_Log(a,mbis,m))>1e-5*sigma2_L(a,mbis,tabf,tabw)
        mbis=m;
        disp("mbisL=");disp(mbis);
        aux=zeros(6,1);
        for (i=1:siz)
            aux=aux+tabw(i)*Riem_L_Log(a,mbis,tabf(:,i));
        end
        m=Riem_L_Exp(a,mbis,aux);
        first=1;
    end
end