clc;
clear;
close all;
ntc = csvread("ntc.csv");
res = ntc(:,2);
t = ntc(:,1);

for i=1:length(res)
ad(i) = 1024 * res(i)/(res(i)+10);
end

p = polyfit(ad, t, 10);
figure();
hold on;
plot(ad,t, 'bo');

ad2 = 0:1023;
t2 = round(polyval(p, ad2), 1);
hold on, plot(ad2, t2, 'r');

dlmwrite('data.dlm', t2*10, ',');

