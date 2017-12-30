clear all ;clc;close all;
titlewb='Enter your Parameter(s)';
prompt={'Parameter 1',...
    'Parameter 2:',...
    'Parameter 3:',...
    'Parameter 4:',...
    'Parameter 5:'};
def={'5','4','3','2','1'};
LineNo=1;
Para=inputdlg(prompt,titlewb,LineNo,def,'on');
pdata=zeros(1,length(Para));
for i=1:length(Para)
    pdata(i)=str2num(Para{i});
end

opt=menu('method options:',...
    'Maximum Value',...
    'Minimum Value',...
    'Ascending Ordering',...
    'Descending Ordering',...
    'Quit');
while(opt~=5)
        switch opt
            case 1         
                result=max(pdata);
                disp(['Maximum Value is:',num2str(result)]);break;
            case 2
                result=min(pdata);
                disp(['Minimum Value is:',num2str(result)]);break;
            case 3
                result=sort(pdata);
                disp(['Ascending Ordering Result is:',num2str(result)]);break;        
            case 4
                result=sortdescend(pdata);
                disp(['descending Ordering Result is:',num2str(result)]);break;
            case 5
                break;
        end
end

while(opt~=5)        
    opt=menu('method options:',...
    'Maximum Value',...
    'Minimum Value',...
    'Ascending Ordering',...
    'Descending Ordering',...
    'Quit');
     while(opt~=5)
        switch opt
            case 1         
                result=max(pdata);
                disp(['Maximum Value is:',num2str(result)]);break;
            case 2
                result=min(pdata);
                disp(['Minimum Value is:',num2str(result)]);break;
            case 3
                result=sort(pdata);
                disp(['Ascending Ordering Result is:',num2str(result)]);break;        
            case 4
                result=sortdescend(pdata);
                disp(['descending Ordering Result is:',num2str(result)]);break;
            case 5
                break;
        end
        if(opt==5)
            break;
        end
     end
    if(opt==5)
        break;
    end
end

