# EEE-212-MATLAB-Class-Codes-Collection  
## [Week-1](https://app.notion.com/p/1-Introduction-to-MATLAB-37e7da57849980639a0eca9969e1c9f2?pvs=25): Week01__Introduction_to_MATLAB.m (Incomplete, couldn't write many lines of code just like Ikrama Sir; missed the function part too)
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

## [Week-2](https://mesbahnaeem.notion.site/Root-of-Non-Linear-Equation-Newton-Raphson-Method-b0d1ea92202b4f34abfa331d4b5c1c67?pvs=25): Week02__Newton_Raphson_Method.m
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

## [Week-3](https://mesbahnaeem.notion.site/Solution-of-Non-Linear-Equation-False-Position-Method-3555498bfee645d7af9b71995faa1b01?pvs=25): Week03__False_Position_Method.m
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

## [Week-4](https://mesbahnaeem.notion.site/Interpolation-f78f7a315c5b4c73b90a4c2900d78adc?pvs=25): Week04__Interpolation.m
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

## [Week-6](https://mesbahnaeem.notion.site/Curve-Fitting-53b57f97dba94357a2e913e8134d3dd8?pvs=25): Week06__Curve_Fitting.m
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

</br>

## [Week-8](https://mesbahnaeem.notion.site/Numerical-Integration-194f7d7c7fcd43bba517fa217f529bba?pvs=25): Week08__Numerical_Integration.m
```MATLAB
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
```

</br>

## [Week-9](https://mesbahnaeem.notion.site/Differentiation-4d17b467fa0e4a61b536a1f48e30ede2?pvs=25): Week09__Differentiation__Class_Performance.m
```MATLAB
x=4:10;
y=5*x.^3-4*x.^2+2*x+1;
Week09FunctionNumericalDifferentiationClassPerformance202516000(x,y);
```

</br>

## Week-9: Week09__Differentiation__Main_Code.m
```MATLAB
%%
x=4:10;
y=5*x.^3-4*x.^2+2*x+1;
%%
t=Week09FunctionDifferenceTable202516000(x,y)
sum=0;
h=x(2)-x(1);
for i=1:length(x)-1
    sum=sum+((-1)^(i+1))*t(1,i+2)/i;
end
sum=sum/h
```

</br>

## Week-9: Week09FunctionDifferenceTable202516000.m
```MATLAB
function table = Week09FunctionDifferenceTable202516000(x,y)
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

## Week-9: Week09FunctionNumericalDifferentiationClassPerformance202516000.m
```MATLAB
function sum = Week09FunctionNumericalDifferentiationClassPerformance202516000(x,y)
t=Week09FunctionDifferenceTable202516000(x,y)
sum=0;
h=x(2)-x(1);
for i=1:length(x)-1
    sum=sum+((-1)^(i+1))*t(1,i+2)/i;
end
sum=sum/h
end
```

</br>

## [Week-11](https://mesbahnaeem.notion.site/Gauss-Jordan-Elimination-1a2e5201bd2640449da73fbba5a33e8f?pvs=25): Week11__Gauss_Jordan_Elimination__Class_Performance.m
```MATLAB
clc
clear all
close all

A= [0.15, -0.1, -0.05;
    -0.1, 0.145, -0.025;
    -0.05, -0.025, 0.075];
b=[5, 0, 2];

G=[A b'];

n=length(A);


for i=1:n
    
    if (G(i,i)==0)
        
        temp=G(i+1,:);
        G(i+1,:)=G(i,:);
        G(i,:)=temp;
        
    end
    
end



for i=1:n
    G(i,:)=G(i,:)/G(i,i);
    
    for j=1:n
        
        if j~=i
           
            G(j,:)=G(j,:)-(G(j,i)*G(i,:));
        end
        
    end
end

G

G(:,n+1)
```

</br>

## [Week-12](https://mesbahnaeem.notion.site/Gauss-Seidel-Method-306f3e144f7545bdb3d8ce15fa1c9fb4?pvs=25): Week12__Gauss_Seidel_Method.m
```MATLAB
clc
clear all
close all


%% Declare Matrix
A=[9 2 3;
   1 12 9;
   4 6 14];
b=[7 2 1];

Ab=[A b'];
 
%% Find Dimension of the Matrix
[n1,n2]=size(Ab);

%% Initialize  
var_new = zeros(1,n1);
var_old = zeros(1,n1);

 
tolerance= 0.001;
max_err= 5000;

while (max_err>tolerance)

    for i=1:n1
        var_old(i)=var_new(i);
        s=0;
        for j=1:n1
            
            if(j~=i)
             
                s=s+Ab(i,j)*var_new(j);
             
            end
                
        end
        var_new(i) = (Ab(i,end) -s)/Ab(i,i);
        err(i) = abs(var_new(i)-var_old(i));
    end
    max_err= max(err);
    
end       

var_new
```

</br>

### All the above codes Alhamdulillah have been uploaded by me in Google Drive: [Codes Given in Class](https://drive.google.com/drive/folders/1wHJ88-FhqyoAIbyQq_UmVpV68Aym4PQf)
