%target is the movement of a number at field X,Y into a field of an area
% we choose exactly 1 target for a number on field X,Y

%Question 1
1{target(X,Y,DX,DY) : area(DX,DY,Z)}1 :- number(X,Y,Z').

:- target(X,Y,DX,DY), X!=DX, Y!=DY.

#show target/4.
