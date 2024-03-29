function varargout = Task_5_Digital_Filter(varargin)
% TASK_5_DIGITAL_FILTER MATLAB code for Task_5_Digital_Filter.fig
%      TASK_5_DIGITAL_FILTER, by itself, creates a new TASK_5_DIGITAL_FILTER or raises the existing
%      singleton*.
%
%      H = TASK_5_DIGITAL_FILTER returns the handle to a new TASK_5_DIGITAL_FILTER or the handle to
%      the existing singleton*.
%
%      TASK_5_DIGITAL_FILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK_5_DIGITAL_FILTER.M with the given input arguments.
%
%      TASK_5_DIGITAL_FILTER('Property','Value',...) creates a new TASK_5_DIGITAL_FILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Task_5_Digital_Filter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Task_5_Digital_Filter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Task_5_Digital_Filter

% Last Modified by GUIDE v2.5 12-May-2019 19:39:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Task_5_Digital_Filter_OpeningFcn, ...
                   'gui_OutputFcn',  @Task_5_Digital_Filter_OutputFcn, ...
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


% --- Executes just before Task_5_Digital_Filter is made visible.
function Task_5_Digital_Filter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Task_5_Digital_Filter (see VARARGIN)

% Choose default command line output for Task_5_Digital_Filter
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

clear global order Fs zeros poles d1 d2 u1 l1 u2 l2
% UIWAIT makes Task_5_Digital_Filter wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%Unit_Circle(hObject, eventdata, handles)
axes(handles.axes1);
ang=0:0.01:2*pi;
x=cos(ang);
y=sin(ang);

grid on
axis('equal');
xlabel('Real');
ylabel('Imaginary');
title('Complex plane')
plot(handles.axes1,x,y,'k','LineWidth',1);
hold on
plot( [0 0], [1 -1], 'b-')
plot( [1 -1], [0 0], 'r-')
xlim([-1 1])
ylim([-1 1])
hold off

% --- Outputs from this function are returned to the command line.
function varargout = Task_5_Digital_Filter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in AddZeros.
function AddZeros_Callback(hObject, eventdata, handles)
% hObject    handle to AddZeros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order zeros u1 l1
zeros=[];
if isempty(order)
        waitfor(errordlg('Enter filter order','Error'));
else
     k=1;
     while k <= order
        [x1,y1,button] = ginput(1);
  
     if x1 >= 1 || x1 <= -1 || y1 >= 1 || y1 <= -1
             waitfor(errordlg('You cannot select here','Error'));  
     elseif button==3
            m=find(u1 <(x1+0.1) & u1 >(x1-0.1) & l1 <(y1+0.1) & l1 >(y1-0.1));
            delete(handles.d1(m))
            if isempty(findobj(handles.d1(m)))
             k=k-1;
            end
     else 
            u1(k,1)=x1;
            l1(k,1)=y1;
            zeros=(u1+l1*1i)
            hold on
            handles.h1=(plot(x1,y1,'bo'));
            handles.d1(k,1)= handles.h1;
            set(handles.h1,'markersize',10) 
            k=k+1;
     end
     end
end
guidata(hObject, handles)

% --- Executes on button press in AddPoles.
function AddPoles_Callback(hObject, eventdata, handles)
% hObject    handle to AddPoles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order poles u2 l2
poles=[];
if isempty(order)
        waitfor(errordlg('Enter filter order','Error'));
else
     k=1;
     while k <= order
        [x1,y1,button] = ginput(1);
  
     if x1 >= 1 || x1 <= -1 || y1 >= 1 || y1 <= -1
             waitfor(errordlg('You cannot select here','Error'));  
     elseif button==3
            m=find(u2 <(x1+0.1) & u2 >(x1-0.1) & l2 <(y1+0.1) & l2 >(y1-0.1));
            delete(handles.d2(m))
            if isempty(findobj(handles.d2(m)))
             k=k-1;
            end
     else 
            u2(k,1)=x1;
            l2(k,1)=y1;
            poles=(u2+l2*1i)
            hold on
            h=(plot(x1,y1,'rx'));
            handles.d2(k,1)= h;
            set(h,'markersize',10) 
            k=k+1;
     end
     end
end
guidata(hObject, handles)

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global Fs ang fmax
Fs=str2double(get(handles.edit1,'String'));
fmax=Fs/2;
x=0:1:fmax;
a=0;
b=pi;
ang= (x-min(x))*(b-a)/(max(x)-min(x)) + a ;

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
global order
order = str2double(get(hObject,'String'));


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


% --- Executes on button press in Clear_Zeros.
function Clear_Zeros_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_Zeros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.d1)
guidata(hObject,handles)

% --- Executes on button press in Clear_Poles.
function Clear_Poles_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_Poles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.d2)
guidata(hObject,handles)

% --- Executes on button press in soft_ware.
function soft_ware_Callback(hObject, eventdata, handles)
% hObject    handle to soft_ware (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of soft_ware
global zeros poles order Fs g_z g_p g ang fmax
if handles.soft_ware.Value == 1
    if isempty(order)
            waitfor(errordlg('Enter filter order','Error'));
            set(handles.soft_ware, 'Value', 0);
    elseif isempty(Fs)
            waitfor(errordlg('Enter Sampling frequency','Error'));
            set(handles.soft_ware, 'Value', 0);
    else      
    f=fmax+1;
    g_z=ones(1,f);
    g_p=ones(1,f);
    g=ones(1,f);
    %% function 
    [num1, den1]=zp2tf(zeros,poles,1);
    num1 = poly(zeros);
    den1 = poly(poles);
    [h1,w1]=freqz(num1,den1);
    
    %%equation
    for i=1:length(zeros)
       for j=1:f  
        xp_UNI_CI(j) = 1*cos(ang(j));
        yp_UNI_CI(j) = 1*sin(ang(j));
        len(j)=sqrt((xp_UNI_CI(j)-real(zeros(i)))^2+(yp_UNI_CI(j)-imag(zeros(i)))^2);
        l(i,j)=len(j);
       end 
    g_z(1,:)=g_z(1,:).*l(i,:);
    end

    for i=1:length(poles)
        for j=1:f    
         xp_UNI_CI(j) = 1*cos(ang(j));
         yp_UNI_CI(j) = 1*sin(ang(j));
         des(j)=sqrt((xp_UNI_CI(j)-real(poles(i)))^2+(yp_UNI_CI(j)-imag(poles(i)))^2);
         d(i,j)=des(j);   
        end
    g_p(1,:)=g_p(1,:).*d(i,:); 
    end
    g(1,:)=g_z(1,:)./g_p(1,:);

    axes(handles.axes2)
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('Magnitude(dB)');
    title('Magnitude response (Gain)')
    plot(20*log(g),'g')  %Equation
    hold on
    plot(((w1/pi)*fmax),20*log((abs(h1))),'r')   %Function
    hold off
    legend({'Equation','Function'},'Location','best','FontSize',10,'FontWeight','bold')
    end
end
    
% --- Executes on button press in Hard_ware.
function Hard_ware_Callback(hObject, eventdata, handles)
% hObject    handle to Hard_ware (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Hard_ware
global zeros poles order Fs g_z g_p g ang fmax
if handles.Hard_ware.Value == 1
    if isempty(order)
            waitfor(errordlg('Enter filter order','Error'));
            set(handles.Hard_ware, 'Value', 0);
    elseif isempty(Fs)
            waitfor(errordlg('Enter Sampling frequency','Error'));
            set(handles.Hard_ware, 'Value', 0);
    else 
    H_Z=zeros.*conj(zeros);
    H_P=poles.*conj(poles);
    f=fmax+1;
    g_z=ones(1,f);
    g_p=ones(1,f);
    g=ones(1,f);
    %% function 
    [num1, den1]=zp2tf(H_Z,H_P,1);
    num1 = poly(H_Z);
    den1 = poly(H_P);
    [h1,w1]=freqz(num1,den1);
    
    %%equation
    for i=1:length(H_Z)
       for j=1:f  
        xp_UNI_CI(j) = 1*cos(ang(j));
        yp_UNI_CI(j) = 1*sin(ang(j));
        len(j)=sqrt((xp_UNI_CI(j)-real(H_Z(i)))^2+(yp_UNI_CI(j)-imag(H_Z(i)))^2);
        l(i,j)=len(j);
       end 
    g_z(1,:)=g_z(1,:).*l(i,:);
    end

    for i=1:length(poles)
        for j=1:f    
         xp_UNI_CI(j) = 1*cos(ang(j));
         yp_UNI_CI(j) = 1*sin(ang(j));
         des(j)=sqrt((xp_UNI_CI(j)-real(H_P(i)))^2+(yp_UNI_CI(j)-imag(H_P(i)))^2);
         d(i,j)=des(j);   
        end
    g_p(1,:)=g_p(1,:).*d(i,:); 
    end
    g(1,:)=g_z(1,:)./g_p(1,:);

    axes(handles.axes2)
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('Magnitude(dB)');
    title('Magnitude response (Gain)')
    plot(20*log(g),'g')  %Equation
    hold on
    plot(((w1/pi)*fmax),20*log((abs(h1))),'r')   %Function
    hold off
    legend({'Equation','Function'},'Location','best','FontSize',10,'FontWeight','bold')
    end
end

% --- Executes on button press in Browse_offline.
function Browse_offline_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_offline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
numberOfTries = 0;
global x l zeros poles order
a=0;
cla(handles.axes3)
while numberOfTries < 20  % Failsafe
    % Get the name of the file that the user wants to use.
    [filename,pathname] = uigetfile('*', 'Select a file');
    handles.fullpathname = strcat(pathname, filename);
    if filename == 0 % User clicked the Cancel button.
        break; 
    end
    fullFileName = fullfile(pathname, filename);
    [pathname, filename, extension] = fileparts(fullFileName);
    if strcmpi(extension, '.wav') || strcmpi(extension, '.mp3') %audio
        [A,handles.Fs] = audioread(handles.fullpathname);
        x = A(:,1);
        plot(handles.axes3,x,'b');
        break; % out of while loop
        
    elseif strcmpi(extension, '.csv')  %CSV
        data= csvread (handles.fullpathname) ;
        x = data(:,2) ;
        plot(handles.axes3,x,'b');
        break;
    else
        message = sprintf(' "%s" file. Not allowed', extension);
        uiwait(errordlg(message));
    end 
end
l=length(x);
%filter%
f_x=1;
f_y=1;
syms  z;
display(length(zeros))
for i=1:length(zeros)
   f_x=f_x*(z-zeros(i));
end
for i=1:length(poles)
   f_y=f_y*(z-poles(i));
end
if length(zeros)>0
F_x=expand(f_x);
else 
 F_x=0;   
end
if length(poles)>0
F_y=expand(f_y);
else 
F_y=0;  
end
cf_x=coeffs(F_x, z);
cf_y=coeffs(F_y, z);
display(cf_y)
eq_x=0;
eq_y=0;
out_x=[];
out_y=[];

for n=1:l             
for i=1:order+1
     w_x=n-i+1;
     w_y=n-i;
     if w_x<=0 || order-i+2<=0
       eq_x;
     else
       eq_x=eq_x+x(n-i+1)*cf_x(order-i+2);
     end 
     if w_y<=0 || order-i-1<=0 || i==1
       eq_y;
     else
       eq_y=eq_y+out_y(n-i)*cf_y(order-i-1);
     end
end
out_x(n)=eq_x;
out_y(n)=eq_x-eq_y;
eq_x=0;
eq_y=0;
end
axes(handles.axes3)
hold on
plot(real(out_y),'g')


% --- Executes on button press in real_time.
function real_time_Callback(hObject, eventdata, handles)
% hObject    handle to real_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zeros poles order
numberOfTries = 0;
cla(handles.axes4)

% while numberOfTries < 20  % Failsafe
%     % Get the name of the file that the user wants to use.
%     [filename,pathname] = uigetfile({ '*' }, 'Select a file');
%     handles.fullpathname = strcat(pathname, filename);
%     if filename == 0 % User clicked the Cancel button.
%         break; 
%     end
%     fullFileName = fullfile(pathname, filename);
%     [pathname, filename, extension] = fileparts(fullFileName);  
%     if strcmpi(extension, '.xlsx')
%         data= xlsread ( fullFileName ) ;        
%         x = data (: , 1 );
%         y =data (: , 2 ) ;
%         break;
%     elseif strcmpi(extension, '.csv')
        data=csvread('Apnea ECG Database _ 10 Sec.csv') ;
        x = data(:,1);
%         x=0:0.01:10;
%         y=sin(x*pi)
        y =data(:,2) ;
%         break;
%     else
%         message = sprintf('"%s" file. Not allowed', extension);
%         uiwait(errordlg(message));
%     end 
% end
l=length(x) ;
t =[1:l];

axes(handles.axes4)
grid on;
curve = animatedline ( 'color' , 'g' ) ; 
axes(handles.axes5)
grid on;
curve2 = animatedline ( 'color' , 'r' ) ;
curve3 = animatedline ( 'color' , 'b' ) ;
grid on ;
zeros=[1];
poles=[];
order=1;
f_x=1;
f_y=1;
syms  z;
display(length(zeros))
for i=1:length(zeros)
   f_x=f_x*(z-zeros(i));
end
for i=1:length(poles)
   f_y=f_y*(z-poles(i));
end
if length(zeros)>0
F_x=expand(f_x);
else 
 F_x=0   
end
if length(poles)>0
F_y=expand(f_y);
else 
F_y=0   
end
cf_x=coeffs(F_x, z);
cf_y=coeffs(F_y, z);
display(cf_y)
eq_x=0;
eq_y=0;
out_x=[];
out_y=[];

for n= 1:300
addpoints(curve,x(n),y(n));
drawnow 
for i=1:order+1
     w_x=n-i+1;
     w_y=n-i;
     if w_x<=0 || order-i+2<=0
       eq_x;
     else
       eq_x=eq_x+y(n-i+1)*cf_x(order-i+2);
     end 
     if w_y<=0 || order-i-1<=0 || i==1
       eq_y;
     else
       eq_y=eq_y+out_y(n-i)*cf_y(order-i-1);
     end
     i=0
end
out_x(n)=eq_x ;
out_y(n)=eq_x-eq_y;
eq_x=0;
eq_y=0;
display(out_y(n))
[num, den]=zp2tf(zeros,poles,order);
num=poly(zeros);
den=poly(poles);
out(n)=filter(num, den ,y(n));
axes(handles.axes5)
addpoints(curve2,x(n),real(out_y(n)));
addpoints(curve3,x(n),real(out(n)));
drawnow;
end

% --- Executes on button press in Move.
function Move_Callback(hObject, eventdata, handles)
% hObject    handle to Move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zeros poles u1 l1 u2 l2
[x1,y1]=ginput(1);
m1=find(u1 <(x1+0.1) & u1 >(x1-0.1) & l1 <(y1+0.1) & l1 >(y1-0.1));
m2=find(u2 <(x1+0.1) & u2 >(x1-0.1) & l2 <(y1+0.1) & l2 >(y1-0.1));

if isempty(m2)
   [x2,y2]=ginput(1);
   h=plot(x2,y2,'bo');
   set(h,'markersize',10);
   delete(handles.d1(m1))
   handles.d1(m1,1)= h;
   u1(m1,1)=x2;
   l1(m1,1)=y2;
   zeros=(u1+l1*1i)
elseif isempty(m1)
   [x2,y2]=ginput(1);
   h=plot(x2,y2,'rx');
   set(h,'markersize',10);
   delete(handles.d2(m2))
   handles.d2(m2,1)= h;
   u2(m2,1)=x2;
   l2(m2,1)=y2;
   poles=(u2+l2*1i)
end
guidata(hObject, handles)


% --- Executes on button press in delet.
function delet_Callback(hObject, eventdata, handles)
% hObject    handle to delet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with h% --- Executes on button press in delet.
global zeros poles u1 l1 u2 l2
[x1,y1]=ginput(1);
m1=find(u1 <(x1+0.1) & u1 >(x1-0.1) & l1 <(y1+0.1) & l1 >(y1-0.1));
m2=find(u2 <(x1+0.1) & u2 >(x1-0.1) & l2 <(y1+0.1) & l2 >(y1-0.1));

if isempty(m2)
   delete(handles.d1(m1))
elseif isempty(m1)
   delete(handles.d2(m2))
  
end
guidata(hObject, handles)
