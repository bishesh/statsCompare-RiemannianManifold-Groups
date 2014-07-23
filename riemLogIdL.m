% start: TODO
% What the function does
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO

function [v]=riemLogIdL(a,f)
    v(1:3)=f(1:3);
    if a<>0     %TODO: <> ?
        v(4:6)=1/a*f(4:6);
    else
        disp('impossible: alpha=0');
    end
end