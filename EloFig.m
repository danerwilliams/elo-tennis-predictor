function varargout = EloFig(varargin)
%ELOFIG MATLAB code file for EloFig.fig
%      ELOFIG, by itself, creates a new ELOFIG or raises the existing
%      singleton*.
%
%      H = ELOFIG returns the handle to a new ELOFIG or the handle to
%      the existing singleton*.
%
%      ELOFIG('Property','Value',...) creates a new ELOFIG using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to EloFig_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ELOFIG('CALLBACK') and ELOFIG('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ELOFIG.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EloFig

% Last Modified by GUIDE v2.5 24-Apr-2019 23:35:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EloFig_OpeningFcn, ...
                   'gui_OutputFcn',  @EloFig_OutputFcn, ...
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


% --- Executes just before EloFig is made visible.
function EloFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for EloFig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EloFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EloFig_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function PlayerOneEdit_Callback(hObject, eventdata, handles)
% hObject    handle to PlayerOneEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlayerOneEdit as text
%        str2double(get(hObject,'String')) returns contents of PlayerOneEdit as a double

playerOne = handles.PlayerOneEdit.String;


% --- Executes during object creation, after setting all properties.
function PlayerOneEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlayerOneEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PlayerTwoEdit_Callback(hObject, eventdata, handles)
% hObject    handle to PlayerTwoEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlayerTwoEdit as text
%        str2double(get(hObject,'String')) returns contents of PlayerTwoEdit as a double

playerTwo = handles.PlayerTwoEdit.String;


% --- Executes during object creation, after setting all properties.
function PlayerTwoEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlayerTwoEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FirstOddsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to FirstOddsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FirstOddsEdit as text
%        str2double(get(hObject,'String')) returns contents of FirstOddsEdit as a double

playerOneOdds = str2double(handles.FirstOddsEdit.String);


% --- Executes during object creation, after setting all properties.
function FirstOddsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FirstOddsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SecondOddsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SecondOddsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecondOddsEdit as text
%        str2double(get(hObject,'String')) returns contents of SecondOddsEdit as a double

playerTwoOdds = str2double(handles.SecondOddsEdit.String);


% --- Executes during object creation, after setting all properties.
function SecondOddsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondOddsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LoadButton.
function LoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to LoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


plotK(handles)
plotFederer(handles)


% --- Executes on button press in DecisionButton.
function DecisionButton_Callback(hObject, eventdata, handles)
% hObject    handle to DecisionButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
playerOne = handles.PlayerOneEdit.String;
playerTwo = handles.PlayerTwoEdit.String;
playerOneOdds = str2double(handles.FirstOddsEdit.String);
playerTwoOdds = str2double(handles.SecondOddsEdit.String);

    
[edgePlayerOne, edgePlayerTwo,playerOneProbability,vegasPlayerOneProbability,playerTwoProbability,vegasPlayerTwoProbability] = compareOdds(playerOneOdds,playerTwoOdds,playerOne,playerTwo);

newfs = [playerOneProbability,vegasPlayerOneProbability;playerTwoProbability,vegasPlayerTwoProbability];
bar(handles.ComparisonAxes, newfs);
set(gca,'xticklabel',{'Ours     Vegas', 'Ours      Vegas'});



if edgePlayerOne > 0
    handles.DecisionText.String = ['You should bet on ', playerOne];
elseif edgePlayerOne < 0
    handles.DecisionText.String = ['You should bet on ', playerTwo];
end
