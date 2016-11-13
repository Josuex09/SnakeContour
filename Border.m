function [B] = Border(x,y,Image)
    
    [Gmag,Gdir] = imgradient(Image,'prewitt');  
    x = round(x);
    y = round(y);
    
    %Matrix with x values
    Mx = ones(3,1) * [-1,0,1] + x;
    %Matrix with y values
    My =  [-1;0;1] * ones(1,3) + y;
    
    B = ones(3,3)-1;
    
    indexX=1;
    indexY=1;
    for i=y:y+2
        for j=x:x+2
            B(indexY,indexX) = Gmag(My(indexY,indexX),Mx(indexY,indexX));
            indexX = indexX+1;
        end
        indexX = 1;
        indexY = indexY+1;
    end
    
    %Normalize
    Max = max(max(B));
    if Max ~= 0 
       B = B/Max; 
    end   
    
end