% start: TODO
% Plot the group exponential barycenter and the L and R Riemannian centers of mass
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO


function plotComparisonMean(tabf,tabw)
    wsum=sum(tabw);
    if wsum~=1.0 
        disp('weights dont sum to 1');
    end
    siz=size(tabf(1,,"*");
    for i=1:siz
        plot_trihedron(tabf(:,i),1);
        set(gca(),'auto_clear','off');
    end
        m1=expbar(tabf,tabw);
        plot_trihedron(m1,5);
        set(gca(),'auto_clear','off');
        m2=Frechet_L(1,tabf,tabw);
        plot_trihedron(m2,3);
        set(gca(),'auto_clear','off');
        m3=Frechet_R(1,tabf,tabw);
        plot_trihedron(m3,2);
        set(gca(),'auto_clear','off');
end

