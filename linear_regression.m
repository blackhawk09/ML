close; clear; clc;
data = xlsread('Housing.csv');
x = data(:,1:length(data(1,:))-1);
y = data(:,length(data(1,:)));
x = [x ones(length(x),1)];
t = ones(length(data(1,:)),1);
m = length(x);
iterations = 1500;
alpha  = 0.00000005;
J=[];
temp = zeros(length(data(1,:)),1);
for i = 1:iterations
    h = x*t;
    Jc = (1/2*m)*sum((h-y).^2);
    J = [J Jc];
    for j = 1:(length(data(1,:))-1)
        temp(j) = t(j) - alpha/m*sum((h-y).*x(:,j));
    end
    temp(length(temp)) = t(length(temp)) - alpha/m*sum((h-y));
    t = temp;
end

