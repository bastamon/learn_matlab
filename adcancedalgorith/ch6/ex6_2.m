clear;close all;clc;
func2=@(x) 3*cos(x(1)*x(2))+x(1)+x(2)^2;
N=100;%Ⱥ�����Ӹ���
D=10;%����ά��
T=200;%����������
c1=1.5;%ѧϰ����1
c2=1.5;%ѧϰ����2
Wmax=0.8;%����Ȩ�����ֵ
Wmin=0.4;%����Ȩ�����ֵ
Xmax=20;%λ�����ֵ
Xmin=-20;%λ����Сֵ
Vmax=10;%�ٶ����ֵ
Vmin=-10;%�ٶ���Сֵ
%%%%%%%%%��ʼ����Ⱥ���壨�޶�λ�ú��ٶȣ�
x=rand(N,D)*(Xmax-Xmin)+Xmin;
v=rand(N,D)*(Vmax-Vmin)+Vmin;
%%%%%%%%%��ʼ����Ⱥ����
x=rand(N,D)*(Xmax-Xmin)+Xmin;
v=rand(N,D)*(Vmax-Vmin)+Vmin;
%%%%%%%%%��ʼ����������λ�ú�����ֵ
p=x;
pbest=ones(N,1);
for i=1:N
    pbest(i)=func2(x(i,:));
end
%%%%%%%%��ʼ��ȫ������λ�ú�����ֵ
g=ones(1,D);
gbest=inf;
for i=1:N
    if pbest(i)<gbest
        g=p(i,:);
    end
end
gb=ones(1,T);
%%%%%%%%%%���չ�ʽ���ε���֪�����㾫�Ȼ��ߵ�������
for i=1:T
    for j=1:N
        %%%%%%%%%%%%%%%%%%%%%%%���¸�������λ�ú�����ֵ
        if func2(x(j,:))<pbest(j)
            p(j,:)=x(j,:);
            pbest(j)=func2(x(j,:));
        end
        %%%%%%%%%%����ȫ������λ�ú�����ֵ
        if pbest(j)<gbest
            g=p(j,:);
            gbest=pbest(j);
        end
        %%%%%%%%���㶯̬����Ȩ��ֵ
        w=Wmax-(Wmax-Wmin)*i/T;
        %%%%%%%%%%����λ�ú��ٶ�ֵ
        v(j,:)=w*v(j,:)+c1*rand*(p(j,:))-x(j,:)+c2*rand*(g-x(j,:));
        x(j,:)=x(j,:)+v(j,:);
        %%%%%%%%�߽���������
        for ii=1:D
            if v(j,ii)>Vmax||v(j,ii)<Vmin
                v(j,ii)=rand*(Vmax-Vmin)+Vmin;
            end
            if x(j,ii)>Xmax||x(j,ii)<Xmin
                x(j,ii)=rand*(Xmax-Xmin)+Xmin;
            end
        end
    end
    %%%%%%%��¼����ȫ������ֵ
    gb(i)=gbest;
end
g;
gb(end);
figure;
plot(gb);
xlabel('��������');
ylabel('��Ӧ��ֵ');
title('��Ӧ�Ƚ�������');    