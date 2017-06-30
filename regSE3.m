function [ ff ] = regSE3( f )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    ff=zeros(6,1);
    r=f(1:3);
    t=f(4:6);
    r=regRot(r);
    ff(1:3)=r;
    ff(4:6)=t;

end

