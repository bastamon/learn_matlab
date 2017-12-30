close all;clc;%%%%%%%%%%%%TSP����������
m=50;%%%%%%%���ϸ���
Alpha=1;%%%%%%%%%%%%5��Ϣ����Ҫ�̶Ȳ���
Beta=5;%%%%%%%%����ʽ������Ҫ�̶Ȳ���
Rho=0.1;%%%%%%%%%%%��Ϣ������ϵ��
G=200;%%%%%%%%%����������
Q=100;%%%%%%%%%��Ϣ������ǿ��ϵ��
x=xlsread('ex5_1.xlsx','sheet1','A1:A31');
y=xlsread('ex5_1.xlsx','sheet1','b1:b31');
C=[x y];%%%%%%%%%%%31��ʡ��
clear x y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��һ��:������ʼ��
n=size(C,1);%n��ʾ�����ģ
D=zeros(n,n);%D��ʾ�������о���������
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
Eta=1./D;%ETa��������,������Ϊ����ĵ���
Tau=ones(n,n);%TauΪ��Ϣ�ؾ���
Tabu=zeros(m,n);
NC=1;
R_best=zeros(G,n);
L_best=inf.*ones(G,1);
figure(1);
while NC<=G
   %%%%%%%%%%%�ڶ���:��mֻ���Ϸŵ�n��������
   Randpos=[];
   for i=1:(ceil(m/n))
      Randpos=[Randpos,randperm(n)]; 
   end
   Tabu(:,1)=(Randpos(1,1:m))';
   %%%%%%%%������:mֻ���ϰ����ʺ���ѡ����һ������,��ɸ��Ե�����
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
           %%%%%%%%%%%%%�����ѡ���еĸ��ʷֲ�
           for k=1:length(J)
               P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta);
           end
           P=P/(sum(P));
           %%%%%%%%%%������ԭ��ѡȡ��һ������
           Pcum=cumsum(P);
           Select=find(Pcum>=rand);
           to_visit=J(Select(1));
           Tabu(i,j)=to_visit;
       end
   end
   if NC>=2
       Tabu(1,:)=R_best(NC-1,:);
   end

	%%%%%%%%%%%%%%���Ĳ�:��¼���ε������·��
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
	%%%%%%%%%%%���岽:������Ϣ��
	Delta_Tau=zeros(n,n);
	for i=1:m
		for j=1:(n-1)
			Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/L(i);
		end
		Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/L(i);
	end
	Tau=(1-Rho).*Tau+Delta_Tau;
	%%%%%%%%%%%���ɱ�����
	Tabu=zeros(m,n);
	%%%%%%%%%%%��������·��
	for i=1:n-1
		plot([C(R_best(NC,i),1),C(R_best(NC,i+1),1)],[C(R_best(NC,i),2),C(R_best(NC,i+1),2)],'bo-');
		hold on;
	end
	plot([C(R_best(NC,i),1),C(R_best(NC,i+1),1)],[C(R_best(NC,i),2),C(R_best(NC,i+1),2)],'ro-');
	title(['�Ż���̾���:',num2str(L_best(NC))]);    
	hold off;
	pause(0.005);
	NC=NC+1;
end
Pos=find(L_best==min(L_best));
Shortest_Route=R_best(Pos(1),:);
Shortest_Length=L_best(Pos(1),:);
figure(2);
plot(L_best)
xlabel('��������');
ylabel('Ŀ�꺯��ֵ');
title('��Ӧ�Ƚ�������');