function varargout = zuoye(varargin)
% ZUOYE MATLAB code for zuoye.fig
%      ZUOYE, by itself, creates a new ZUOYE or raises the existing
%      singleton*.
%
%      H = ZUOYE returns the handle to a new ZUOYE or the handle to
%      the existing singleton*.
%
%      ZUOYE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZUOYE.M with the given input arguments.
%
%      ZUOYE('Property','Value',...) creates a new ZUOYE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zuoye_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zuoye_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zuoye

% Last Modified by GUIDE v2.5 04-Dec-2014 21:31:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zuoye_OpeningFcn, ...
                   'gui_OutputFcn',  @zuoye_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before zuoye is made visible.
function zuoye_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zuoye (see VARARGIN)

% Choose default command line output for zuoye
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using zuoye.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes zuoye wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zuoye_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        plot(rand(5));
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        surf(peaks);
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
titlewb='Enter your Parameter(s)';
prompt={'0~49',...
    '50~59',...
    '60~69',...
    '70~79',...
    '80~89',...
    '90~100'};
def={'1','3','15','40','28','15'};
LineNo=1;
Para=inputdlg(prompt,titlewb,LineNo,def,'on');

for i=1:length(Para)
    pdata(i)=str2num(Para{i});
end

axes(handles.axes1);
x=[1 2 3 4 5 6];
y1=pdata;
bar(x,y1);
xlim([0 7]);
ylim([0,max(y1)+5]);
set(gca,'xtick',[1 2 3 4 5 6]);
set(gca,'XTickLabel',{'0~49','50~59','60~69','70~79','80~89','90~100'});
grin on;
rangemin=round((0*pdata(1)+50*pdata(2)+60*pdata(3)+70*pdata(4)+80*pdata(5)+90*pdata(6))/6);
rangemax=round((49*pdata(1)+59*pdata(2)+69*pdata(3)+79*pdata(4)+89*pdata(5)+100*pdata(6))/6);
title(sprintf('Total:%d;Average Range:[%d,%d]',6,rangemin,rangemax));
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
titlewb='Enter your Parameter(s)';
prompt={'0~49',...
    '50~59',...
    '60~69',...
    '70~79',...
    '80~89',...
    '90~100'};
def={'1','3','15','40','28','15'};
LineNo=1;
Para=inputdlg(prompt,titlewb,LineNo,def,'on');

for i=1:length(Para)
    pdata(i)=str2num(Para{i});
end


axes(handles.axes2);
x=[1 2 3 4 5 6];
y2=pdata;
stem(x,y2,'filled','-.rs','markeredgecolor','k','markerfacecolor','g','linewidth',2);

xlim([0,7])
ylim([0,max(y2)+5]);
set(gca,'xtick',[1 2 3 4 5 6]);
set(gca,'XTickLabel',{'0~49','50~59','60~69','70~79','80~89','90~100'});
grin on;
rangemin=round((0*pdata(1)+50*pdata(2)+60*pdata(3)+70*pdata(4)+80*pdata(5)+90*pdata(6))/6);
rangemax=round((49*pdata(1)+59*pdata(2)+69*pdata(3)+79*pdata(4)+89*pdata(5)+100*pdata(6))/6);
title(sprintf('Total:%d;Average Range:[%d,%d]',6,rangemin,rangemax));

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
titlewb='Enter your Parameter(s)';
prompt={'0~49',...
    '50~59',...
    '60~69',...
    '70~79',...
    '80~89',...
    '90~100'};
def={'1','3','15','40','28','15'};
LineNo=1;
Para=inputdlg(prompt,titlewb,LineNo,def,'on');

for i=1:length(Para)
    pdata(i)=str2num(Para{i});
end

axes(handles.axes3);
y3=pdata;
pie(y3,[0 0 1 0 1 0],{'0-49','50-59','60-69','70-79','80-89','90-100'});
rangemin=round((0*pdata(1)+50*pdata(2)+60*pdata(3)+70*pdata(4)+80*pdata(5)+90*pdata(6))/6);
rangemax=round((49*pdata(1)+59*pdata(2)+69*pdata(3)+79*pdata(4)+89*pdata(5)+100*pdata(6))/6);
title(sprintf('Total:%d;Average Range:[%d,%d]',6,rangemin,rangemax));

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
buttonname=questdlg('Are you sure to quit?',...
    'Question',...
    'Yes','No','Cancel','Yes');
switch buttonname
    case 'Yes'
        close all;
    case 'No'
        clc;
    case 'Cancel'
        ;
end

% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
