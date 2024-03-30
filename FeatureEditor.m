function varargout = FeatureEditor(varargin)
% FEATUREEDITOR MATLAB code for FeatureEditor.fig
%      FEATUREEDITOR, by itself, creates a new FEATUREEDITOR or raises the existing
%      singleton*.
%
%      H = FEATUREEDITOR returns the handle to a new FEATUREEDITOR or the handle to
%      the existing singleton*.
%
%      FEATUREEDITOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FEATUREEDITOR.M with the given input arguments.
%
%      FEATUREEDITOR('Property','Value',...) creates a new FEATUREEDITOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FeatureEditor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FeatureEditor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FeatureEditor

% Last Modified by GUIDE v2.5 07-Apr-2013 09:33:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FeatureEditor_OpeningFcn, ...
                   'gui_OutputFcn',  @FeatureEditor_OutputFcn, ...
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


% --- Executes just before FeatureEditor is made visible.
function FeatureEditor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FeatureEditor (see VARARGIN)

% Choose default command line output for FeatureEditor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FeatureEditor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FeatureEditor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnLoad.
function btnLoad_Callback(hObject, eventdata, handles)
% hObject    handle to btnLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.jpg', 'Select a face image...');
if isequal(filename,0)
   %disp('User selected Cancel');
else
   disp(['You selected : ', fullfile(pathname, filename)]);
end
set(handles.text1,'String',fullfile(pathname, filename));
img = imread(fullfile(pathname, filename));
imshow(img);


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
