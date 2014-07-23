% Return 1 if a matrix is skewsymmetric else 0 with a warning.
% User can provide tolerance to get the desired accuracy; default is 1e-12.
function x = isSkewSymmetric(A, tol)
    if (nargin < 2)
        tol = 1e-12;
    end
    Err=A+A';
    err=trace(Err*Err');
    if (err>tol)
        x = 0;
        disp('Warning: Not a skew-symmetric matrix');
    else
        x = 1;
    end
end