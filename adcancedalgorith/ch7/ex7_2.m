%%%%ģ���˻��㷨���������ֵ
clear;close all;clc;
func2=@(x,y)5*cos(x*y)+x*y+y*y*y;
XMAX=5;
XMIN=-5;
YMAX=5;
YMIN=-5;
%%%%%%%%%��ȴ�����
L=100;
K=0.99;
S=0.02;
T=100;
YZ=1e-8;
P=0;
%%%%%%%%%%%���ѡ���ֵѡ��
PreX=rand*(XMAX-XMIN)+XMIN;
PreY=rand*(YMAX-YMIN)+YMIN;
PreBestX=PreX;
PreBestY=PreY;
PreX=rand*(XMAX-XMIN)+XMIN;
PreY=rand*(YMAX-YMIN)+YMIN;
BestX=PreX;
BestY=PreY;
%%%%%%%%ÿ����һ���˻�һ�Σ����£���ֱ�������������Ϊֹ
deta=abs(func2(BestX,BestY)-func2(PreBestX,PreBestY));
while deta>YZ&&T>0.001
    T=T*K;
    %%%%%%%��ǰ�¶�T�µ�������
    for i=1:L
        %%%%%%�ڴ˵㸽�����ѡ��һ��
        p=0;
        while p==0
            NextX=PreX+S*(rand*(XMAX-XMIN)+XMIN);
            NextY=PreY+S*(rand*(XMAX-YMIN)+YMIN);
            if NextX>=XMIN && NextX<=XMAX && NextY>=YMIN && NextY<=YMAX
                p=1;
            end
        end
        %%%%%%%%%%%%%�Ƿ�ȫ�����Ž�
        if func2(BestX,BestY)>func2(NextX,NextY)
            %%%%%%������һ�����Ž�
            PreBestX=BestX;
            PreBestY=BestY;
            %%%%%%��Ϊ�µ����Ž�
            BestX=NextX;
            BestY=NextY;
        end
        %%%%%%%%metropolis����
        if func2(PreX,PreY)-func2(NextX,NextY)>0
            %%%%�����½�
            PreX=NextX;
            PreY=NextY;
            P=P+1;
        else
            changer=-1*(func2(NextX,NextY)-func2(PreX,PreY))/T;
            p1=exp(changer);
            %%%%%%%%%���ܽϲ�Ľ�
            if p1>rand
                PreX=NextX;
                PreY=NextY;
                P=P+1;
            end
        end
        trace(P+1)=func2(BestX,BestY);
    end
    deta=abs(func2(BestX,BestY)-func2(PreBestX,PreBestY));
end
disp('��Сֵ�ڵ�');
disp(BestX);disp(BestY);
disp('��СֵΪ');
disp(func2(BestX,BestY));
plot(trace(2:end));
xlabel('��������');
ylabel('Ŀ�꺯��ֵ');
title('��Ӧֵ��������');
