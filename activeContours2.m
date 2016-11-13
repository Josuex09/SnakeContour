function []= activeContours2(radius,initialX,initialY, numIter, nPoints, inputImage,alpha,beta,gamma)
    
    %Get initial snake points
    [x,y] =  InitialContour(nPoints, radius,initialX, initialY);
    
    %Get gray image
    Image = rgb2gray(inputImage);
    
    %Show image
    imshow(Image);
    hold on;
    %Show initial contour
    h = plot(x(:,1),y(:,1),'g');

    
    for iter=1:numIter
        for i= 1:nPoints
        %   Previous and Post positions
            preX = circshift(x,1);
            preY = circshift(y,1);
            postX = circshift(x,-1);
            postY = circshift(y, -1);
            
            %Energy values
            Cont = Continuity(x(i),y(i),preX(i),preY(i));
            Curv = Curvature(x(i),y(i),preX(i),preY(i),postX(i),postY(i));
            Bord =  Border(x(i),y(i),Image);
            %Get Energy
            Energy = alpha * Cont + beta * Curv - gamma * Bord;
            [a, b] = find(Energy == min(min(Energy)));
            
            xnew = x(i) + (b(1) - 2);
            ynew = y(i) + (a(1) - 2);
            x(i) = xnew;
            y(i) = ynew;
        end
        disp(strcat('Iter: ',int2str(iter),' Energía: ', num2str(Energy(a,b))));
        set(h,'YData',y(:,1));
        set(h,'XData',x(:,1));
        drawnow;
    end

end


