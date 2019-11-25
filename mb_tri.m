function [ y ] = mb_tri( x,a ,e)
% x:目前輸入, a:一個範圍, e:是否要三角形(0:是三角形, 1:邊緣的類梯形)
    if e==0
        if  x>=a(1) && x<=a(2) 
            y=(x-a(1))/(a(2)-a(1));
        elseif x>a(2) && x<=a(3)
            y=(x-a(2))/(a(2)-a(3))+1;    
        else
            y=0;
        end
    else
        if  a(2)>=0
            if x>=a(1) && x<=a(2) 
                y=(x-a(1))/(a(2)-a(1));
            elseif x>a(2) 
                y=1;   
            else
                 y=0;
            end    
        else            
            if  x<=a(2) 
                y=1;
            elseif x>a(2) && x<a(3)
                 y=(x-a(2))/(a(2)-a(3))+1;
            else
                 y=0;
            end            
        end 
    end
end

