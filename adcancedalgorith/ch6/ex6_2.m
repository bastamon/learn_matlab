clear;close all;clc;
func2=@(x) 3*cos(x(1)*x(2))+x(1)+x(2)^2;
N=100;%群体粒子个数
D=10;%粒子维数
T=200;%最大迭代次数
c1=1.5;%学习因子1
c2=1.5;%学习因子2
Wmax=0.8;%惯性权重最大值
Wmin=0.4;%惯性权重最大值
Xmax=20;%位置最大值
Xmin=-20;%位置最小值
Vmax=10;%速度最大值
Vmin=-10;%速度最小值
%%%%%%%%%初始化种群个体（限定位置和速度）
x=rand(N,D)*(Xmax-Xmin)+Xmin;
v=rand(N,D)*(Vmax-Vmin)+Vmin;
%%%%%%%%%初始化种群个体
x=rand(N,D)*(Xmax-Xmin)+Xmin;
v=rand(N,D)*(Vmax-Vmin)+Vmin;
%%%%%%%%%初始化个体最优位置和最优值
p=x;
pbest=ones(N,1);
for i=1:N
    pbest(i)=func2(x(i,:));
end
%%%%%%%%初始化全局最优位置和最优值
g=ones(1,D);
gbest=inf;
for i=1:N
    if pbest(i)<gbest
        g=p(i,:);
    end
end
gb=ones(1,T);
%%%%%%%%%%按照公式依次迭代知道满足精度或者迭代次数
for i=1:T
    for j=1:N
        %%%%%%%%%%%%%%%%%%%%%%%更新个体最优位置和最优值
        if func2(x(j,:))<pbest(j)
            p(j,:)=x(j,:);
            pbest(j)=func2(x(j,:));
        end
        %%%%%%%%%%更新全局最优位置和最优值
        if pbest(j)<gbest
            g=p(j,:);
            gbest=pbest(j);
        end
        %%%%%%%%计算动态惯性权重值
        w=Wmax-(Wmax-Wmin)*i/T;
        %%%%%%%%%%更新位置和速度值
        v(j,:)=w*v(j,:)+c1*rand*(p(j,:))-x(j,:)+c2*rand*(g-x(j,:));
        x(j,:)=x(j,:)+v(j,:);
        %%%%%%%%边界条件处理
        for ii=1:D
            if v(j,ii)>Vmax||v(j,ii)<Vmin
                v(j,ii)=rand*(Vmax-Vmin)+Vmin;
            end
            if x(j,ii)>Xmax||x(j,ii)<Xmin
                x(j,ii)=rand*(Xmax-Xmin)+Xmin;
            end
        end
    end
    %%%%%%%记录历代全局最优值
    gb(i)=gbest;
end
g;
gb(end);
figure;
plot(gb);
xlabel('迭代次数');
ylabel('适应度值');
title('适应度进化曲线');    