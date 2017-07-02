% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [s]=sigma2R(a,m,tabf,tabw)
    siz=size(tabf,2);
    s=0;
    if siz < 2 
        disp('Calculating variance requires at least 2 points');
    end
    for i=1:siz
        s=s+tabw(i)*normA2R(a,m,riemLogR(a,m,tabf(:,i)));
    end
end
