% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Preliminaries: computation of the mean for rotations

function [m]=rotMean(tabr,tabw)
    siz=size(tabr(1,,"*");  %TODO:
    if siz <> size(tabw,"*") 
        disp('longueurs de tableaux incompatibles'); 
    end
    m=tabr(:,1);
    %mbis=mt et m=m(t+1)
    aux=zeros(6,1);
    first=0;
    % BRACKETS!! in while
    while first==0 | (norm(logRotL(mbis,m))^2>1e-5*sigma2(mbis,tabr,tabw))
        mbis=m;
        aux=zeros(3,1);
        for (i=1:siz)
            aux=aux+tabw(i)*logRotL(mbis,tabr(:,i));
        end
        m=expRotL(mbis,aux);
        first=1;
    end
end
