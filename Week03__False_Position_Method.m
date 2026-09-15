%Solution of Non Linear Equation: False Position Method
%%
clc
close all
clear all
%%
format long
syms x
f(x) = x^4 + 3*x^3 - 8*x^2 - 6*x + 1;
%%
fplot(f,[1.5, 2.5]) %[-3, 3]
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
%%
x_p = input('Enter the value of positive bound:'); %2.2
x_n = input('Enter the value of negative bound:'); %1.9
tol = 10^-5;
n = 50;
%%
for i=1:n
x_t = ((x_p*f(x_n))-(x_n*f(x_p)))/(f(x_n)-f(x_p));
fprintf('x_t%d = %.14f\n', i, x_t)
    if abs(f(x_t)) < tol
        break
    end

    if f(x_n)*f(x_t)<0
        x_p = x_t;
    else
        x_n = x_t;
    end
end
%%
p = sym2poly(f);
r = roots(p)