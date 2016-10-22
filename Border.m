function [B] = Border(x,y,Image)
    
    [Gmag,Gdir] = imgradient(Image,'prewitt');  
    %BorderImage = edge(Image);
    
    %neighbors size = 3
    
    %Matrix with x values
    Mx = ones(3,1) * [-1,0,1] + x;
    %Matrix with y values
    My =  [-1;0;1] * ones(1,3) + y;
    
    B = ones(3,3)-1;
    
    indexX=1;
    indexY=1;
    for i=y:y+3
        for j=x:x+3
            B(indexY,indexX) = Gmag(My(indexY,indexX),Mx(indexY,indexX));
            indexX = indexX+1;
        end
        indexX = 1;
        indexY = indexY+1;
    end
    
    Max = max(max(B));
    if Max ~= 0 
       B = B/Max; 
    end   
    
end