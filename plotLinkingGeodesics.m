% start: TODO
% Plot group, L and R geodesics linking points f1 and f2
% clearer function name ? 
% Inputs description:a=1 (i'll delete it later, it is useless)
% Outputs description:
% end:  TODO


% TODO: a not used ?
function plotLinkingGeodesics(a,f1,f2)
    u=Log_L(f1,f2); % compute the initial tangent vector for the group geodesic
    uL=Riem_L_Log(1,f1,f2); % compute the initial tangent vector for the L-Riem geodesic
    uR=Riem_R_Log(1,f1,f2); % compute the initial tangent vector for the R-Riem geodesic
    for s=0:0.1:1 % step chosen to plot points along the geodesics fs
        fs=Exp_L(f1,s*u); % shooting from f1 with the group geodesic, s parameterize position along the geodesic
        plot_trihedron(fs,5); % plot the point on the geodesic
        set(gca(),"auto_clear","off"); 
        fsL=Riem_L_Exp(1,f1,s*uL); %idem with Riemannian left-invariant geodesic
        plot_trihedron(fsL,3);
        set(gca(),"auto_clear","off");
        fsR=Riem_R_Exp(1,f1,s*uR); %idem with Riemannian right-invariant geodesic
        plot_trihedron(fsR,2);
        set(gca(),"auto_clear","off");
    end
end