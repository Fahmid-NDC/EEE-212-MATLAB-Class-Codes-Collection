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