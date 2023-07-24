close; clear; clc;
data = load('binary_classification.txt');
x = data(:,1);
x = [x ones(length(x),1)];
y = data(:,2);
t = randn(2,1);
m = length(y);
a = 0.0005;
itr = 25000;
J = [];
plot(x(:,1),y,'or');
for i=1:itr
    h = 1./(1+exp(-x*t));
    Jc = (1/m)*sum(y.*log(h) + (1-y).*log(1-h));
    J = [J Jc];
    t1 = t(1) - (a/m)*sum((h-y).*x(:,1));
    t2 = t(2) - (a/m)*sum(h-y);
    t = [t1;t2];
end
hold
figure;
plot(J);