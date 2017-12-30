%%f(x,y)=(cos(x^2+y^2)-0.1)/(1+0.3(x^2+y^2)^2)+3
clear ;close all;clc;
%%禁忌表搜索算法求函数极值问题
func2=@(x)(cos(x(1)^2+x(2)^2)-0.1)/(1+0.3*(x(1)^2+x(2)^2)^2)+3;
% func3=@(x,y)(cos(x^2+y^2)-0.1)/(1+0.3*(x^2+y^2)^2)+3;
%%%%初始化
xu=5;
xl=-5;
L=randint(1,1,[5,11]);
Ca=5;
G=200;
w=1;
tabu=[];
x0=rand(1,2)*(xu-xl)+xl;
bestsofar.key=x0;
xnow(1).key=x0;
%%最优解函数值，当前解函数值，当前解函数值
bestsofar.value=func2(bestsofar.key);
xnow(1).value=func2(xnow(1).key);
g=1;
while g<G
    x_near=[];
    w=w*0.998;
    for i=1:Ca
        %%%%产生领域解
        x_temp=xnow(g).key;
        x1=x_temp(1);
        x2=x_temp(2);
        x_near(i,1)=x1+(2*rand-1)*w*(xu-xl);
        %%%%%边界条件处理
        %%%边界吸收
        if x_near(i,1)<xl
            x_near(i,1)=xl;
        end
        if x_near(i,1)>xu
            x_near(i,1)=xu;
        end
        x_near(i,2)=x2+(2*rand-1)*w*(xu-xl);
        %%边界条件处理
        %%边界吸收
        if x_near(i,2)<xl
            x_near(i,2)=xl;
        end
        if x_near(i,2)>xu
            x_near(i,2)=xu;
        end
        %%%%%计算领域解点的函数值
        fitvalue_near(i)=func2(x_near(i,:));
    end
    %%%%%%%最优领域解为候选解
    temp=find(fitvalue_near==max(fitvalue_near));
    candidate(g).key=x_near(temp,:);
    candidate(g).value=func2(candidate(g).key);
    %%%%候选解和当前接的评价函数差
    delta1=candidate(g).value-xnow(g).value;
    %%%%候选解和目前最优解的评价函数差
    delta2=candidate(g).value-bestsofar.value;
    %%候选解拨那个没有改进接，把候选解赋给下一次迭代的当前解
    if delta1<=0
        xnow(g+1).key=candidate(g).key;
        xnow(g+1).value=func2(xnow(g).key);
        %%%更新禁忌表
        tabu=[tabu;xnow(g+1).key];
        if size(tabu,1)>L
            tabu(1,:)=[];
        end
        g=g+1;
        %%%%%%%如果相对于当前解有改进，则应与目前最优解比较
    else
        if delta2>0%%候选解比目前最优解优
            %%把改进解赋给下一次迭代的当前解
            xnow(g+1).key=candidate(g).key;
            xnow(g+1).value=func2(xnow(g+1).key);
            %%%%%%更新禁忌表
            tabu=[tabu;xnow(g+1).key];
            if size (tabu,1)>L
                tabu(1,:)=[];
            end
            %%%把改进解赋给下一次迭代的目前最优解
            %%%包含藐视准则
            bestsofar.key=candidate(g).key;
            bestsofar.value=func2(bestsofar.key);
            g=g+1;
        else
            %%%判断改进解是否在禁忌表里
            [M,N]=size(tabu);
            r=0;
            for m=1:M
                if candidate(g).key(1)==tabu(m,1)...
                        &candidate(g).key(2)==tabu(m,1);
                    r=1;
                end
            end
            if r==0
                %%改进解不在禁忌表里，把改进解赋值给下一次迭代的当前解
                xnow(g+1).key=candidate(g).key;
                xnow(g+1).value=func2(xnow(g+1).key);
                %%%%%%更新禁忌表
                tabu=[tabu;xnow(g).key];
                if size(tabu,1)>L
                    tabu(1,:)=[];
                end
                g=g+1;
            else
                %%%改进接不在禁忌表里，把改进接赋给下一次迭代的当前解
                xnow(g).key=xnow(g).key;
                xnow(g).value=func2(xnow(g).key);
                %%%更新禁忌表
            end
        end
    end
    trace(g)=func2(bestsofar.key);
end
   
figure('NumberTitle','off','Name','函数图形');
hold on;
xa= -5:0.2:5;
[xb,yb] = meshgrid(xa,xa);
z=(cos(xb^2+yb^2)-0.1)/(1+0.3*(xb^2+yb^2)^2)+3;%func3(xb,yb);
mesh(xb,xb,z);
hold off;



        
bestsofar;%%最有变量及最优值
figure('NumberTitle','off','Name','搜索过程最优曲线');
hold on;
plot(trace);
xlabel('迭代次数');
ylabel('目标函数值');
title('搜索过程最优曲线值');
hold off;
