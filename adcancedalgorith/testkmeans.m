clc;
%随机获取150个点
X=S(101).r';
X(101)=[];
% X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];
opts = statset('Display','final');

%调用Kmeans函数
%X N*P的数据矩阵
%Idx N*1的向量,存储的是每个点的聚类标号
%Ctrs K*P的矩阵,存储的是K个聚类质心位置
%SumD 1*K的和向量,存储的是类间所有点与该类质心点距离之和
%D N*K的矩阵，存储的是每个点与所有质心的距离;

[Idx,Ctrs,SumD,D] = kmeans(X,4,'Replicates',3,'Options',opts);
figure(1);
%画出聚类为1的点。X(Idx==1,1),为第一类的样本的第一个坐标；X(Idx==1,2)为第二类的样本的第二个坐标
plot(X(Idx==1),'r.','MarkerSize',14)
hold on
plot(X(Idx==2),'b.','MarkerSize',14)
hold on
plot(X(Idx==3),'g.','MarkerSize',14)
hold on
plot(X(Idx==4),'m.','MarkerSize',14)
hold off
%绘出聚类中心点,kx表示是圆形
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