close all;clc;
load ex9_2;
%%%%%%ԭʼ���ݹ�һ��
pmax=max(max(p));
pmin=min(min(p));
P=(p-pmin)./(pmax-pmin);%�������ݾ���
tmax=max(t);
tmin=min(t);
T=(t-tmin)./(tmax-tmin);%Ŀ����������
%%%%%%%%%%����һ���µ�ǰ��������
net=newff(minmax(P),[5,1],{'tansig','logsig'},'traingdx');%5x1?������5��,�����1��
%%%%%%%%%%����ѵ������
net.trainParam.show=50;%��ʾ�м�������
net.trainParam.lr=0.05;%ѧϰ��
net.trainParam.epochs=1000;%����������
net.trainParam.goal=1e-3;%Ŀ�����
%%%%%%%%%%%%%����TRAINGDM�㷨ѵ��BP����
[net,tr]=train(net,P,T);
%%%%%%%%%%%%%%��BP������з���
A=sim(net,P);
%%%%%%%%%%%%%%%%������������ԭʼֵ
a=A.*(tmax-tmin)+tmin;
%%%%%%%%%%%%%����ʵ��ֵ��Ԥ��ֵ
x=4:12;
figure
plot(x,t,'+');
hold on;
plot(x,a,'or');
hold off
xlabel('�·�');
ylabel('����');
legend('ʵ������','Ԥ������');