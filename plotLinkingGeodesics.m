% start: TODO
% Plot group, L and R geodesics linking points f1 and f2
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO


% TODO: a not used ?
function plotLinkingGeodesics(a,f1,f2)
    u=Log_L(f1,f2);
    uL=Riem_L_Log(1,f1,f2);
    uR=Riem_R_Log(1,f1,f2);
    for s=0:0.1:1
        fs=Exp_L(f1,s*u);
        plot_trihedron(fs,5);
        set(gca(),"auto_clear","off");
        fsL=Riem_L_Exp(1,f1,s*uL);
        plot_trihedron(fsL,3);
        set(gca(),"auto_clear","off");
        fsR=Riem_R_Exp(1,f1,s*uR);
        plot_trihedron(fsR,2);
        set(gca(),"auto_clear","off");
    end
end