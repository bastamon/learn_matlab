clear all ;clc;close all;

titlewb='Enter your Parameter(s)';
prompt={'Parameter 1',...
    'Parameter 2:',...
    'Parameter 3:',...
    'Parameter 4:',...
    'Parameter 5:'};
    
%def={'2.6','4.7','1.1','2.3','3.4'};
def={'5','1','9','4','6'};
LineNo=1;%lineno 代表白格宽度
Para=inputdlg(prompt,titlewb,LineNo,def,'on');%(,,,,)
pdata=zeros(1,length(Para));
% p1=str2num(Para{1});%变量赋值
% p2=str2num(Para{2});
% p3=str2num(Para{3});
% p4=str2num(Para{4});
% p5=str2num(Para{5});

for i=1:length(Para)
    pdata(i)=str2num(Para{i});
end
result=sort(pdata);
disp(result);