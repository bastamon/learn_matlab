close all;clc;clear all;

x=linspace(1,10,20);%自变量1~10之间20个点
figure;
plot(x,x.^2+2*x+0.3,'--bs');
pause;
hold on;%画的第二条线在同一副图中(保留第一条线）
plot(x,x.^3-x+5,'-.ro');
hold on;
plot(x,x.^4-9,':kp');
hold off;%不再画第四条线
pause;
legend('curve1','curve2','curve3',2);%标注  对应画图顺序  2为标注位置：左上角（1~4）不标注或0表示默认最佳位置
pause;


FGI=figure('Position',[200 200 700 500],'Name','Figure Demo','NumberTitle','off','ToolBar','none','Color',[0.8 0.8 0.8]);
%position设置位置200 200表示窗口左下角的点离屏幕左边和下面的距离  700 500为窗口的大小
%Name为设置窗口名字  numbertitle为窗口数字序号显示为on关闭为off  toolbar为窗口中的工具栏要显示为figure关闭为none  
%color为设置颜色0.8 0.8 0.8表示红绿蓝混合后的颜色
x=[0:0.2:4.8];%x的取值为0~4.8每隔0.2取一位
y=2*sign(rand(1,length(x))-0.5).*rand(1,length(x));
plot(x,y,'--rs','MarkerSize',14,'LineWidth',2);%markersize标注大小 linewidth线宽
pause;
set(gca,'fontsize',14,'fontname','Times New Roman','color','y');% gca表示当前图形 fontsize表示字体大小fontname表示字体类型 color改变背景颜色'
pause;
grid on;%加上网格线
pause;
xlabel('\it S_i','fontsize',16,'fontweight','b','fontname','Arial');%\it表示斜体  x轴标注为Si“_”为下标'fontweight','b'表示字体加粗
ylabel('\it R^v','fontsize',16,'fontweight','b','fontname','Arial');%y轴标注为Rv“^”为上标
pause;
hold on;
T=0.5;k=8;dt=0.3;t=T:dt:5;
f=log(1+k*(t-T)/(1-T)/log(k+1));
plot(t,f,'-bo','MarkerSize',14,'MarkerEdgeColor','k','MarkerFaceColor','g','LineWidth',2);% makeredgecolor表示标注边缘颜色 makerfacecolor表示标注填充颜色
hold off;
pause;
axis([-0.5 5.5 -2.5 3.5]);%调整X坐标范围为-0.5~5.5  Y轴坐标为-2.5~2.5
set(gca,'XTick',[-0.5:0.5:5.5],'YTick',[-2.5:0.5:3.5]);%设置x轴上的坐标刻度范围为-0.5~5.5间隔为0.5  Y轴坐标刻度为-2.5~3.5间隔为0.5
pause;
legend('Curve 1','Curve 2',0);
title('\bf 09123456 Name','fontsize',16,'fontname','Comic Sans MS'); % title图形标题  \bf表示黑体

