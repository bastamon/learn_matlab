close all;clc;%%%%%%%%%%%%TSP旅行商问题
m=50;%%%%%%%蚂蚁个数
Alpha=1;%%%%%%%%%%%%5信息素重要程度参数
Beta=5;%%%%%%%%启发式银子重要程度参数
Rho=0.1;%%%%%%%%%%%信息素蒸发系数
G=200;%%%%%%%%%最大迭代次数
Q=100;%%%%%%%%%信息素增加强度系数
x=xlsread('ex5_1.xlsx','sheet1','A1:A31');
y=xlsread('ex5_1.xlsx','sheet1','b1:b31');
C=[x y];%%%%%%%%%%%31个省会
clear x y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第一步:变量初始化
n=size(C,1);%n表示问题规模
D=zeros(n,n);%D表示两个城市距离间隔矩阵
for i=1:n
    for j=1:n
        if i~=j
            D(i,j)=((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2)^0.5;
        else
            D(i,j)=eps;
        end
        D(j,i)=D(i,j);        
    end    
end
Eta=1./D;%ETa启发因子,这里设为距离的倒数
Tau=ones(n,n);%Tau为信息素矩阵
Tabu=zeros(m,n);
NC=1;
R_best=zeros(G,n);
L_best=inf.*ones(G,1);
figure(1);
while NC<=G
   %%%%%%%%%%%第二步:将m只蚂蚁放到n个城市上
   Randpos=[];
   for i=1:(ceil(m/n))
      Randpos=[Randpos,randperm(n)]; 
   end
   Tabu(:,1)=(Randpos(1,1:m))';
   %%%%%%%%第三步:m只蚂蚁按概率函数选择下一座城市,完成各自的周游
   for j=2:n
       for i=1:m
           visited=Tabu(i,1:(j-1));
           J=zeros(1,(n-j+1));
           P=J;
           Jc=1;
           for k=1:n
               if isempty(find(visited==k,1))%%%%%%%length(find(visited==k))==0
                   J(Jc)=k;
                   Jc=Jc+1;
               end
           end
           %%%%%%%%%%%%%计算待选城市的概率分布
           for k=1:length(J)
               P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta);
           end
           P=P/(sum(P));
           %%%%%%%%%%按概率原则选取下一个城市
           Pcum=cumsum(P);
           Select=find(Pcum>=rand);
           to_visit=J(Select(1));
           Tabu(i,j)=to_visit;
       end
   end
   if NC>=2
       Tabu(1,:)=R_best(NC-1,:);
   end

	%%%%%%%%%%%%%%第四步:记录本次迭代最佳路线
	L=zeros(m,1);
	for i=1:m
		R=Tabu(i,:);
		for j=1:(n-1)
			L(i)=L(i)+D(R(j),R(j+1));
		end
		L(i)=L(i)+D(R(1),R(n));
	end
	L_best(NC)=min(L);
	pos=find(L==L_best(NC));
	R_best(NC,:)=Tabu(pos(1),:);
	%%%%%%%%%%%第五步:更新信息素
	Delta_Tau=zeros(n,n);
	for i=1:m
		for j=1:(n-1)
			Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/L(i);
		end
		Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/L(i);
	end
	Tau=(1-Rho).*Tau+Delta_Tau;
	%%%%%%%%%%%禁忌表清零
	Tabu=zeros(m,n);
	%%%%%%%%%%%历代最优路线
	for i=1:n-1
		plot([C(R_best(NC,i),1),C(R_best(NC,i+1),1)],[C(R_best(NC,i),2),C(R_best(NC,i+1),2)],'bo-');
		hold on;
	end
	plot([C(R_best(NC,i),1),C(R_best(NC,i+1),1)],[C(R_best(NC,i),2),C(R_best(NC,i+1),2)],'ro-');
	title(['优化最短距离:',num2str(L_best(NC))]);    
	hold off;
	pause(0.005);
	NC=NC+1;
end
Pos=find(L_best==min(L_best));
Shortest_Route=R_best(Pos(1),:);
Shortest_Length=L_best(Pos(1),:);
figure(2);
plot(L_best)
xlabel('迭代次数');
ylabel('目标函数值');
title('适应度进化曲线');