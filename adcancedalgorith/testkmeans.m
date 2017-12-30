clc;
%�����ȡ150����
X=S(101).r';
X(101)=[];
% X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];
opts = statset('Display','final');

%����Kmeans����
%X N*P�����ݾ���
%Idx N*1������,�洢����ÿ����ľ�����
%Ctrs K*P�ľ���,�洢����K����������λ��
%SumD 1*K�ĺ�����,�洢����������е���������ĵ����֮��
%D N*K�ľ��󣬴洢����ÿ�������������ĵľ���;

[Idx,Ctrs,SumD,D] = kmeans(X,4,'Replicates',3,'Options',opts);
figure(1);
%��������Ϊ1�ĵ㡣X(Idx==1,1),Ϊ��һ��������ĵ�һ�����ꣻX(Idx==1,2)Ϊ�ڶ���������ĵڶ�������
plot(X(Idx==1),'r.','MarkerSize',14)
hold on
plot(X(Idx==2),'b.','MarkerSize',14)
hold on
plot(X(Idx==3),'g.','MarkerSize',14)
hold on
plot(X(Idx==4),'m.','MarkerSize',14)
hold off
%����������ĵ�,kx��ʾ��Բ��
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)
figure(2)
for i=1:4
    plot(X(Idx==i),Idx(Idx==i),'b.','MarkerSize',14)
    hold on;
    
end
legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','NW')
hold off;
% Ctrs
% SumD