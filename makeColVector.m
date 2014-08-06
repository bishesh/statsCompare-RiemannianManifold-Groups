% Convert the input vector to a column vector. Also checks if the given
% input is a vector of given size or not.
% inputs:
% v: vector
% n: vector size
function v_out = makeColVector(v,n)
[x y] = size(v);
if (( x == 1 && y == n) || (x==n && y == 1))
        if (x==1)
            v_out = v';
        else
            v_out = v;
        end
else
    error(['input vector does not have ' num2str(n) ' elements']);
end
end