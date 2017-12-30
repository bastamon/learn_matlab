close all;clc;
%%%%%%%%%%%����ѵ������ʸ��
%%%%%%%%PΪ����ʸ��
P=(-1:0.05:1);%����X
%%%%%%%%%%%%%% TΪĿ��ʸ��
T=sin(2*pi*P)+0.1*randn(size(P));%����Y
%%%%%%%%%%�����������ݵ�
figure(1);
plot(P,T,'+');%��������
hold on;
plot(P,sin(2*pi*P),':');
%%%%%%%%%%%%%���Ʋ��������������������
net=newff(minmax(P),[20,1],{'tansig','purelin'});%20x1?������20��,���1��
%%%%%%%%%���ñ�Ҷ˹�����㷨trainer
net.trainFcn='trainbr';
%%%%%%%%%%%����ѵ������
net.trainParam.show=50;%��ʾ�м�������
net.trainParam.lr=0.05;%ѧϰ��
net.trainParam.epochs=500;%����������
net.trainParam.goal=1e-3;%Ŀ�����
%%%%%%%%%����Ӧ�㷨ѵ��BP����
[net,tr]=train(net,P,T);
%%%%%%%%%%%%��BP������з���
A=sim(net,P);
E=T-A;
MSE=mse(E);
%%%%%%%%����ƥ����ͼ����
plot(P,A,P,T,'+',P,sin(2*pi*P),':');
legend('������','��׼��������','�����������');