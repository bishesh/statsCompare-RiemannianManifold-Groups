% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% RIemannian center of mass for the right-invariant metric
function [m]=frechetR(a,tabf,tabw)
    siz=size(tabf(1,,"*");
    if siz <> size(tabw,"*")
        disp('longueurs de tableaux incompatibles'); 
    end
    m=tabf(:,1);
    aux=zeros(6,1);
    first=0;
    % convergence test
    % BRACKETS below
    while first==0 | norma2_R(a,mbis,Riem_R_Log(a,mbis,m))>1e-5*sigma2_R(a,mbis,tabf,tabw);
        mbis=m;
        disp('mbisR=');
        disp(mbis);
        aux=zeros(6,1);
        for i=1:siz
            aux=aux+tabw(i)*Riem_R_Log(a,mbis,tabf(:,i));
        end
        m=Riem_R_Exp(a,mbis,aux);
        first=1;
    end
end