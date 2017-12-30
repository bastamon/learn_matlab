% clear all;
clc;close all;
%%%%%%%%适应度函数
func=@(x,y)20*(x^2-y^2)^2-(1-y)^2-3*(1+y)^2+0.3;
% pause;    
m=20;
G=200;
Rho=0.9;
P0=0.2;
XMAX=5;
XMIN=-5;
YMAX=5;
YMIN=-5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X=zeros(m,2);
Tau=zeros(m,1);
for i=1:m
    X(i,1)=(XMIN+(XMAX-XMIN)*rand);
    X(i,2)=(YMIN+(YMAX-YMIN)*rand);
    Tau(i)=func(X(i,1),X(i,2));
end
step=0.1;
P=zeros(G,m);
trace=zeros(1,G);
for NC=1:G
    lamda=1/NC;
    [Tau_best,BestIndex]=min(Tau);
    %%%%%%%%%%%%%%%%计算转移状态概率
    for i=1:m
        P(NC,i)=(Tau(BestIndex)-Tau(i))/Tau(BestIndex);
    end
    %%%%%%%%%%%%%%%%%%%%%位置更新
    for i=1:m
       %%%%%%%%%%%%%%%局部搜索
       if P(NC,i)<P0
           temp1=X(i,1)+(2*rand-1)*step*lamda;
           temp2=X(i,2)+(2*rand-1)*step*lamda;
       else
           %%%%%%%%%%%%%%%全局搜索
           temp1=X(i,1)+(XMAX-XMIN)*(rand-0.5);
           temp2=X(i,2)+(YMAX-YMIN)*(rand-0.5);
       end
       %%%%%%%%%%%%%边界处理
       if temp1<XMIN
           temp1=XMIN;
       end
       if temp1>XMAX
           temp1=XMAX;
       end
       if temp2<YMIN
           temp2=YMIN;
       end
       if temp2>YMAX
           temp2=YMAX;
       end
    end
     %%%%%%%判断蚂蚁是否移动
    for i=1:m
        Tau(i)=(1-Rho)*Tau(i)+func(X(i),X(i,2));
    end
	[value,index]=min(Tau);
	trace(NC)=func(X(index,1),X(index,2));
end
[min_value,min_index]=min(Tau);
minX=X(min_index,1);
minY=X(min_index,2);
minValue=func(X(min_index,1),X(min_index,2));
figure
plot(trace)
xlabel('搜索次数');
ylabel('适应度值');
title('适应度进化曲线');
%%%%%%%%%%%%适应度函数
%     function value =func(x,y);
%         value =20*(x^2-y^2)^2-(1-y)^2-3(1+y)^2+0.3;
%     end
% Syms value x y

    