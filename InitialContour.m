function [initialx,initialy] =InitialContour(nPoints,radius,x,y)

th = 0:2*pi/nPoints:(2 * pi)-(2* pi/nPoints );
%I = [ radius * sin( th ) + y ; radius * cos( th ) + x]';
initialx = (radius * sin( th ) + y)';
initialy = (radius * cos( th ) + x)';



