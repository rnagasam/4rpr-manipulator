function varargout = Planar4RPRGUI(varargin)
% PLANAR4RPRGUI MATLAB code for Planar4RPRGUI.fig
%      PLANAR4RPRGUI, by itself, creates a new PLANAR4RPRGUI or raises the existing
%      singleton*.
%
%      H = PLANAR4RPRGUI returns the handle to a new PLANAR4RPRGUI or the handle to
%      the existing singleton*.
%
%      PLANAR4RPRGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLANAR4RPRGUI.M with the given input arguments.
%
%      PLANAR4RPRGUI('Property','Value',...) creates a new PLANAR4RPRGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Planar4RPRGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value; makes property application
%      stop.  All inputs are passed to Planar4RPRGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Planar4RPRGUI

% Last Modified by GUIDE v2.5 23-Jan-2016 22:01:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Planar4RPRGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Planar4RPRGUI_OutputFcn, ...
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


% --- Executes just before Planar4RPRGUI is made visible.
function Planar4RPRGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Planar4RPRGUI (see VARARGIN)

% Choose default command line output for Planar4RPRGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Planar4RPRGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clc
global linkPos platSize eePos MainGUIdata

% Default value
linkPos = [3 -3 -3 3; 5 5 -5 -5]; platSize = [2 2]; eePos = [0 0 0];

% Set values - Manipulator Parameters
posSliderMax = 7; posSliderMin = -7; 
slider_step = [1 1]/(posSliderMax - posSliderMin);
set(handles.plat_width_slider,'sliderstep',slider_step,'max',5,'min',0,...
    'value',platSize(1));
set(handles.plat_height_slider,'sliderstep',slider_step,'max',5,'min',0,...
    'value',platSize(2));
set(handles.link_x1_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,1));
set(handles.link_y1_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,1));
set(handles.link_x2_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,2));
set(handles.link_y2_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,2));
set(handles.link_x3_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,3));
set(handles.link_y3_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,3));
set(handles.link_x4_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,4));
set(handles.link_y4_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,4));

set(handles.plat_width_val,'String',num2str(get(handles.plat_width_slider,'Value')));
set(handles.plat_height_val,'String',num2str(get(handles.plat_height_slider,'Value')));
set(handles.link_x1_val,'String',num2str(get(handles.link_x1_slider,'Value')));
set(handles.link_y1_val,'String',num2str(get(handles.link_y1_slider,'Value')));
set(handles.link_x2_val,'String',num2str(get(handles.link_x2_slider,'Value')));
set(handles.link_y2_val,'String',num2str(get(handles.link_y2_slider,'Value')));
set(handles.link_x3_val,'String',num2str(get(handles.link_x3_slider,'Value')));
set(handles.link_y3_val,'String',num2str(get(handles.link_y3_slider,'Value')));
set(handles.link_x4_val,'String',num2str(get(handles.link_x4_slider,'Value')));
set(handles.link_y4_val,'String',num2str(get(handles.link_y4_slider,'Value')));

% Set values - Manipulator Position and Joint Variables
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));

% Set values - Kinematics & Workspace
%   for workspace
set(handles.work_revMin_box,'String',num2str(rad2deg(-2*pi)));
set(handles.work_revMax_box,'String',num2str(rad2deg(2*pi)));
set(handles.work_prsmMin_box,'String',num2str(0.5));
set(handles.work_prsmMax_box,'String',num2str(7));

%   for inverse kinematics
slider_step_theta = [0.5 1]/(360);
set(handles.inverse_x_slider,'sliderstep',slider_step,'max',posSliderMax,'min',posSliderMin,'value',eePos(1));
set(handles.inverse_y_slider,'sliderstep',slider_step,'max',posSliderMax,'min',posSliderMin,'value',eePos(2));
set(handles.inverse_phi_slider,'sliderstep',slider_step_theta,'max',2*pi,'min',-2*pi,'value',eePos(3));
set(handles.inverse_x_val,'String',num2str(get(handles.inverse_x_slider,'value')));
set(handles.inverse_y_val,'String',num2str(get(handles.inverse_y_slider,'value')));
set(handles.inverse_phi_val,'String',num2str(get(handles.inverse_phi_slider,'value')));

%   for forward kinematics
%       default active joints
set(handles.forward_joint1_select,'Value',1);
set(handles.forward_joint2_select,'Value',3);
set(handles.forward_joint3_select,'Value',7);

set(handles.active_joint1_text,'String','rev 1');
set(handles.active_joint2_text,'String','rev 3');
set(handles.active_joint3_text,'String','prsm 3');

revMin = str2double(get(handles.work_revMin_box,'String'));
revMax = str2double(get(handles.work_revMax_box,'String'));
prsmMin = str2double(get(handles.work_prsmMin_box,'String'));
prsmMax = str2double(get(handles.work_prsmMax_box,'String'));
set(handles.forward_joint1_slider,'sliderstep',slider_step,'min',revMin,'max',revMax,'value',str2double(get(handles.joint_t1_val,'String')));
set(handles.forward_joint2_slider,'sliderstep',slider_step,'min',revMin,'max',revMax,'value',str2double(get(handles.joint_t3_val,'String')));
set(handles.forward_joint3_slider,'sliderstep',slider_step,'min',prsmMin,'max',prsmMax,'value',str2double(get(handles.joint_d3_val,'String')));
set(handles.forward_joint1_val,'String',num2str(get(handles.forward_joint1_slider,'value')));
set(handles.forward_joint2_val,'String',num2str(get(handles.forward_joint2_slider,'value')));
set(handles.forward_joint3_val,'String',num2str(get(handles.forward_joint3_slider,'value')));

iterLimit = 10;
set(handles.forward_iterations_num,'String',num2str(iterLimit));

% Set values - Path Tracking
set(handles.path_circle_box,'Enable','on','Value',1);
set(handles.path_ellipse_box,'Enable','on','Value',0);

% Set values - Control 
timestep = [0.5 1]/10;
set(handles.control_gain_val,'String',num2str(2));
set(handles.control_time_slider,'sliderstep',timestep,'min',0,'max',20','value',8);
set(handles.control_time_val,'String',num2str(get(handles.control_time_slider,'value')));

drawManipulator(linkPos,platSize,eePos);
axis equal;


% --- Outputs from this function are returned to the command line.
function varargout = Planar4RPRGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function plat_width_slider_Callback(hObject, eventdata, handles)
% hObject    handle to plat_width_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% global linkPos platSize eePos
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
set(handles.plat_width_val,'String',num2str(get(handles.plat_width_slider,'Value')));
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;



% --- Executes during object creation, after setting all properties.
function plat_width_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plat_width_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function plat_height_slider_Callback(hObject, eventdata, handles)
% hObject    handle to plat_height_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
set(handles.plat_height_val,'String',num2str(get(handles.plat_height_slider,'Value')));
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;


% --- Executes during object creation, after setting all properties.
function plat_height_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plat_height_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider18_Callback(hObject, eventdata, handles)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider14_Callback(hObject, eventdata, handles)
% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider13_Callback(hObject, eventdata, handles)
% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider15_Callback(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider16_Callback(hObject, eventdata, handles)
% hObject    handle to slider16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider17_Callback(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider19_Callback(hObject, eventdata, handles)
% hObject    handle to slider19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider20_Callback(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function forward_joint1_slider_Callback(hObject, eventdata, handles)
% hObject    handle to forward_joint1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.forward_joint1_val,'String',num2str(get(handles.forward_joint1_slider,'value')));
joints = get(handles.forward_joint1_select,'String');
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
knownIndex = [get(handles.forward_joint1_select,'value'),get(handles.forward_joint2_select,'value'),...
    get(handles.forward_joint3_select,'value')];
jointVals = [str2double(get(handles.joint_t1_val,'String')),str2double(get(handles.joint_t2_val,'String')),...
    str2double(get(handles.joint_t3_val,'String')),str2double(get(handles.joint_t4_val,'String')),...
    str2double(get(handles.joint_d1_val,'String')),str2double(get(handles.joint_d2_val,'String')),...
    str2double(get(handles.joint_d3_val,'String')),str2double(get(handles.joint_d4_val,'String'))];
knownJoints = [knownIndex; jointVals(knownIndex)];
jointVals(knownIndex) = [];
initGuess = [jointVals str2double(get(handles.ee_x_val,'String')) str2double(get(handles.ee_y_val,'String')) ...
    str2double(get(handles.ee_phi_val,'String'))];
iterLimit = str2double(get(handles.forward_iterations_num,'String'));
[eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,initGuess,iterLimit);

set(handles.active_joint1_text,'String',get(handles.forward_joint1_select,'String'));
set(handles.master_dialog_text,'String','Evaluating','Foreground',[0 1 0]);
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));


cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos); axis equal;
set(handles.master_dialog_text,'String','Done','Foreground',[0 1 0]);
drawnow;

% --- Executes during object creation, after setting all properties.
function forward_joint1_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward_joint1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function forward_joint2_slider_Callback(hObject, eventdata, handles)
% hObject    handle to forward_joint2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.forward_joint2_val,'String',num2str(get(handles.forward_joint2_slider,'value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
knownIndex = [get(handles.forward_joint1_select,'value'),get(handles.forward_joint2_select,'value'),...
    get(handles.forward_joint3_select,'value')];
jointVals = [str2double(get(handles.joint_t1_val,'String')),str2double(get(handles.joint_t2_val,'String')),...
    str2double(get(handles.joint_t3_val,'String')),str2double(get(handles.joint_t4_val,'String')),...
    str2double(get(handles.joint_d1_val,'String')),str2double(get(handles.joint_d2_val,'String')),...
    str2double(get(handles.joint_d3_val,'String')),str2double(get(handles.joint_d4_val,'String'))];
knownJoints = [knownIndex; jointVals(knownIndex)];
jointVals(knownIndex) = [];
initGuess = [jointVals str2double(get(handles.ee_x_val,'String')) str2double(get(handles.ee_y_val,'String')) ...
    str2double(get(handles.ee_phi_val,'String'))];
iterLimit = str2double(get(handles.forward_iterations_num,'String'));
[eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,initGuess,iterLimit);

set(handles.master_dialog_text,'String','Evaluating','Foreground',[0 1 0]);
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));


cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos); axis equal;
set(handles.master_dialog_text,'String','Done','Foreground',[0 1 0]);
drawnow;

% --- Executes during object creation, after setting all properties.
function forward_joint2_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward_joint2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function forward_joint3_slider_Callback(hObject, eventdata, handles)
% hObject    handle to forward_joint3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.forward_joint3_val,'String',num2str(get(handles.forward_joint3_slider,'value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
knownIndex = [get(handles.forward_joint1_select,'value'),get(handles.forward_joint2_select,'value'),...
    get(handles.forward_joint3_select,'value')];
jointVals = [str2double(get(handles.joint_t1_val,'String')),str2double(get(handles.joint_t2_val,'String')),...
    str2double(get(handles.joint_t3_val,'String')),str2double(get(handles.joint_t4_val,'String')),...
    str2double(get(handles.joint_d1_val,'String')),str2double(get(handles.joint_d2_val,'String')),...
    str2double(get(handles.joint_d3_val,'String')),str2double(get(handles.joint_d4_val,'String'))];
knownJoints = [knownIndex; jointVals(knownIndex)];
jointVals(knownIndex) = [];
initGuess = [jointVals str2double(get(handles.ee_x_val,'String')) str2double(get(handles.ee_y_val,'String')) ...
    str2double(get(handles.ee_phi_val,'String'))];
iterLimit = str2double(get(handles.forward_iterations_num,'String'));
[eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,initGuess,iterLimit);

set(handles.master_dialog_text,'String','Evaluating','Foreground',[0 1 0]);
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));


cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos); axis equal;
set(handles.master_dialog_text,'String','Done','Foreground',[0 1 0]);
drawnow;

% --- Executes during object creation, after setting all properties.
function forward_joint3_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward_joint3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in active_prsm4_box.
function active_prsm4_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_prsm4_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_prsm4_box


% --- Executes on button press in active_prsm3_box.
function active_prsm3_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_prsm3_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_prsm3_box


% --- Executes on button press in active_prsm2_box.
function active_prsm2_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_prsm2_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_prsm2_box


% --- Executes on button press in active_prsm1_box.
function active_prsm1_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_prsm1_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_prsm1_box


% --- Executes on button press in active_rev3_box.
function active_rev3_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_rev3_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_rev3_box


% --- Executes on button press in active_rev1_box.
function active_rev1_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_rev1_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_rev1_box


    

% --- Executes on button press in active_rev4_box.
function active_rev4_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_rev4_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_rev4_box


% --- Executes on button press in active_rev2_box.
function active_rev2_box_Callback(hObject, eventdata, handles)
% hObject    handle to active_rev2_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active_rev2_box


% --- Executes on button press in work_show_button.
function work_show_button_Callback(hObject, eventdata, handles)
% hObject    handle to work_show_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [str2double(get(handles.ee_x_val,'String')),str2double(get(handles.ee_y_val,'String')),str2double(get(handles.ee_phi_val,'String'))];
jointLims = [str2double(get(handles.work_revMin_box,'String')), str2double(get(handles.work_revMax_box,'String')); ...
    str2double(get(handles.work_prsmMin_box,'String')), str2double(get(handles.work_prsmMax_box,'String'))];
W = makeWorkspace(linkPos,platSize,jointLims,50);
hold on
scatter(W(:,1),W(:,2),'r');

function work_revMin_box_Callback(hObject, eventdata, handles)
% hObject    handle to work_revMin_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of work_revMin_box as text
%        str2double(get(hObject,'String')) returns contents of work_revMin_box as a double


% --- Executes during object creation, after setting all properties.
function work_revMin_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to work_revMin_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function work_revMax_box_Callback(hObject, eventdata, handles)
% hObject    handle to work_revMax_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of work_revMax_box as text
%        str2double(get(hObject,'String')) returns contents of work_revMax_box as a double


% --- Executes during object creation, after setting all properties.
function work_revMax_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to work_revMax_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function work_prsmMin_box_Callback(hObject, eventdata, handles)
% hObject    handle to work_prsmMin_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of work_prsmMin_box as text
%        str2double(get(hObject,'String')) returns contents of work_prsmMin_box as a double


% --- Executes during object creation, after setting all properties.
function work_prsmMin_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to work_prsmMin_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function work_prsmMax_box_Callback(hObject, eventdata, handles)
% hObject    handle to work_prsmMax_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of work_prsmMax_box as text
%        str2double(get(hObject,'String')) returns contents of work_prsmMax_box as a double


% --- Executes during object creation, after setting all properties.
function work_prsmMax_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to work_prsmMax_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function inverse_x_slider_Callback(hObject, eventdata, handles)
% hObject    handle to inverse_x_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.inverse_x_val,'String',num2str(get(handles.inverse_x_slider,'value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.inverse_x_slider,'value'),get(handles.inverse_y_slider,'value'),get(handles.inverse_phi_slider,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos); 
axis equal;


% --- Executes during object creation, after setting all properties.
function inverse_x_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inverse_x_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function inverse_y_slider_Callback(hObject, eventdata, handles)
% hObject    handle to inverse_y_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.inverse_y_val,'String',num2str(get(handles.inverse_y_slider,'value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.inverse_x_slider,'value'),get(handles.inverse_y_slider,'value'),get(handles.inverse_phi_slider,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;


% --- Executes during object creation, after setting all properties.
function inverse_y_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inverse_y_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function inverse_phi_slider_Callback(hObject, eventdata, handles)
% hObject    handle to inverse_phi_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.inverse_phi_val,'String',num2str(rad2deg(get(handles.inverse_phi_slider,'value'))));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.inverse_x_slider,'value'),get(handles.inverse_y_slider,'value'),get(handles.inverse_phi_slider,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function inverse_phi_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inverse_phi_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in master_clear_button.
function master_clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to master_clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);

% --- Executes on button press in master_reset_button.
function master_reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to master_reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% SET TO DEFAULT VALUES
clc; cla(handles.axes1);
global linkPos platSize eePos
% Default value
linkPos = [3 -3 -3 3; 5 5 -5 -5]; platSize = [2 2]; eePos = [0 0 0];

% Set values - Manipulator Parameters
posSliderMax = 7; posSliderMin = -7; 
slider_step = [1 1]/(posSliderMax - posSliderMin);
set(handles.plat_width_slider,'sliderstep',slider_step,'max',5,'min',0,...
    'value',platSize(1));
set(handles.plat_height_slider,'sliderstep',slider_step,'max',5,'min',0,...
    'value',platSize(2));
set(handles.link_x1_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,1));
set(handles.link_y1_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,1));
set(handles.link_x2_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,2));
set(handles.link_y2_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,2));
set(handles.link_x3_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,3));
set(handles.link_y3_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,3));
set(handles.link_x4_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(1,4));
set(handles.link_y4_slider,'sliderstep',slider_step,'max',posSliderMax,...
    'min',posSliderMin,'value',linkPos(2,4));

set(handles.plat_width_val,'String',num2str(get(handles.plat_width_slider,'Value')));
set(handles.plat_height_val,'String',num2str(get(handles.plat_height_slider,'Value')));
set(handles.link_x1_val,'String',num2str(get(handles.link_x1_slider,'Value')));
set(handles.link_y1_val,'String',num2str(get(handles.link_y1_slider,'Value')));
set(handles.link_x2_val,'String',num2str(get(handles.link_x2_slider,'Value')));
set(handles.link_y2_val,'String',num2str(get(handles.link_y2_slider,'Value')));
set(handles.link_x3_val,'String',num2str(get(handles.link_x3_slider,'Value')));
set(handles.link_y3_val,'String',num2str(get(handles.link_y3_slider,'Value')));
set(handles.link_x4_val,'String',num2str(get(handles.link_x4_slider,'Value')));
set(handles.link_y4_val,'String',num2str(get(handles.link_y4_slider,'Value')));

% Set values - Manipulator Position and Joint Variables
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));

% Set values - Kinematics & Workspace
%   for workspace
set(handles.work_revMin_box,'String',num2str(rad2deg(-2*pi)));
set(handles.work_revMax_box,'String',num2str(rad2deg(2*pi)));
set(handles.work_prsmMin_box,'String',num2str(0.5));
set(handles.work_prsmMax_box,'String',num2str(7));

%   for inverse kinematics
slider_step_theta = [0.5 1]/(360);
set(handles.inverse_x_slider,'sliderstep',slider_step,'max',posSliderMax,'min',posSliderMin,'value',eePos(1));
set(handles.inverse_y_slider,'sliderstep',slider_step,'max',posSliderMax,'min',posSliderMin,'value',eePos(2));
set(handles.inverse_phi_slider,'sliderstep',slider_step_theta,'max',2*pi,'min',-2*pi,'value',eePos(3));
set(handles.inverse_x_val,'String',num2str(get(handles.inverse_x_slider,'value')));
set(handles.inverse_y_val,'String',num2str(get(handles.inverse_y_slider,'value')));
set(handles.inverse_phi_val,'String',num2str(get(handles.inverse_phi_slider,'value')));

%   for forward kinematics
%       default active joints
set(handles.forward_joint1_select,'Value',1);
set(handles.forward_joint2_select,'Value',3);
set(handles.forward_joint3_select,'Value',7);

set(handles.active_joint1_text,'String','rev 1');
set(handles.active_joint2_text,'String','rev 3');
set(handles.active_joint3_text,'String','prsm 3');

revMin = str2double(get(handles.work_revMin_box,'String'));
revMax = str2double(get(handles.work_revMax_box,'String'));
prsmMin = str2double(get(handles.work_prsmMin_box,'String'));
prsmMax = str2double(get(handles.work_prsmMax_box,'String'));
set(handles.forward_joint1_slider,'sliderstep',slider_step,'min',revMin,'max',revMax,'value',str2double(get(handles.joint_t1_val,'String')));
set(handles.forward_joint2_slider,'sliderstep',slider_step,'min',revMin,'max',revMax,'value',str2double(get(handles.joint_t3_val,'String')));
set(handles.forward_joint3_slider,'sliderstep',slider_step,'min',prsmMin,'max',prsmMax,'value',str2double(get(handles.joint_d3_val,'String')));
set(handles.forward_joint1_val,'String',num2str(get(handles.forward_joint1_slider,'value')));
set(handles.forward_joint2_val,'String',num2str(get(handles.forward_joint2_slider,'value')));
set(handles.forward_joint3_val,'String',num2str(get(handles.forward_joint3_slider,'value')));

iterLimit = 10;
set(handles.forward_iterations_num,'String',num2str(iterLimit));

% Set values - Path Tracking
set(handles.path_circle_box,'Enable','on','Value',1);
set(handles.path_ellipse_box,'Enable','on','Value',0);

% Set values - Control 
set(handles.control_gain_val,'String',num2str(2));
set(handles.control_time_slider,'sliderstep',slider_step,'min',0,'max',20','value',8);
set(handles.control_time_val,'String',num2str(get(handles.control_time_slider,'value')));

drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes on button press in manip_yoshikawa_button.
function manip_yoshikawa_button_Callback(hObject, eventdata, handles)
% hObject    handle to manip_yoshikawa_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
yoshikawaManipulability(linkPos,platSize,50);

% --- Executes on button press in manip_isentropic_button.
function manip_isentropic_button_Callback(hObject, eventdata, handles)
% hObject    handle to manip_isentropic_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
isentropicManipulability(linkPos,platSize,50);

function forward_iterations_num_Callback(hObject, eventdata, handles)
% hObject    handle to forward_iterations_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of forward_iterations_num as text
%        str2double(get(hObject,'String')) returns contents of forward_iterations_num as a double


% --- Executes during object creation, after setting all properties.
function forward_iterations_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward_iterations_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function control_gain_val_Callback(hObject, eventdata, handles)
% hObject    handle to control_gain_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of control_gain_val as text
%        str2double(get(hObject,'String')) returns contents of control_gain_val as a double


% --- Executes during object creation, after setting all properties.
function control_gain_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to control_gain_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function control_time_slider_Callback(hObject, eventdata, handles)
% hObject    handle to control_time_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.control_time_val,'String',num2str(get(handles.control_time_slider,'value')));

% --- Executes during object creation, after setting all properties.
function control_time_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to control_time_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in path_scheme_menu.
function path_scheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to path_scheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns path_scheme_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from path_scheme_menu


% --- Executes during object creation, after setting all properties.
function path_scheme_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_scheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in path_ellipse_box.
function path_ellipse_box_Callback(hObject, eventdata, handles)
% hObject    handle to path_ellipse_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of path_ellipse_box
set(handles.path_circle_box,'value',0);


% --- Executes on button press in path_circle_box.
function path_circle_box_Callback(hObject, eventdata, handles)
% hObject    handle to path_circle_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of path_circle_box
set(handles.path_ellipse_box,'value',0);


% --- Executes on slider movement.
function link_y3_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_y3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_y3_val,'String',num2str(get(handles.link_y3_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function link_y3_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_y3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function link_x2_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_x2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_x2_val,'String',num2str(get(handles.link_x2_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function link_x2_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_x2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function link_x3_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_x3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_x3_val,'String',num2str(get(handles.link_x3_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function link_x3_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_x3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function link_x4_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_x4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_x4_val,'String',num2str(get(handles.link_x4_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function link_x4_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_x4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function link_y4_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_y4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_y4_val,'String',num2str(get(handles.link_y4_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function link_y4_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_y4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function link_y2_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_y2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_y2_val,'String',num2str(get(handles.link_y2_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function link_y2_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_y2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function link_y1_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_y1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_y1_val,'String',num2str(get(handles.link_y1_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;

% --- Executes during object creation, after setting all properties.
function link_y1_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_y1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% function dy = Control(time,y,shape,control,simTime,knownJoints,gain)
% global MainGUIdata
% linkPos = [get(MainGUIdata.link_x1_slider,'value'),get(MainGUIdata.link_x2_slider,'value'),get(MainGUIdata.link_x3_slider,'value'),...
%     get(MainGUIdata.link_x4_slider,'value'); get(MainGUIdata.link_y1_slider,'value'),get(MainGUIdata.link_y2_slider,'value'),...
%     get(MainGUIdata.link_y3_slider,'value'),get(MainGUIdata.link_y4_slider,'value')];
% eePos = [str2double(get(handles.ee_x_val,'String')),str2double(get(handles.ee_y_val,'String')),deg2rad(str2double(get(handles.ee_phi_val,'String')))];
% knownIndex = [get(handles.forward_joint1_select,'value'),get(handles.forward_joint2_select,'value'),get(handles.forward_joint3_select,'value')];
% jointVals = [deg2rad(str2double(get(handles.joint_t1_val,'String'))),deg2rad(str2double(get(handles.joint_t2_val,'String'))),...
%     deg2rad(str2double(get(handles.joint_t3_val,'String'))),deg2rad(str2double(get(handles.joint_t4_val,'String'))),...
%     str2double(get(handles.joint_d1_val,'String')),str2double(get(handles.joint_d2_val,'String')),...
%     str2double(get(handles.joint_d3_val,'String')),str2double(get(handles.joint_d4_val,'String'))];
% knownJoints = [knownIndex; jointVals(knownIndex)];
% jointVals(knownIndex) = [];
% initGuess = [jointVals eePos];
% 
% switch(shape)
% 	case 1
% 		center = [0 0]; radius = 1;
% 		Xd = [center(1)+radius*cos(time); center(2)+radius*sin(time); ...
% 			zeros(1,numel(time))]; 
% 		Xdot = [-radius*sin(time); radius*cos(time); zeros(1,numel(time))];
% 	case 2
% 		center = [0 0]; radius = [1 0.5];
%         Xd = [center(1)+radius(1)*cos(time); center(2)+radius(2)*sin(...
%             time); zeros(1,numel(time))];
%         Xdot = [-radius(1)*sin(time); radius(2)*cos(time); zeros(1,...
%             numel(time))];
% end
% switch(control)
% 	case 1
% 		iterLimit = 10; initGuess = zeros(8,1);
% 		[eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,...
% 			initGuess,iterLimit);
% 		[J,A,B] = giveJacobian(linkPos,platSize,eePos,jointVars);
%         Jinv = B\A;
% %         J(:,knownJoints(1,:)) = 0;
% %         Jinv(knownJoints(1,:),:) = 0;
%         Jinv(:,3) = 0;
% 		dy = Jinv*Xdot;
% 	case 2
% 		% Closed Loop Joint Space
%         iterLimit = 10;
%         jointDesired = iKinSolve(linkPos,platSize,Xd);
%         [eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,...
%             initGuess,iterLimit);
%         [J,A,B] = giveJacobian(linkPos,platSize,eePos,jointVars);
%         J(:,knownJoints(1,:)) = 0;
%         jD = jointDesired'; jD = jD(:);
%         dy = J\Xdot + gain*(jD - y(1:8));
% 	case 3
% 		% Closed Loop Task Space
%         
%         iterLimit = 10; initGuess = zeros(8,1);
%         [eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,...
%             initGuess,iterLimit);
%         [J,A,B] = giveJacobian(linkPos,platSize,eePos,jointVars);
%         Jinv = B\A;
%         Jinv(:,3) = 0;
% %         J(:,knownJoints(1,:)) = 0;
%         dy = Jinv*(Xdot + gain*(Xd - eePos));
% end



% --- Executes on button press in path_trace_button.
function path_trace_button_Callback(hObject, eventdata, handles)
% hObject    handle to path_trace_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'),get(handles.plat_width_slider,'value')];
eePos = [str2double(get(handles.ee_x_val,'String')),str2double(get(handles.ee_y_val,'String')),deg2rad(str2double(get(handles.ee_phi_val,'String')))];
jointVars = iKinSolve(linkPos,platSize,eePos);

knownIndex = [get(handles.forward_joint1_select,'value'),get(handles.forward_joint2_select,'value'),get(handles.forward_joint3_select,'value')];
jointVals = [deg2rad(str2double(get(handles.joint_t1_val,'String'))),deg2rad(str2double(get(handles.joint_t2_val,'String'))),...
    deg2rad(str2double(get(handles.joint_t3_val,'String'))),deg2rad(str2double(get(handles.joint_t4_val,'String'))),...
    str2double(get(handles.joint_d1_val,'String')),str2double(get(handles.joint_d2_val,'String')),...
    str2double(get(handles.joint_d3_val,'String')),str2double(get(handles.joint_d4_val,'String'))];
knownJoints = [knownIndex; jointVals(knownIndex)];
jointVals(knownIndex) = [];
initGuess = [jointVals eePos];

simTime = get(handles.control_time_slider,'value');
gain = str2double(get(handles.control_gain_val,'String'));
control = get(handles.path_scheme_menu,'value');
iterLimit = str2double(get(handles.forward_iterations_num,'String'));

checkShape = get(handles.path_circle_box,'value');
if checkShape == 1
    shape = 1;
else
    shape = 2;
end

jointInitial = jointVars';
jointInitial = jointInitial(:)';

[t,q] = ode45(@doControl,[0,simTime],jointInitial,[],shape,control,simTime,...
    knownJoints,gain,linkPos,platSize,initGuess);

for i=1:numel(t)
    knownJoints = [knownIndex; q(i,knownIndex(1)),q(i,knownIndex(2)),q(i,knownIndex(3))];
    trace(i,:) = fKinSolve(linkPos,platSize,knownJoints,initGuess,iterLimit);%#ok<AGROW>
    cla(handles.axes1);
    drawManipulator(linkPos,platSize,trace(i,:));
    if(shape==1)
        center = [0 0]; radius = 1;
        plot(center(1)+radius*cos(0:0.01:simTime),center(2)+radius*sin(...
            0:0.01:simTime),'b');
    else
        center = [0 0]; radius = [1 0.5];
        plot(center(1)+radius(1)*cos(0:0.01:simTime),center(2)+radius(2)...
            *sin(0:0.01:simTime),'b');
    end
    plot(trace(:,1),trace(:,2),'r','LineWidth',2);
    axis equal
    pause(0.01);
    hold on
end
hold on
drawManipulator(linkPos,platSize,trace(end,:));
plot(trace(:,1),trace(:,2),'r','LineWidth',2);
if(shape==1)
    center = [0 0]; radius = 1;
    plot(center(1)+radius*cos(0:0.01:simTime),center(2)+radius*sin(...
        0:0.01:simTime),'b');
else
    center = [0 0]; radius = [1 0.5];
    plot(center(1)+radius(1)*cos(0:0.01:simTime),center(2)+radius(2)...
        *sin(0:0.01:simTime),'b');
end
    
axis equal







% --- Executes on slider movement.
function link_x1_slider_Callback(hObject, eventdata, handles)
% hObject    handle to link_x1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.link_x1_val,'String',num2str(get(handles.link_x1_slider,'Value')));
linkPos = [get(handles.link_x1_slider,'value'),get(handles.link_x2_slider,'value'),get(handles.link_x3_slider,'value'),...
    get(handles.link_x4_slider,'value'); get(handles.link_y1_slider,'value'),get(handles.link_y2_slider,'value'),...
    get(handles.link_y3_slider,'value'),get(handles.link_y4_slider,'value')];
platSize = [get(handles.plat_width_slider,'value'), get(handles.plat_height_slider,'value')];
eePos = [get(handles.ee_x_val,'value'),get(handles.ee_y_val,'value'),get(handles.ee_phi_val,'value')];
jointVars = iKinSolve(linkPos,platSize,eePos);
set(handles.joint_t1_val,'String',num2str(rad2deg(jointVars(1,1))));
set(handles.joint_t2_val,'String',num2str(rad2deg(jointVars(1,2))));
set(handles.joint_t3_val,'String',num2str(rad2deg(jointVars(1,3))));
set(handles.joint_t4_val,'String',num2str(rad2deg(jointVars(1,4))));
set(handles.joint_d1_val,'String',num2str(jointVars(2,1)));
set(handles.joint_d2_val,'String',num2str(jointVars(2,2)));
set(handles.joint_d3_val,'String',num2str(jointVars(2,3)));
set(handles.joint_d4_val,'String',num2str(jointVars(2,4)));
set(handles.ee_x_val,'String',num2str(eePos(1)));
set(handles.ee_y_val,'String',num2str(eePos(2)));
set(handles.ee_phi_val,'String',num2str(rad2deg(eePos(3))));
cla(handles.axes1);
drawManipulator(linkPos,platSize,eePos);
axis equal;



% --- Executes during object creation, after setting all properties.
function link_x1_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_x1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on active_rev1_box and none of its controls.
function active_rev1_box_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to active_rev1_box (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in forward_joint1_select.
function forward_joint1_select_Callback(hObject, eventdata, handles)
% hObject    handle to forward_joint1_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns forward_joint1_select contents as cell array
%        contents{get(hObject,'Value')} returns selected item from forward_joint1_select
current = get(handles.forward_joint1_select,'value');
jointNames = get(handles.forward_joint1_select,'String');
set(handles.active_joint1_text,'String',jointNames{current}); 
sliderStepRev = [0.5 1]/(rad2deg(str2double(get(handles.work_revMax_box,'String'))) - rad2deg(str2double(get(handles.work_revMin_box,'String'))));
sliderStepPrsm = [0.5 1]/(rad2deg(str2double(get(handles.work_prsmMax_box,'String'))) - rad2deg(str2double(get(handles.work_prsmMin_box,'String'))));
if(current<=4)
    set(handles.forward_joint1_slider,'sliderstep',sliderStepRev,'max',rad2deg(str2double(get(handles.work_revMax_box,'String'))),'min',rad2deg(str2double(get(handles.work_revMin_box,'String'))));
else
    set(handles.forward_joint1_slider,'sliderstep',sliderStepPrsm,'max',str2double(get(handles.work_prsmMax_box,'String')),'min',str2double(get(handles.work_prsmMin_box,'String')));
end





    
    


% --- Executes during object creation, after setting all properties.
function forward_joint1_select_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward_joint1_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in forward_joint2_select.
function forward_joint2_select_Callback(hObject, eventdata, handles)
% hObject    handle to forward_joint2_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns forward_joint2_select contents as cell array
%        contents{get(hObject,'Value')} returns selected item from forward_joint2_select
current = get(handles.forward_joint2_select,'value');
jointNames = get(handles.forward_joint2_select,'String');
set(handles.active_joint2_text,'String',jointNames{current});
sliderStepRev = [0.5 1]/(rad2deg(str2double(get(handles.work_revMax_box,'String'))) - rad2deg(str2double(get(handles.work_revMin_box,'String'))));
sliderStepPrsm = [0.5 1]/(rad2deg(str2double(get(handles.work_prsmMax_box,'String'))) - rad2deg(str2double(get(handles.work_prsmMin_box,'String'))));
if(current<=4)
    set(handles.forward_joint2_slider,'sliderstep',sliderStepRev,'max',rad2deg(str2double(get(handles.work_revMax_box,'String'))),'min',rad2deg(str2double(get(handles.work_revMin_box,'String'))));
else
    set(handles.forward_joint2_slider,'sliderstep',sliderStepPrsm,'max',str2double(get(handles.work_prsmMax_box,'String')),'min',str2double(get(handles.work_prsmMin_box,'String')));
end

% --- Executes during object creation, after setting all properties.
function forward_joint2_select_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward_joint2_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in forward_joint3_select.
function forward_joint3_select_Callback(hObject, eventdata, handles)
% hObject    handle to forward_joint3_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns forward_joint3_select contents as cell array
%        contents{get(hObject,'Value')} returns selected item from forward_joint3_select
current = get(handles.forward_joint3_select,'value');
jointNames = get(handles.forward_joint3_select,'String');
set(handles.active_joint3_text,'String',jointNames{current});
sliderStepRev = [0.5 1]/(rad2deg(str2double(get(handles.work_revMax_box,'String'))) - rad2deg(str2double(get(handles.work_revMin_box,'String'))));
sliderStepPrsm = [0.5 1]/(rad2deg(str2double(get(handles.work_prsmMax_box,'String'))) - rad2deg(str2double(get(handles.work_prsmMin_box,'String'))));
if(current<=4)
    set(handles.forward_joint3_slider,'sliderstep',sliderStepRev,'max',rad2deg(str2double(get(handles.work_revMax_box,'String'))),'min',rad2deg(str2double(get(handles.work_revMin_box,'String'))));
else
    set(handles.forward_joint3_slider,'sliderstep',sliderStepPrsm,'max',str2double(get(handles.work_prsmMax_box,'String')),'min',str2double(get(handles.work_prsmMin_box,'String')));
end

% --- Executes during object creation, after setting all properties.
function forward_joint3_select_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward_joint3_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
