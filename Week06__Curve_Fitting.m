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