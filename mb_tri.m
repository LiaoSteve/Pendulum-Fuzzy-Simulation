function [ y ] = mb_tri( x,a ,e)
% x:�ثe��J, a:�@�ӽd��, e:�O�_�n�T����(0:�O�T����, 1:��t�������)
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

