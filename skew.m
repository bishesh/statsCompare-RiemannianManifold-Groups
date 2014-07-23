% start TODO: 
% Understand better following:
% principal chart
% What are f, r and t on the following comment.
% Rename the function to better describe what the function does exactly ?
% end TODO

%  SE(3): principal chart f=(r,t), vector of R^6 ()unfolding along the L Riemannian geodesics)
% r= (theta,n) where theta[%pi]

% Conversion of the elements f of the principal chart to matrices + regularization functions.

function [S]=skew(r)
    S=[[0, -r(3), r(2)];
      [r(3), 0, -r(1)];
      [-r(2), r(1), 0]];
end
