clear;clc;
framesPath = 'D:\document\TinyOS\Leach\��ͷ\MATLABCODE\';%ͼ����������·����ͬʱҪ��֤ͼ���С��ͬ  
videoName = 'Bolt.avi';%��ʾ��Ҫ��������Ƶ�ļ�������  
fps = 1; %֡��  
startFrame = 1; %����һ֡��ʼ  
endFrame = 109; %��һ֡����  
  
if(exist('videoName','file'))  
    delete videoName.avi  
end  
  
%������Ƶ�Ĳ����趨  
aviobj=VideoWriter(videoName);  %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��  
aviobj.FrameRate=fps;  
  
open(aviobj);%Open file for writing video data  
%����ͼƬ  
for i=startFrame:endFrame  
    fileName=sprintf('%03d',i);    %�����ļ������� �������ļ�����0001.jpg 0002.jpg ....  
    frames=imread(strcat(framesPath,fileName,'.jpg'));  
    writeVideo(aviobj,frames);  
end  
close(aviobj);% �رմ�����Ƶ