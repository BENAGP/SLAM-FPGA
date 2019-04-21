function varargout = img_txt(varargin)
% IMG_TXT MATLAB code for img_txt.fig
%      IMG_TXT, by itself, creates a new IMG_TXT or raises the existing
%      singleton*.
%
%      H = IMG_TXT returns the handle to a new IMG_TXT or the handle to
%      the existing singleton*.
%
%      IMG_TXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMG_TXT.M with the given input arguments.
%
%      IMG_TXT('Property','Value',...) creates a new IMG_TXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before img_txt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to img_txt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help img_txt

% Last Modified by GUIDE v2.5 09-Apr-2019 12:58:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @img_txt_OpeningFcn, ...
                   'gui_OutputFcn',  @img_txt_OutputFcn, ...
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


% --- Executes just before img_txt is made visible.
function img_txt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to img_txt (see VARARGIN)

% Choose default command line output for img_txt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes img_txt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = img_txt_OutputFcn(hObject, eventdata, handles) 
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
[FileName,PathName] = uigetfile({'*.jpg';'*.bmp';'*.*'},'File Selector');
if FileName==0    
    return ;
end
set(handles.text2,'String',FileName);
axes(handles.axes1);
img = imread(FileName);
imshow(img);
axis off
[m n c]=size(img);
imshow(img);
if(c==3) %RGB pic    
    img=rgb2gray(img);
end
fid = fopen('data.txt','w');
fprintf(fid,'%x ',m);
fprintf(fid,'%x ',n);
for i=1:m    
    for j=1:n        
        fprintf(fid,'%x ',img(i,j));    
    end
%    fprintf(fid,'\n');  
end
fclose(fid);

% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile({'*.txt';'*.*'},'File Selector');
if FileName==0
    return ;
end
img=load(FileName);
m=img(1);
n=img(2);
img=reshape(img(3:end),m,n);
img=img';
imshow(uint8(img))


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1