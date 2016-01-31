function varargout = SignalGenerator(varargin)
% SIGNALGENERATOR MATLAB code for SignalGenerator.fig
%      SIGNALGENERATOR, by itself, creates a new SIGNALGENERATOR or raises the existing
%      singleton*.
%
%      H = SIGNALGENERATOR returns the handle to a new SIGNALGENERATOR or the handle to
%      the existing singleton*.
%
%      SIGNALGENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGNALGENERATOR.M with the given input arguments.
%
%      SIGNALGENERATOR('Property','Value',...) creates a new SIGNALGENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SignalGenerator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SignalGenerator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SignalGenerator

% Last Modified by GUIDE v2.5 16-May-2015 16:34:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SignalGenerator_OpeningFcn, ...
                   'gui_OutputFcn',  @SignalGenerator_OutputFcn, ...
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


% --- Executes just before SignalGenerator is made visible.
function SignalGenerator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SignalGenerator (see VARARGIN)

% Choose default command line output for SignalGenerator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SignalGenerator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SignalGenerator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in init.
function init_Callback(hObject, eventdata, handles)
% hObject    handle to init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;
global operation;

operation = 0;
prompt = {'Enter the sampling frequency:'};
dlg_title = 'Initialize';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
tstep = str2num(answer{1});
t = [];
x = [];



% --- Executes on button press in cosBtn.
function cosBtn_Callback(hObject, eventdata, handles)
% hObject    handle to cosBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point:','Enter Amplitude:','Enter starting phase shift:','Enter frequency:'};
dlg_title = 'Cosine wave';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
a = str2num(answer{3});
s = str2num(answer{4});
f = str2num(answer{5});
[ tempt,tempx ] = plotcos(ts,tf,tstep,a,f,s);
t = [t tempt];
x = [x tempx];



% --- Executes on button press in sinBtn.
function sinBtn_Callback(hObject, eventdata, handles)
% hObject    handle to sinBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point','Enter Amplitude:','Enter starting phase shift:','Enter frequency:'};
dlg_title = 'Sine wave';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
a = str2num(answer{3});
s = str2num(answer{4});
f = str2num(answer{5});
[ tempt,tempx ] = plotsin(ts,tf,tstep,a,s,f);
t = [t tempt];
x = [x tempx];



% --- Executes on button press in dcBtn.
function dcBtn_Callback(hObject, eventdata, handles)
% hObject    handle to dcBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point:','Enter DC value:'};
dlg_title = 'DC';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
a = str2num(answer{3});
[ tempt, tempx ] = plotDC(ts,tstep,tf,a);
t = [t tempt];
x = [x tempx];


% --- Executes on button press in impulseBtn.
function impulseBtn_Callback(hObject, eventdata, handles)
% hObject    handle to impulseBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point:','Enter location:'};
dlg_title = 'Impulse';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
l = str2num(answer{3});
[ tempt, tempx ] = plotimpulse(ts,tstep,tf,l);
t = [t tempt];
x = [x tempx];


% --- Executes on button press in unitBtn.
function unitBtn_Callback(hObject, eventdata, handles)
% hObject    handle to unitBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point:','Enter amplitude:','Enter location of transition:'};
dlg_title = 'Unit';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
a = str2num(answer{3});
trans = str2num(answer{4});
[ tempt, tempx ] = plotunitStep(ts,tstep,tf,a,trans);
t = [t tempt];
x = [x tempx];


% --- Executes on button press in rampBtn.
function rampBtn_Callback(hObject, eventdata, handles)
% hObject    handle to rampBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point:','Enter slope:','Enter y-axis intercept:'};
dlg_title = 'Ramp';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
s = str2num(answer{3});
c = str2num(answer{4});
[ tempt, tempx ] = plotramp(ts,tstep,tf,s,c);
t = [t tempt];
x = [x tempx];


% --- Executes on button press in rectBtn.
function rectBtn_Callback(hObject, eventdata, handles)
% hObject    handle to rectBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point:','Enter amplitude:','Enter center of rect:','Enter width:'};
dlg_title = 'Rect';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
a = str2num(answer{3});
c = str2num(answer{4});
w = str2num(answer{5});
[ tempt, tempx ] = plotrect(ts,tstep,tf,a,w,c);
t = [t tempt];
x = [x tempx];


% --- Executes on button press in expBtn.
function expBtn_Callback(hObject, eventdata, handles)
% hObject    handle to expBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tstep;
global t;
global x;

prompt = {'Enter the start point:','Enter the end point:','Enter amplitude:','Enter exponent:'};
dlg_title = 'Exponential';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
ts = str2num(answer{1});
tf = str2num(answer{2});
a = str2num(answer{3});
e = str2num(answer{4});
[ tempt, tempx ] = plotexponent(ts,tstep,tf,a,e);
t = [t tempt];
x = [x tempx];


% --- Executes on button press in plotBtn.
function plotBtn_Callback(hObject, eventdata, handles)
% hObject    handle to plotBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global x;
global mt;
global mx;
global tstep;
global operation;
if operation ~= 0
    switch operation
        case 1
            if(mt == t)
                x=plus(x,mx);
            end
        case 2
            if(mt == t)
                x= x.*mx;
            end
        case 3
            tstart = mt(1) + t(1);
            tend = mt(end) + t(end);
            x = conv(mx,x).*tstep;
            t = linspace(tstart,tend,length(x));
    end
end
flag = get(handles.popmenu,'value');
axes(handles.axes1)
switch flag
    case 1
        plot(t,x)
    case 2
        stem(t,x)
end
        prompt = {'Do you want to add (Y/N)'};
        
dlg_title = 'Exponential';
num_lines = 1;
answer = inputdlg(prompt,dlg_title,num_lines);
string = answer{1};
if string == 'Y'
        operation = 1;
else        
        prompt = {'Do you want to multiply (Y/N)'};
        dlg_title = 'Exponential';
        num_lines = 1;
        answer = inputdlg(prompt,dlg_title,num_lines);
        string = answer{1};
        if string == 'Y'
            operation = 2;
        else
            prompt = {'Do you want to convolute (Y/N)'};
            dlg_title = 'Exponential';
            num_lines = 1;
            answer = inputdlg(prompt,dlg_title,num_lines);
            string = answer{1};
            if string == 'Y'
                    operation = 3;
            else
                   operation = 0;
            end
        end
end
if operation ~= 0
    mx= [x];
    mt = [t];
    x=[];
    t=[];
end


% --- Executes on selection change in popmenu.
function popmenu_Callback(hObject, eventdata, handles)
% hObject    handle to popmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popmenu


% --- Executes during object creation, after setting all properties.
function popmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
