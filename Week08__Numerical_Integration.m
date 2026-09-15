%%
%Trapezoid Rule
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
%Simpson's 1/3rd Rule (Done by the Students themselves)
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