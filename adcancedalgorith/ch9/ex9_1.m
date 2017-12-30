close all;clc;
%%%%%%%%%%%定义训练样本矢量
%%%%%%%%P为输入矢量
P=(-1:0.05:1);%样本X
%%%%%%%%%%%%%% T为目标矢量
T=sin(2*pi*P)+0.1*randn(size(P));%样本Y
%%%%%%%%%%绘制样本数据点
figure(1);
plot(P,T,'+');%样本坐标
hold on;
plot(P,sin(2*pi*P),':');
%%%%%%%%%%%%%绘制不含噪声输入的正弦曲线
net=newff(minmax(P),[20,1],{'tansig','purelin'});%20x1?隐含层20点,输出1点
%%%%%%%%%采用贝叶斯正则化算法trainer
net.trainFcn='trainbr';
%%%%%%%%%%%设置训练参数
net.trainParam.show=50;%显示中间结果周期
net.trainParam.lr=0.05;%学习率
net.trainParam.epochs=500;%最大迭代次数
net.trainParam.goal=1e-3;%目标误差
%%%%%%%%%用相应算法训练BP网络
[net,tr]=train(net,P,T);
%%%%%%%%%%%%对BP网络进行仿真
A=sim(net,P);
E=T-A;
MSE=mse(E);
%%%%%%%%绘制匹配结果图曲线
plot(P,A,P,T,'+',P,sin(2*pi*P),':');
legend('样本点','标准正弦曲线','拟合正弦曲线');