% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% RIemannian center of mass for the right-invariant metric
function [m]=frechetR(a,tabf,tabw) % tabf is 6xN array, tabw is 1xN
    siz=size(tabf,2);  %TODO:
    if siz < 2 
        disp('Calculating mean requires at least 2 points'); 
    end
    m=tabf(:,1);
    %aux=zeros(6,1);
    first=0;
    
    % convergence test
    % BRACKETS below:
    while first==0 || normA2R(a,mbis,riemLogR(a,mbis,m))>1e-5*sigma2R(a,mbis,tabf,tabw)
        mbis=m;
        disp('mbisR=');disp(mbis);
        aux=zeros(6,1);
        for i = 1:siz
            aux=aux+tabw(i)*riemLogR(a,mbis,tabf(:,i));
        end
        m=riemExpR(a,mbis,aux);
        first=1;
    end
end