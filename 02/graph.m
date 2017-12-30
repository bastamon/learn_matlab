%ÐìÃù
%1212050156
clear all;clc;close all;
%bar
Y=10*rand(3,5);
figure;

bh=bar(Y);
set(gca,'XTickLabel',{'Asian','Europe','America'});
ylim([0,max(max(Y))+1]);
legend('Google','Apple','Microsoft','Amazon','Baidu',-1);

pause;
%pie
clear all;
y=rand(1,8);
figure;
pie3(y,[0 1 1 0 0 0 1 0],{'English','Math','Chinese','Geology','Chemisty','Physics','Biology','Phmacy'});

pause;
%stem
x=linspace(5,20,15);
y=x.^3+x.^2-1;
figure;
stem(x,y,'filled','-rs');
axis([5 21 140 8400]);
pause;