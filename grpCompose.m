% compose two elements of group SE(3).
% f1.f2 = [R1*R2, (R1*t2)+t1]
% where, R1,R2 are rotation matrices and t1,t2 are translation vectors.
% But note that the function expects f1 to contain rotation vector instead
% of rotation matrix.
% Inputs:
% f1 -> Element in SE(3) represented as: [r t] where r is a rotation vector
% and t as a translation vector.
% f2 -> Another element in SE(3)
% Outputs:
% f -> Composition of f1 and f2. i.e. f1.f2

function f = grpCompose(f1,f2)
f1 = makeColVector(f1,6);
f2 = makeColVector(f2,6);
R1 = getClosestRotMat(rotMat(f1(1:3))); t1 = f1(4:6);
% R1 = rotMat(f1(1:3)); t1 = f1(4:6);
R2 = getClosestRotMat(rotMat(f2(1:3))); t2 = f2(4:6);
% R2 = rotMat(f2(1:3)); t2 = f2(4:6);
f = zeros(6,1);
f(1:3) = rotVect(R1*R2);
f(4:6) = (R1*t2) + t1;
end