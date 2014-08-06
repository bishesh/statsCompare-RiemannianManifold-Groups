% plot brain surface with a given color.
% Inputs:
% --------------------------------------
% brainSurface: a structure containing:
%   vertices: all the points
%   faces: faces
% --------------------------------------
% color: 3 component vector representing [r,g,b] with each component
% between 0 and 1.
% --------------------------------------
% f: an element in SE(3) and has 6 components [r t] where,
%   r: rotation vector of 3 elements. Direction of the vector defines an
%   axis about which the rotation takes place. Norm of the vector is the
%   amount of rotation about the axis.
%   t: tranlsation vector.
% ************************************
% Outputs:
% None, just plots.


function plotBrain(brainSurface,color,f)
f = makeColVector(f,6);

vertices = brainSurface.vertices;
faces = brainSurface.faces;
% Get the rotation vector and convert it to rotation matrix:
R=getClosestRotMat(rotMat(f(1:3)));
% Get the translation component:
t=f(4:6); 

% Rotate each point using the rotation matrix.
vertices = (R*vertices')';
% Translate the rotated points:
vertices(:,1) = vertices(:,1) + t(1);
vertices(:,2) = vertices(:,2) + t(2);
vertices(:,3) = vertices(:,3) + t(3);

% Set the color options
mesh_options.face_vertex_color = ones(size(vertices,1),3);
mesh_options.face_vertex_color(:,1) = color(1);
mesh_options.face_vertex_color(:,2) = color(2);
mesh_options.face_vertex_color(:,3) = color(3);

plot_mesh(vertices,faces,mesh_options);

end