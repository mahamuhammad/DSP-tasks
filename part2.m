function varargout = part2(varargin)
% PART2 MATLAB code for part2.fig
%      PART2, by itself, creates a new PART2 or raises the existing
%      singleton*.
%
%      H = PART2 returns the handle to a new PART2 or the handle to
%      the existing singleton*.
%
%      PART2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2.M with the given input arguments.
%
%      PART2('Property','Value',...) creates a new PART2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2

% Last Modified by GUIDE v2.5 10-Apr-2019 23:05:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_OutputFcn, ...
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


% --- Executes just before part2 is made visible.
function part2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2 (see VARARGIN)

% Choose default command line output for part2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_OutputFcn(hObject, eventdata, handles) 
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
recorder=audiorecorder(16000,8,2);
recordblocking(recorder,5);
data=getaudiodata(recorder);
%%%%%%%%%%%%%%%% SPECTROGRAM & PEAKS %%%%%%%%%%%%%%%%%%%%%%%% 
%[normalS,normalW,normalT] = spectrogram(data(:,1),1000,100);
[normaltestS,normaltestW,normaltestT] = spectrogram(data(:,1),1000,100);
axes(handles.axes1);
spectrogram(data(:,1),'yaxis');

% %%%%%%%%%%%%%%%% TEST DATA USING CORRELATION %%%%%%%%%%%%%%%%
% [normaltest,fsNormaltest] =data(1,:);
% normaltest = normaltest(:,1);
% normaltest = normaltest(1:16000,1);
% test_align = alignsignals(normaltest,normal1);
% test_align = test_align(1:16000,1);
% 
% [normaltestS,normaltestW,normaltestT] = spectrogram(test_align,1000,100);

for i=1:17 
    [test_pks,test_idx] = findpeaks(abs(normaltestS(:,i)));
    [test_rows,test_columns] = size(test_pks);
    test_peaks(1:test_rows,i) = test_pks;
end
% normal_cut = normaltestS;
% peak = peaks(:, 1:17);
% cc = corrcoef(test_peaks, peak); 
% coef = abs(cc(1,2));



% function pre_processing()
% [normal1,fsNormal1] = audioread('normal_heart_sound.mp3');
% [normal2,fsNormal2] = audioread('normal.mp3');
% [normal3,fsNormal3] = audioread('a0012.wav');
% [normal4,fsNormal4] = audioread('b0001.wav');
% [normal5,fsNormal5] = audioread('c0003.wav');
% [normal6,fsNormal6] = audioread('d0013.wav');
% [normal7,fsNormal7] = audioread('e00007.wav');
% [normal8,fsNormal8] = audioread('f0001.wav');
% [normal9,fsNormal9] = audioread('5-Normal-sounds.mp3');
% [normal10,fsNormal10] = audioread('01_apex_normal_s1_s2_supine_bell.mp3');
% 
% %%%%%%%%%%%%%%%% ALIGNING DATA %%%%%%%%%%%%%%%%%%%%%%%
% s1 = alignsignals(normal1,normal10);
% s2 = alignsignals(normal2,normal10);
% s3 = alignsignals(normal3,normal10);
% s4 = alignsignals(normal4,normal10);
% s5 = alignsignals(normal5,normal10);
% s6 = alignsignals(normal6,normal10);
% s7 = alignsignals(normal7,normal10);
% s8 = alignsignals(normal8,normal10);
% s9 = alignsignals(normal9,normal10);
% s10 = normal10;
% 
% %%%%%%%%%%%%%%%% UNIFYING THE SIZE TO THE SMALLEST ONE %%%%%%%%%%%%%%%%%%%%%%%%%%%
% S_normal1 = s1(1:16000,1);
% S_normal2 = s2(1:16000,1);
% S_normal3 = s3(1:16000,1);
% S_normal4 = s4(1:16000,1);
% S_normal5 = s5(1:16000,1);
% S_normal6 = s6(1:16000,1);
% S_normal7 = s7(1:16000,1);
% S_normal8 = s8(1:16000,1);
% S_normal9 = s9(1:16000,1);
% S_normal10 = s10(1:16000,1);
% 
% %%%%%%%%%%%%%%%% AVERAGING %%%%%%%%%%%%%%%%%%%%%%%%%
% normal_signals = [S_normal1;S_normal2;S_normal3;S_normal4;S_normal5;S_normal6;S_normal7;S_normal8;S_normal9;S_normal10];
% Avg_normal = mean(normal_signals,2);
% 
% %Avg_normal = (S_normal1 + S_normal2 + S_normal3 + S_normal4 + S_normal5 + S_normal6 + S_normal7 + S_normal8 + S_normal9 + S_normal10)/10;
% %sound (Avg_normal)
% 
% %%%%%%%%%%%%%%%% SPECTROGRAM & PEAKS %%%%%%%%%%%%%%%%%%%%%%%% 
% [normalS,normalW,normalT] = spectrogram(Avg_normal,1000,100);

% for i=1:17 
%     [pks,idx] = findpeaks(abs(normalS(:,i)));
%     [rows,columns] = size(pks);
%     peaks(1:rows,i) = pks;
% end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
