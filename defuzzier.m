function [ output_args ] = defuzzier( a,b )
    top=0;
    bottom=0;
    for i=1:9
        top=top+b(i);
        bottom=bottom+a(i);
    end
    output_args=top/bottom;
end

