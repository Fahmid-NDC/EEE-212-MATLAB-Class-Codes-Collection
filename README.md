# EEE-212-MATLAB-Class-Codes-Collection  
## Week-1
```MATLAB
1^1 Matrix 
a = 5

Vector
a = [1 2 3 4 5]
b = [6, 7, 8, 9, 10]

xyz = 1:100

xyz2 = 1:2:100

xyz3 = 1:3:100

y = 0:0.01:0.1

que = 100:-1:1

v4 = linspace(0, 26, 5)

Indexing
a = 1:10;
b = a(5)

c = rand([1 1000])
d = c(501:2:end)

p = [2, 4, 5;
    6, 7, 8;
    10, 11, 12]

p(2, 2)
p(2)
a = p(2,:)
b = p(:,end)
b = p

a
b
c

x =[34 45 67;78 90 12;23 99 21];
x

zeros(2,3)
ones(5,4)

rand(2,2)

a = rand(2,2)
b = randi(2,2)

a + b
a - b
a * b
a * b

x = 1:3
x(4) = 4

c = [a;b]
d = [a, b]

d(3) = []

c

f1 = c>1

c(f1)

pos = find(f1)

[row, col] = find(f1)

temperature = input("enter the temperature");

if temperature >= 30
    disp('It is hot outside. Turn on the AC.');
elseif temperature >= 20 && temperature < 30
    disp('The weather is perfect. Open the windows.');
else
    disp('It is cold outside. Turn on the heater.');
end

if x>5
    x = x + 5;
elseif x<5 && x>4
    x = x+6;
elseif x<4 && x>3
    x = x+7;
else
    x=8;
end

x=5;
y=4;

```

</br>

## Week-2
```MATLAB
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
```

</br>

## Week-3
```MATLAB
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
```

</br>

## Week-4
```MATLAB
%{
EECE 212 Interpolation, EI LAB theke at least 1 ta question thakbe in lab test out of 3, either forward or backward interpolation
%}
%%
clc
close all
clear all
%%
x = [1891 1901 1911 1921 1931];
y = [46 66 81 93 101];
n = length(x);
%% difference table
t = zeros(n,n+1); %Initializing the difference table
t(:,1) = x; %1st col of difference table
t(:,2) = y; %2nd col of difference table
dd = n-1; %for n rows differences are (n-1) col
for j = 3: n+1 %col of difference table
    for i = 1:dd %row of difference table
        t(i,j) = t(i+1,j-1)-t(i,j-1);
    end
    dd = dd-1;   %as row decreasing
end

%% forward
sumf = y(1);
h = x(2)-x(1); %to find p
vf=1895; %unknown as coordinate
p = (vf-x(1))/h; %x-x(1)/h
for i = 1:n-1
    prod = 1;
    for j = 1:i
        prod = prod*(p-(j-1)); %p(p-1)(p-2)
    end
    sumf = sumf + prod*t(1,i+2)/factorial(i); %summation
end
disp('Interpolation using Forward Difference Table')
sumf

%% backward
sumb = y(n);
h = x(2)-x(1);
vp = 1925;
p = (vp-x(n))/h; %x-x(n)/h
z=n;
for i = 1:n-1
    prod = 1;
    for j = 1:i
        prod = prod*(p+(j-1)); %p(p+1)(p+2)
    end
    z=z-1;
    sumb = sumb + prod*t(z,i+2)/factorial(i); %summation
end
disp('Interpolation using Backward Difference Table')
sumb

%% Lagrange
x=[0,1,2,4];
y=[2,5,9,16];
n = length(x);
vl = 3;
suml = 0;
for i = 1:n
    p = 1;
    q = 1;
    for j = 1:n
        if i~=j
            p = p *(vl-x(j));
            q= q*(x(i)-x(j));
        end
    end
    suml = suml + p*y(i)/q;
end
disp('Interpolation using Lagrange Method')
suml

%% using builtin function
output = spline(x,y,3) %1895,1925

%{
exam-e bola thakbe na je kon method diye ei problem korte hobe, 
just bola thakbe je ei "interval" deowa holo, 
ekhon ei interval er jonno value ber koro
%}
```

</br>

## Week-6
```MATLAB
clc
clear
close all

x = [1 2 3 4 5];
y = [8 26 46 76 119];

q = input('No. of order = ');

A = zeros(q+1,q+1);
B = zeros(q+1,1);

%% Construct Normal Equation Matrix
for k = 1:q+1
    for j = 1:q+1
        A(k,j) = sum(x.^(k+j-2));
    end
end

%% Construct Right-Hand Side Vector
for k = 1:q+1
    B(k) = sum((x.^(k-1)).*y);
end

%% Solve using MATLAB built-in function
G = [A B]
var = A \ B;

disp('Polynomial Coefficients:')
disp(var)

%% Predict values
y_d = zeros(size(x));

for i = 1:q+1
    y_d = y_d + var(i)*x.^(i-1);
end

%% Display equation
fprintf('\nPolynomial Equation:\n');
fprintf('y = %.4f', var(1));

for i = 2:q+1
    fprintf(' + %.4f*x^%d', var(i), i-1);
end
fprintf('\n');

%% Plot
figure
plot(x, y, 'ro', 'MarkerFaceColor', 'r')
hold on
plot(x, y_d, 'b-', 'LineWidth', 2)
grid on
xlabel('x')
ylabel('y')
legend('Original Data', 'Curve Fit', 'Location', 'best')
title('Polynomial Curve Fitting')
```
