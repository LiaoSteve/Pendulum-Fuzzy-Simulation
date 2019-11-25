function [ a ,b ] = rule( x, y, mb_x, mb_y, mb_output,ex,ey)    
        a=mb_tri(x,mb_x,ex)* mb_tri(y,mb_y,ey) ;
        b=a*mb_output;      
end

