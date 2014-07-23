% start: TODO
% Plot group, L and R geodesics starting at f with initial tangent vector v
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO


function plotComparison(a,f,v,fin,pas)
        for s=0as:fin
        fs1=Exp_L(f,s*v);
        plot_trihedron(fs1,5);//red
        set(gca(),"auto_clear","off");
        fs2=Riem_L_Exp(a,f,s*v);
        plot_trihedron(fs2,3);//green
        set(gca(),"auto_clear","off");
        fs3=Riem_R_Exp(a,f,s*v);
        plot_trihedron(fs3,2);//bleu
        set(gca(),"auto_clear","off");
        end
end