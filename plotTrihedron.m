% start: TODO
% Plot the trihedron representing f of SE(3)
% clearer function name ? 
% Inputs description:
% Outputs description:
% end:  TODO


function plotTrihedron(f,col)
    a=f(4:6); %origin of the frame
    R=Rot(rotMat(f(1:3)));
    e1=R*([1 0 0]'); %basis vectors of the frame
    e2=R*([0 1 0]');
    e3=R*([0 0 1]');
    vectarrow(a,a+e1,col); %translation of vector a
    set(gca(),'auto_clear','off');
    vectarrow(a,a+e2,col);
    set(gca(),'auto_clear','off');
    vectarrow(a,a+e3,col);
    set(gca(),'auto_clear','on');
end