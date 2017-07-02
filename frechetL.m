% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Riemannian center of mass for the left-invariant metric
function [m]=frechetL(a,tabf,tabw) % tabf is 6xN array, tabw is 1xN
    siz=size(tabf,2);  %TODO:
    if siz < 2 
        disp('Calculating mean requires at least 2 points'); 
    end
    m=tabf(:,1);
    %aux=zeros(6,1);
    first=0;
    
    % convergence test
    % BRACKETS below:
    while first==0 || normA2L(a,mbis,riemLogL(a,mbis,m))>1e-5*sigma2L(a,mbis,tabf,tabw)
        mbis=m;
        disp('mbisL=');disp(mbis);
        aux=zeros(6,1);
        for i = 1:siz
            aux=aux+tabw(i)*riemLogL(a,mbis,tabf(:,i));
        end
        m=riemExpL(a,mbis,aux);
        first=1;
    end
end