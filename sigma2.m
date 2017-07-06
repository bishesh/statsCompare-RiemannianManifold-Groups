% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

% Computations of the variance in the 3 geometric frameworks: Group, L and R

function [s]=sigma2(m,tabr,tabw)
    siz=size(tabr,2);  %TODO:
    if siz < 2 
        disp('Calculating sigma requires at least 2 points'); 
    end

    s=0;

    for i=1:siz
        s=s+tabw(i)*norm(logRotL(m,tabr(:,i)))^2;
    end
end
