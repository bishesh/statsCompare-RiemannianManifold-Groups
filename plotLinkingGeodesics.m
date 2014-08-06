% start: TODO
% Plot group, L and R geodesics linking points f1 and f2
% clearer function name ?
% Inputs description:a=1 (TODO: i'll delete it later, it is useless)
% Outputs description:
% end:  TODO

function [f fL fR] = plotLinkingGeodesics(a,f1,f2)
u=grpLog(f1,f2); % compute the initial tangent vector for the group geodesic
uL=riemLogL(1,f1,f2); % compute the initial tangent vector for the L-Riem geodesic
uR=riemLogR(1,f1,f2); % compute the initial tangent vector for the R-Riem geodesic

stepSize = 0.1;
index = 1;
for s=0:stepSize:1 % plot points along the geodesics fs
    fs=grpExp(f1,s*u); % shooting from f1 with the group geodesic, s parameterize position along the geodesic
    f(:,index) = fs;
    index = index+1;
    plotTrihedron(fs,'red'); % plot the point on the geodesic
    hold on;
    fsL=riemExpL(1,f1,s*uL); %idem with Riemannian left-invariant geodesic
    fL(:,index) = fsL;
    plotTrihedron(fsL,'green');
    hold on;
    fsR=riemExpR(1,f1,s*uR); %idem with Riemannian right-invariant geodesic
    fR(:,index) = fsR;
    plotTrihedron(fsR,'blue');
    hold on;
end
end