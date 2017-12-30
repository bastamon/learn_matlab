close all;clc;clear all;

x=linspace(1,10,20);%�Ա���1~10֮��20����
figure;
plot(x,x.^2+2*x+0.3,'--bs');
pause;
hold on;%���ĵڶ�������ͬһ��ͼ��(������һ���ߣ�
plot(x,x.^3-x+5,'-.ro');
hold on;
plot(x,x.^4-9,':kp');
hold off;%���ٻ���������
pause;
legend('curve1','curve2','curve3',2);%��ע  ��Ӧ��ͼ˳��  2Ϊ��עλ�ã����Ͻǣ�1~4������ע��0��ʾĬ�����λ��
pause;


FGI=figure('Position',[200 200 700 500],'Name','Figure Demo','NumberTitle','off','ToolBar','none','Color',[0.8 0.8 0.8]);
%position����λ��200 200��ʾ�������½ǵĵ�����Ļ��ߺ�����ľ���  700 500Ϊ���ڵĴ�С
%NameΪ���ô�������  numbertitleΪ�������������ʾΪon�ر�Ϊoff  toolbarΪ�����еĹ�����Ҫ��ʾΪfigure�ر�Ϊnone  
%colorΪ������ɫ0.8 0.8 0.8��ʾ��������Ϻ����ɫ
x=[0:0.2:4.8];%x��ȡֵΪ0~4.8ÿ��0.2ȡһλ
y=2*sign(rand(1,length(x))-0.5).*rand(1,length(x));
plot(x,y,'--rs','MarkerSize',14,'LineWidth',2);%markersize��ע��С linewidth�߿�
pause;
set(gca,'fontsize',14,'fontname','Times New Roman','color','y');% gca��ʾ��ǰͼ�� fontsize��ʾ�����Сfontname��ʾ�������� color�ı䱳����ɫ'
pause;
grid on;%����������
pause;
xlabel('\it S_i','fontsize',16,'fontweight','b','fontname','Arial');%\it��ʾб��  x���עΪSi��_��Ϊ�±�'fontweight','b'��ʾ����Ӵ�
ylabel('\it R^v','fontsize',16,'fontweight','b','fontname','Arial');%y���עΪRv��^��Ϊ�ϱ�
pause;
hold on;
T=0.5;k=8;dt=0.3;t=T:dt:5;
f=log(1+k*(t-T)/(1-T)/log(k+1));
plot(t,f,'-bo','MarkerSize',14,'MarkerEdgeColor','k','MarkerFaceColor','g','LineWidth',2);% makeredgecolor��ʾ��ע��Ե��ɫ makerfacecolor��ʾ��ע�����ɫ
hold off;
pause;
axis([-0.5 5.5 -2.5 3.5]);%����X���귶ΧΪ-0.5~5.5  Y������Ϊ-2.5~2.5
set(gca,'XTick',[-0.5:0.5:5.5],'YTick',[-2.5:0.5:3.5]);%����x���ϵ�����̶ȷ�ΧΪ-0.5~5.5���Ϊ0.5  Y������̶�Ϊ-2.5~3.5���Ϊ0.5
pause;
legend('Curve 1','Curve 2',0);
title('\bf 09123456 Name','fontsize',16,'fontname','Comic Sans MS'); % titleͼ�α���  \bf��ʾ����

