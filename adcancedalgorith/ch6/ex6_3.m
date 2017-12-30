clear;close all;clc;
func2=@(x) 3*cos(x(1)*x(2))+x(1)+x(2)^2;
N=100;%群体粒子个数
D=20;%粒子维数
T=200;%最大迭代次数
c1=1.5;%学习因子1
c2=1.5;%学习因子2
Wmax=0.8;%惯性权重最大值
Wmin=0.4;%惯性权重最大值
Xs=9;%位置最大值
Xx=0;%位置最小值
Vmax=10;%速度最大值
Vmin=-10;%速度最小值
%%%%%%%%%初始化种群个体（限定位置和速度）
x=randint(N,D);
v=rand(N,D)*(Vmax-Vmin)+Vmin;
%%%%%%%%%%%初始化个体最优位置和最优值
p=x;
pbest=ones(N,1);
for i=1:N
    pbest(i)=func3(x(i,:),Xs,Xx);
end
%%%%%%%初始化全局最优位置和最优值
g=ones(1,D);
gbest=inf;

for i=1:N
    if pbest(i)<gbest
        g=p(i,:);
        gbest=pbest(i);
    end
end
gb=ones(1,T);
%%%%%%%按照公式依次迭代直到满足进度或者迭代次数
for i=1:T
    for j=1:N
        %%%%%%%%%%%更新个体最优位置和最优值
        if func3(x(j,:),Xs,Xx)<pbest(j)
            p(j,:)=x(j,:);
            pbest(j)=func3(x(j,:),Xs,Xx);
        end
        %%%%%%%%%%更新全局最优位置和最优值
        if pbest(j)<gbest
            g=p(j,:);
            gbest=pbest(j);
        end
        %%%%%%%%计算动态惯性权重值
        w=Wmax-(Wmax-Wmin)*i/T;
        %%%%%%%%%%更新位置和速度值
        v(j,:)=w*v(j,:)+c1*rand*(p(j,:)-x(j,:))+c2*rand*(g-x(j,:));
        %%%%%%%%%边界条件处理
        for ii=1:D
            if v(j,ii)>Vmax||v(j,ii)<Vmin
                v(j,ii)=rand*(Vmax-Vmin)+Vmin;
            end
        end
        vx(j,:)=1./(1+exp(-v(j,:)));
        for jj=1:D
            if vx(j,jj)>rand
                x(j,jj)=0;
            end
        end
    end
    gb(i)=gbest;
end
g;
m=0;
for j=1:D
    m=g(j)*2^(j-1)+m;
end
f1=Xx+m*(Xs-Xx)/(2^D-1);
figure;
plot(gb);
xlabel('迭代次数');
ylabel('适应度值');
title('适应度进化曲线');
        