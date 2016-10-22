function [x,y]  = activeContours2(radius, numIter, nPoints, inputImage,alpha,beta,gamma)
    
[x,y] =  InitialContour(nPoints, radius,50,50);
[n,m] = size(x); 

d = davg(x, y);

Image = rgb2gray(inputImage);
imshow(Image);
hold on;
plot(x(:,1),y(:,1),'g');

for iter=1:numIter
    for i= 1:n

    %   Previous and Post positions
        preX = circshift(x,1);
        preY = circshift(y,1);
        postX = circshift(x,-1);
        postY = circshift(y, -1);
        Cont = Continuity(x(i),y(i),preX(i),preY(i),d);
        Curv = Curvature(x(i),y(i),preX(i),preY(i),postX(i),postY(i));
        Bord =  Border(x(i),y(i),Image);

        En = alpha * Cont + beta * Curv - gamma * Bord;
        [r, c] = find(En == min(min(En)));
        xnew = x(i) + (c(1) - (3+1)/2);
        ynew = y(i) + (r(1) - (3+1)/2);
        x(i) = xnew;
        y(i) = ynew;
    end
    plot(x(:,1),y(:,1),'r');
end
    
end

function [davg] = davg(x, y)
    % Compute pairwise distance in x and y.
	dx = x - circshift(x, 1);
	dy = y - circshift(y, 1);
        
    % Average the pairwise total distance.
	davg = mean(sqrt(dx.^2 + dy.^2));
end


