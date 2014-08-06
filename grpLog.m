% Group logarithm 
% "logG"
% start: TODO
% Inputs description:
% Outputs description:
% end:  TODO

function [v]=grpLog(f,ff)
    ff=grpReg(ff);
    f=grpReg(f);
    test1 =jL(f);
    test2 = grpLogId(grpCompose(grpInv(f),ff));  
    v = test1*test2;
end
