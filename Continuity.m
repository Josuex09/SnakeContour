function [Cont] = Continuity(x,y,preX,preY,d)
    %neighbors size = 3
    
    %Matrix with x values
    Mx = ones(3,1) * [-1,0,1] + x;
    %Matrix with y values
    My =  [-1;0;1] * ones(1,3) + y;  
    
    
    %Difference in x
    Dx = (Mx - preX).^2;
    %Difference in y
    Dy = (My - preY).^2;
    
    %Continuity
    Cont =Dx+ Dy;
 

    %Normalize

    Max = max(max(Cont));
    if Max ~= 0 
        Cont = Cont / Max;
    end
    

end