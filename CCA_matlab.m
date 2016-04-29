clear all
close all
%construct a data set satisfy 4*a+3*b=2*c+d
a=rand(100,1);
b=rand(100,1);
c=rand(100,1);
d=4*a+3*b-2*c+0.1*[rand(100,1)-0.5];

% form two set of data [a, b] and [a,d]
X=[a,b];
Y=[c,d];
clear a b c d
[A B r U V] = canoncorr(X, Y);
A(1,1)/A(2,1)
B(1,1)/B(2,1)
corr(U)
corr(V)



[wx, wy, rr]=cca(X',Y');
UU=X*wx;
VV=Y*wy;