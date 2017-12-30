%%%%模拟退火算法解决函数极值
clear;close all;clc;
func2=@(x,y)5*cos(x*y)+x*y+y*y*y;
XMAX=5;
XMIN=-5;
YMAX=5;
YMIN=-5;
%%%%%%%%%冷却表参数
L=100;
K=0.99;
S=0.02;
T=100;
YZ=1e-8;
P=0;
%%%%%%%%%%%随机选点初值选定
PreX=rand*(XMAX-XMIN)+XMIN;
PreY=rand*(YMAX-YMIN)+YMIN;
PreBestX=PreX;
PreBestY=PreY;
PreX=rand*(XMAX-XMIN)+XMIN;
PreY=rand*(YMAX-YMIN)+YMIN;
BestX=PreX;
BestY=PreY;
%%%%%%%%每迭代一次退火一次（降温），直到满足迭代条件为止
deta=abs(func2(BestX,BestY)-func2(PreBestX,PreBestY));
while deta>YZ&&T>0.001
    T=T*K;
    %%%%%%%当前温度T下迭代次数
    for i=1:L
        %%%%%%在此点附近随机选下一点
        p=0;
        while p==0
            NextX=PreX+S*(rand*(XMAX-XMIN)+XMIN);
            NextY=PreY+S*(rand*(XMAX-YMIN)+YMIN);
            if NextX>=XMIN && NextX<=XMAX && NextY>=YMIN && NextY<=YMAX
                p=1;
            end
        end
        %%%%%%%%%%%%%是否全局最优解
        if func2(BestX,BestY)>func2(NextX,NextY)
            %%%%%%保留上一个最优解
            PreBestX=BestX;
            PreBestY=BestY;
            %%%%%%此为新的最优解
            BestX=NextX;
            BestY=NextY;
        end
        %%%%%%%%metropolis过程
        if func2(PreX,PreY)-func2(NextX,NextY)>0
            %%%%接受新解
            PreX=NextX;
            PreY=NextY;
            P=P+1;
        else
            changer=-1*(func2(NextX,NextY)-func2(PreX,PreY))/T;
            p1=exp(changer);
            %%%%%%%%%接受较差的解
            if p1>rand
                PreX=NextX;
                PreY=NextY;
                P=P+1;
            end
        end
        trace(P+1)=func2(BestX,BestY);
    end
    deta=abs(func2(BestX,BestY)-func2(PreBestX,PreBestY));
end
disp('最小值在点');
disp(BestX);disp(BestY);
disp('最小值为');
disp(func2(BestX,BestY));
plot(trace(2:end));
xlabel('迭代次数');
ylabel('目标函数值');
title('适应值进化曲线');
