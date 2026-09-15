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