%1212050156ÐìÃù
close all;clc;clear all;
FGI=figure('position',[200 100 1000 500],'name','Figure Demo','numbertitle','off','toolbar','figure','color',[0.8 0.8 0.8]);
x=-2*pi:pi/8:2*pi;
y=sin(x);
plot(x,y,'-bo','markersize',14,'MarkerEdgeColor','k','MarkerFaceColor','g','linewidth',2);

set(gca,'fontsize',14,'fontname','Times New Roman');%×ÖÌå
%pause;
grid on;
%pause;
hold on;
a=-2*pi:pi/8:2*pi;%x
b=cos(a);%y
plot(a,b,'--rs','markersize',14,'MarkerEdgeColor','r','linewidth',2);
hold on;
%pause;
c=-2*pi:pi/8:2*pi;%x
d=atan(c);%y
plot(c,d,'--y>','markersize',14,'MarkerEdgeColor','y','linewidth',2);
hold off;
xlabel('\bf -2\pi¡Ü¦¨¡Ü2\pi','fontsize',16,'fontname','Arial');
ylabel('\bf Function Value','fontsize',16,'fontname','Arial');
%pause;
axis([-2*pi 2*pi -2 2]);
set(gca,'XTick',[-2*pi:pi/4:2*pi],'YTick',[-2:0.5:2]);
%pause;
set(gca,'xticklabel',{'-2pi','-7pi/4','-3pi/2','-5pi/4','-pi','-3pi/4','-pi/2','-pi/4','0','-pi/4','-pi/2','-3pi/4','-pi','-5pi/4','-3pi/2','-7pi/4','-2pi'});
%pause;
legend('Sin Function','Cos Function','Arctan Function',4);
%pause;
title('\bf 09123456 Name','fontsize',16,'fontname','Arial');