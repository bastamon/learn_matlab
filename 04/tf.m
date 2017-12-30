clear all;clc;clear all;
opt=menu('method option:',...
    'Method 1',...
    'Method 2',...
    'Method 3',...
    'Method 4',...
    'Quit');%ѡ�ť

switch opt
    case 1
        disp('method 1 is chosen!');
    case 2
        disp('method 2 is chosen!');
    case 3
        disp('method 3 is chosen!');
    case 4
        disp('method 4 is chosen!');
    otherwise
        disp('unknown method');
end