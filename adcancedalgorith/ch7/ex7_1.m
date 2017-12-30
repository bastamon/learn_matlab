clear;close all;clc;
func1=@(x)sum(x.^2);
D=10;%变量维数
Xs=20;%上限
Xx=-20;%下限
L=200;%马可夫链
K=0.998;%衰减参数
S=0.01;%步长因子
T=100;%初始温度
YZ=1e-8;%容差
P=0;%Metropolis过程中总接收点
%%%%%随机选点处置设定
PreX=rand(D,1)*(Xs-Xx)+Xx;
PreBestX=PreX;
PreX=rand(D,1)*(Xs-Xx)+Xx;
BestX=PreX;
%%%%%%%%%每迭代一次退火一次（降温），直到满足迭代条件为止
deta=abs(func1(BestX)-func1(PreBestX));
while deta>YZ && T>0.001
    T=K*T;
    %%%%%%在当前温度T下迭代
    for i=1:L
        %%%%%%%%在此点附近随机选下一点
        NextX=PreX+S*(rand(D,1)*(Xs-Xx)+Xx);
        %%%%%%边界条件处理
        for ii=1:D
            if NextX(ii)>Xs || NextX(ii)<Xx
                NextX(ii)=PreX(ii)+S*(rand*(Xs-Xx)+Xx);
            end
        end
        %%%%%%%%%是否全局最优解
        if func1(BestX)>func1(NextX)
            %%%%%%%保留上一个最优解
            PreBestX=BestX;
            %%%%%%%%此为新的最优解
            BestX=NextX;
        end
        %%%%%%%%%%%Metropolis过程
        if func1(PreX)-func1(NextX)>0
            %%%%%%接收新解
            PreX=NextX;
            P=P+1;
        else
            changer=-1*(func1(NextX)-func1(PreX))/T;
            p1=exp(changer);
            %%%%%%%%%%%接受较差的解
            if p1>rand
                PreX=NextX;
                P=P+1;
            end
        end
        trace(P+1)=func1(BestX);
    end
    deta=abs(func1(BestX)-func1(PreBestX));
end
disp('最小值在点:');
disp(BestX);
disp('最小值为:');
disp(func1(BestX));
figure
plot(trace(2:end))
xlabel('迭代次数');
ylabel('目标函数值');
title('适应度进化曲线');

        