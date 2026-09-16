function sum = NumericalDifferentiation046(x,y,method)
t=DifferenceTable046(x,y)
sum=0;
h=x(2)-x(1);
n = length(x);
if method=="forward"
    for i=1:length(x)-1
        sum=sum+((-1)^(i+1))*t(1,i+2)/i;
    end
elseif method=="backward"
    for i=1:n-1
        sum=sum+t(n-i,i+2)/i;
    end
else
    disp("Wrong Method")
end
sum=sum/h
end