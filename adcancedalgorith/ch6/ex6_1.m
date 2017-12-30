clear;close all;clc;
%%%%%%%%%��Ӧ�Ⱥ���
func1=@(x)sum(x.^2);

N=100;%Ⱥ�����Ӹ���
D=10;%����ά��
T=200;%����������
c1=1.5;%ѧϰ����1
c2=1.5;%ѧϰ����2
w=0.8;%����Ȩ��
Xmax=20;%λ�����ֵ
Xmin=-20;%λ����Сֵ
Vmax=10;%�ٶ����ֵ
Vmin=-10;%�ٶ���Сֵ
%%%%%%%%%��ʼ����Ⱥ���壨�޶�λ�ú��ٶȣ�
x=rand(N,D)*(Xmax-Xmin)+Xmin;
v=rand(N,D)*(Vmax-Vmin)+Vmin;
%%%%%%%��ʼ����������λ�ú�����ֵ
p=x;
pbest=ones(N,1);
for i=1:N
    pbest(i)=func1(x(i,:));
end
%%%%%%��ʼ��ȫ������λ�ú�����ֵ
g=ones(1,D);
gbest=inf;
for i=1:N
    if pbest(i)<gbest
        g=p(i,:);
        gbest=pbest(i);
    end
end
gb=ones(1,T);
for i=1:T
    for j=1:N
        %%%%%���¸�������λ�ú�����ֵ
        if(func1(x(j,:))<pbest(j))
            p(j,:)=x(j,:);
            pbest(j)=func1(x(j,:));
        end
        %%%%%%%%%%����ȫ������λ�ú�����ֵ
        if pbest(j)<gbest
            g=p(j,:);
            gbest=pbest(j);
        end
        %%%%%%%����λ�ú��ٶ�ֵ
        v(j,:)=w*v(j,:)+c1*rand*(p(j,:)-x(j,:))+c2*rand*(g-x(j,:));
        x(j,:)=x(j,:)+v(j,:);
        %%%%%%%%%%%�߽���������
        for ii=1:D
            if v(j,ii)>Vmax||v(j,ii)<Vmin
                v(j,ii)=rand*(Vmax-Vmin)+Vmin;
            end
            if x(j,ii)>Xmax||x(j,ii)<Xmin
                x(j,ii)=rand*(Xmax-Xmin)+Xmin;
            end
        end
    end
    %%%%%%%%%%��¼����ȫ������ֵ
    gb(i)=gbest;
end
g;%���Ÿ���
gb(end);%����ֵ
figure;
plot(gb);
xlabel('��������');
ylabel('��Ӧ��ֵ');
title('��Ӧ�Ƚ�������');
%%%%%%%%%%%%