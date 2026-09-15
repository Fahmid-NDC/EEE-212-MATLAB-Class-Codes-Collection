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
