%Root of Non-Linear Equation: Newton Raphson Method
%%
clc
close all %Closes all open figure windows except this open one
clear all %Workspace er memory te ja ja chilo shob delete kore dey
%%
format long %decimal er por onek shongkha dekhar jonno use kora hoy, decimal er por 15 ta
syms f(x) %It is a symbolic function, eita declare kore; function tar variable holo x
f(x) = x^3-2*x^2+1*x-3
%%
fplot(f,[-10,10])
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
%%
df = diff(f,x);
x_o=i; %x_o=0.05 %x_o=i
tol=10^-5;
n=50;
%%
for i = 1 :1: n
    x_i = x_o - (f(x_o)/df(x_o));
    % if abs (x_i-x_0)<tol
    if abs (f(x_i))<tol
        disp(double(x_i))
        break
    end
    x_o=x_i;
end
%%
p = sym2poly(f) %coefficient guloke matrix hishebe ney, from the given polynomial
r = roots(p)