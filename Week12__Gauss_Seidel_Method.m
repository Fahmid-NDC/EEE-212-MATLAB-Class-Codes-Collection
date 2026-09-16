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
