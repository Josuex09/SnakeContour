function [Curv] = Curv(x,y,preX,preY,postX,postY)
    %neighbors size = 3
    
    %Matrix with x values
    Mx = ones(3,1) * [-1,0,1] + x;
    %Matrix with y values
    My =  [-1;0;1] * ones(1,3) + y;
    
    %Difference in x
    Cx = (preX - 2 * Mx + postX).^2;
    %Difference in y
    Cy = (preY - 2 * My + postY).^2;
    
    
    
    %Continuity
    Curv = Cx + Cy; 
    
    %Normalize

    Max = max(max(Curv));
    if Max ~= 0 
        Curv = Curv/Max; 
    end
    
end