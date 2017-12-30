clear;close all;clc;
func2=@(x) 3*cos(x(1)*x(2))+x(1)+x(2)^2;
N=100;%Ⱥ�����Ӹ���
D=20;%����ά��
T=200;%����������
c1=1.5;%ѧϰ����1
c2=1.5;%ѧϰ����2
Wmax=0.8;%����Ȩ�����ֵ
Wmin=0.4;%����Ȩ�����ֵ
Xs=9;%λ�����ֵ
Xx=0;%λ����Сֵ
Vmax=10;%�ٶ����ֵ
Vmin=-10;%�ٶ���Сֵ
%%%%%%%%%��ʼ����Ⱥ���壨�޶�λ�ú��ٶȣ�
x=randint(N,D);
v=rand(N,D)*(Vmax-Vmin)+Vmin;
%%%%%%%%%%%��ʼ����������λ�ú�����ֵ
p=x;
pbest=ones(N,1);
for i=1:N
    pbest(i)=func3(x(i,:),Xs,Xx);
end
%%%%%%%��ʼ��ȫ������λ�ú�����ֵ
g=ones(1,D);
gbest=inf;

for i=1:N
    if pbest(i)<gbest
        g=p(i,:);
        gbest=pbest(i);
    end
end
gb=ones(1,T);
%%%%%%%���չ�ʽ���ε���ֱ��������Ȼ��ߵ�������
for i=1:T
    for j=1:N
        %%%%%%%%%%%���¸�������λ�ú�����ֵ
        if func3(x(j,:),Xs,Xx)<pbest(j)
            p(j,:)=x(j,:);
            pbest(j)=func3(x(j,:),Xs,Xx);
        end
        %%%%%%%%%%����ȫ������λ�ú�����ֵ
        if pbest(j)<gbest
            g=p(j,:);
            gbest=pbest(j);
        end
        %%%%%%%%���㶯̬����Ȩ��ֵ
        w=Wmax-(Wmax-Wmin)*i/T;
        %%%%%%%%%%����λ�ú��ٶ�ֵ
        v(j,:)=w*v(j,:)+c1*rand*(p(j,:)-x(j,:))+c2*rand*(g-x(j,:));
        %%%%%%%%%�߽���������
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
xlabel('��������');
ylabel('��Ӧ��ֵ');
title('��Ӧ�Ƚ�������');
        