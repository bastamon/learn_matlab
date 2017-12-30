close all;clc;
load ex9_2;
%%%%%%原始数据归一化
pmax=max(max(p));
pmin=min(min(p));
P=(p-pmin)./(pmax-pmin);%输入数据矩阵
tmax=max(t);
tmin=min(t);
T=(t-tmin)./(tmax-tmin);%目标数据向量
%%%%%%%%%%创建一个新的前向神经网络
net=newff(minmax(P),[5,1],{'tansig','logsig'},'traingdx');%5x1?隐含层5点,输出层1点
%%%%%%%%%%设置训练参数
net.trainParam.show=50;%显示中间结果周期
net.trainParam.lr=0.05;%学习率
net.trainParam.epochs=1000;%最大迭代次数
net.trainParam.goal=1e-3;%目标误差
%%%%%%%%%%%%%调用TRAINGDM算法训练BP网络
[net,tr]=train(net,P,T);
%%%%%%%%%%%%%%对BP网络进行仿真
A=sim(net,P);
%%%%%%%%%%%%%%%%计算运算数据原始值
a=A.*(tmax-tmin)+tmin;
%%%%%%%%%%%%%绘制实际值和预测值
x=4:12;
figure
plot(x,t,'+');
hold on;
plot(x,a,'or');
hold off
xlabel('月份');
ylabel('销量');
legend('实际销量','预测销量');