## [Week-8](https://mesbahnaeem.notion.site/Numerical-Integration-194f7d7c7fcd43bba517fa217f529bba?pvs=25): Week08__Numerical_Integration.m
```MATLAB
%%
%Trapezoid Rule (x^3)
clc
clear all
close all
%%
a=3;
b=7;
n=100;
h=(b-a)/n;
x=a:h:b;
f= @(x)(x^3);
result=0;
result=result+f(a)+f(b);
for i=2:length(x)-1
    result=result+2*f(x(i));
end
result=0.5*h*result
%%
trapz(x,x.^3)


%%
%Simpson's 1/3rd Rule (x^3)
a=3;
b=7;
n=100;
h=(b-a)/n;
x=a:h:b;
f= @(x)(x^3);
result=0;
result=f(a)+f(b);
for i=3:2:length(x)-1
    result=result+2*f(x(i));
end
for i=2:2:length(x)-1
    result=result+4*f(x(i));
end
result=(1/3)*h*result


%%
%Simpson's 3/8th Rule (x^3)
a=3;
b=7;
n=99;
h=(b-a)/n;
x=a:h:b;
f= @(x)(x^3);
result=0;
result=result+f(a)+f(b);
for i=2:length(x)-1
   if mod((i-1),3)==0
       result=result+2*f(x(i));
   else
    result=result+3*f(x(i));
   end
end
result=(3/8)*h*result
%%
%------------------------------------


%%
%Trapezoid Rule (cos(x))

%%
a=0;
b=(3/2)*pi;
n=300;
h=(b-a)/n;
x=a:h:b;
f= @(x)(cos(x));
result=0;
result=result+f(a)+f(b);
for i=2:length(x)-1
    result=result+2*f(x(i));
end
result=0.5*h*result
%%
trapz(x,cos(x))


%%
%Simpson's 1/3rd Rule (cos(x))
a=0;
b=(3/2)*pi;
n=300;
h=(b-a)/n;
x=a:h:b;
f= @(x)(cos(x));
result=0;
result=f(a)+f(b);
for i=3:2:length(x)-1
    result=result+2*f(x(i));
end
for i=2:2:length(x)-1
    result=result+4*f(x(i));
end
result=(1/3)*h*result


%%
%Simpson's 3/8th Rule (cos(x))
a=0;
b=(3/2)*pi;
n=300;
h=(b-a)/n;
x=a:h:b;
f= @(x)(cos(x));
result=0;
result=result+f(a)+f(b);
for i=2:length(x)-1
   if mod((i-1),3)==0
       result=result+2*f(x(i));
   else
    result=result+3*f(x(i));
   end
end
result=(3/8)*h*result
```

</br>

## [Week-9](https://mesbahnaeem.notion.site/Differentiation-4d17b467fa0e4a61b536a1f48e30ede2?pvs=25): Week09__Differentiation__Class_Performance.m
```MATLAB
x=4:10;
y=5*x.^3-4*x.^2+2*x+1;
NumericalDifferentiation046(x,y,"forward");
NumericalDifferentiation046(x,y,"backward");
```

</br>

## Week-9: Week09__Differentiation__Main_Code.m
```MATLAB
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
```

</br>

## Week-9: Week09FunctionDifferenceTable202516000.m
```MATLAB
function table = DifferenceTable046(x,y)
table=zeros(length(x),length(x)+1);
table(:,1)=x;
table(:,2)=y;
d=length(x)-1;
for j=3:length(x)+1
    for i=1:d
        table(i,j)=table(i+1,j-1)-table(i,j-1);
    end
    d=d-1;
end
end
```

</br>
