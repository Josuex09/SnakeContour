function [x,y]  = activeContours2(radius, numIter, nPoints, inputImage,alpha,beta,gamma)
    
    [x,y] =  InitialContour(nPoints, radius,50,50);

    [n,m] = size(x); 

    %Get gray image
    Image = rgb2gray(inputImage);
    
    %Show image
    imshow(Image);
    hold on;
    %Show initial contour
    h = plot(x(:,1),y(:,1),'g');

    
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

            En = alpha * Cont + beta * Curv - gamma * Bord;
            [r, c] = find(En == min(min(En)));
            xnew = x(i) + (c(1) - 2);
            ynew = y(i) + (r(1) - 2);
            x(i) = xnew;
            y(i) = ynew;
        end
        disp(strcat('Iter: ',int2str(iter)));
        
        set(h,'YData',y(:,1));
        set(h,'XData',x(:,1));
        drawnow;
        %plot(x(:,1),y(:,1),'r');
    end

end


