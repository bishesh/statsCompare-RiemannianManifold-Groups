% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Computations of the variance in the 3 geometric frameworks: Group, L and R

function [s]=sigma2(m,tabr,tabw)
    siz=size(tabr(1,,'*'); %TODO: 
    s=0;
    if siz <> size(tabw,"*")
        disp('longueurs de tableaux incompatibles'); 
    end
    for (i=1:siz)
        s=s+tabw(i)*norm(Logrot_L(m,tabr(:,i)))^2;
    end
end
