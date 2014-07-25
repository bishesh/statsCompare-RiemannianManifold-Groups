% start: TODO
% Plot the trihedron representing f of SE(3)
% clearer function name ? 
% Inputs description: f element of SE(3) we want to represent, col color
% Outputs description: it plots the orthonormal trihedron 
% end:  TODO


function plotTrihedron(f,col)
    a=f(4:6); %origin of the frame : action of the translation of f
    R=Rot(rotMat(f(1:3))); %extract rotation from f
    e1=R*([1 0 0]'); % action of the rotation of f on the triHedron (3 basis axis): first axis
    e2=R*([0 1 0]'); % second axis
    e3=R*([0 0 1]'); % third axis
    vectarrow(a,a+e1,col); % plot first transformed axis at position a : draw an arrow between a and a+e1 in color col
    set(gca(),'auto_clear','off');
    vectarrow(a,a+e2,col); % plot second transformed axis
    set(gca(),'auto_clear','off');
    vectarrow(a,a+e3,col); % plot third transformed axis
    set(gca(),'auto_clear','on');
end