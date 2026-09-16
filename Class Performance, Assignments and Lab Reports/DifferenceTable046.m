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