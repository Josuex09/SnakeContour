function [x,y]  = activeContours2(radius, numIter, nPoints, inputImage,alpha,beta,gamma)
    
[x,y] =  InitialContour(nPoints, radius,50,50);
[n,m] = size(x); 

Image = rgb2gray(inputImage);

for iter=1:numIter
    for i= 1:n

    %   Previous and Post positions
        preX = circshift(x,1);
        preY = circshift(y,1);
        postX = circshift(x,-1);
        postY = circshift(y, -1);

        Cont = Continuity(x(i),y(i),preX(i),preY(i));
        Curv = Curvature(x(i),y(i),preX(i),preY(i),postX(i),postY(i));
        Bord =  Border(x(i),y(i),Image);

        En = alpha * Cont + beta * Curv + gamma * Bord;
        [ynew, xnew] = find(En == min(min(En)));
        x(i) = xnew;
        y(i) = ynew;

    end
end
    
end



