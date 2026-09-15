%{
Incomplete, couldn't write many lines of code just like Ikrama Sir; missed the function part too
%}
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
