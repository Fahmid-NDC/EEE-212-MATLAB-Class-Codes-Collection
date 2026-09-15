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