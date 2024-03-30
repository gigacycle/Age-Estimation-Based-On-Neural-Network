function varargout = GUI(varargin)
%GUI M-file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 05-Jun-2012 19:03:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[mnet,snet1,snet2,snet3,snet4] = netLoader;
handles.output = hObject;
[Inputs,mainTarget,sT1,sT2,sT3,sT4] = makeDataFeatures;
handles.mTarget = mainTarget;
handles.sT1 = sT1;
handles.sT2 = sT2;
handles.sT3 = sT3;
handles.sT4 = sT4;
handles.inputs = Inputs;
if (isempty(fieldnames(mnet))) 
    handles.trained = 0;  % Add the img data to the handle
    handles.mainNet = 0;
    handles.secondNet1 = 0;
    handles.secondNet2 = 0;
    handles.secondNet3 = 0;
    handles.secondNet4 = 0;
else
    handles.trained = 1;  % Add the img data to the handle
    handles.mainNet = mnet;
    handles.secondNet1 = snet1;
    handles.secondNet2 = snet2;
    handles.secondNet3 = snet3;
    handles.secondNet4 = snet4;
end
guidata(hObject, handles);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dataFiles = dir('Images\*.jpg');
n = length(dataFiles);
for i=1:n
    fname(i) ={ dataFiles(i).name};
end
as1=char(fname); % note: a char mat
set(handles.listbox4,'String',as1);

% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
indx = get(handles.listbox4, 'Value');
dataFiles = dir('Images\*.jpg');
fname ={dataFiles(indx).name};
fname = char(fname);
fname = fname(1:end-4);
checked = get(handles.checkbox1,'Value');
showImageFeatures(fname,handles.axes1,checked);
set(handles.text15,'String',getAge(fname));
if (handles.trained == 1)
     set(handles.text19,'String',testImage(fname,handles.mainNet,handles.secondNet1,handles.secondNet2,handles.secondNet3,handles.secondNet4));
else
     set(handles.text19,'String','The neural network is not trained.');
end

%img = imread(strcat('Images\' , fileName , '.jpg'));
% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
checked = get(handles.checkbox2,'Value');
[mainNet,secondNet1,secondNet2,secondNet3,secondNet4] = mainCode(checked,handles.mTarget,handles.sT1,handles.sT2,handles.sT3,handles.sT4,handles.inputs);
handles.trained = 1; %train flag
handles.mainNet = mainNet;
handles.secondNet1 = secondNet1;
handles.secondNet2 = secondNet2;
handles.secondNet3 = secondNet3;
handles.secondNet4 = secondNet4;
guidata(hObject, handles);
set(handles.pushbutton13,'Enable','on');

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.mainNet,handles.secondNet1,handles.secondNet2,handles.secondNet3,handles.secondNet4] = reTrain(handles.inputs,handles.mainNet,handles.secondNet1,handles.secondNet2,handles.secondNet3,handles.secondNet4,handles.mTarget,handles.sT1,handles.sT2,handles.sT3,handles.sT4);
guidata(hObject, handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
