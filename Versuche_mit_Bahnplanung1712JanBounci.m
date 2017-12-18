%%
x=0:5:700;
y=0:5:400;
[X,Y]=meshgrid(x,y);

k_stationen = 400; % zum einstellen der "Höhe" gößer
temp = 900;        % zum einstellen vom "Radius" gößer => Radius wir erhöht
h_stationen = k_stationen *(exp(-((X-110.3).^2+(Y-283.2).^2)/temp)+exp(-((X-230.8).^2+(Y-283.2).^2)/temp)+exp(-((X-350.7).^2+(Y-283.2).^2)/temp)+exp(-((X-469.4).^2+(Y-283.2).^2)/temp)+exp(-((X-628.7).^2+(Y-260.8).^2)/temp)+exp(-((X-630).^2+(Y-308.5).^2)/temp));

k_fahrspur = -100; % zum einstellen der "Höhe"
temp = 20000;      % zum einstellen vom "Radius" gößer => Radius wir erhöht
h_fahrspur = k_fahrspur * (exp(-((X-50.0).^2+(Y-140.0).^2)/temp)+exp(-((X-170).^2+(Y-140).^2)/temp)+exp(-((X-290).^2+(Y-140).^2)/temp)+exp(-((X-410).^2+(Y-140).^2)/temp)+exp(-((X-530).^2+(Y-140).^2)/temp));


k_ziel=-200; % zum einstellen der "Höhe"
temp = 1000; % zum einstellen vom "Radius" gößer => Radius wir erhöht
x_ziel=100;
y_ziel=100;
h_ziel = 1*sqrt((X-x_ziel).^2+(Y-y_ziel).^2)+k_ziel * exp(-((X-x_ziel).^2+(Y-y_ziel).^2)/temp);

h=h_fahrspur+h_stationen+h_ziel; %Summe aller Potentiale
for i=1:1
x_robotino=500+i;
y_robotino=100;
k_robotino=400;
temp=1000;
h_Robotino=k_robotino * exp(-((X-x_robotino).^2+(Y-y_robotino).^2)/temp);

h_2=h+h_Robotino;
surf(X,Y,h_2);
pause(0.1);
end
%%
[Fx,Fy]=gradient(h_2,.2,.2);
Fx=-Fx;
Fy=-Fy;
contour(X,Y,h_2);
hold on
quiver(X,Y,Fx,Fy);
hold off

%% Bahnplanung
%Start und Ziel definieren
startx1=150;
starty1=200;

startx2=400;
starty2=200;

startx3=390;
starty3=0;


x_ziel1=400;
y_ziel1=200;

x_ziel2=150;
y_ziel2=200;

x_ziel3=150;
y_ziel3=2;

x_robotino1=startx1;
y_robotino1=starty1;

x_robotino2=startx2;
y_robotino2=starty2;

x_robotino3=startx3;
y_robotino3=starty3;

x=0:4:700;
y=0:4:400;
[X,Y]=meshgrid(x,y);

k_stationen = 400; % zum einstellen der "Höhe" gößer
temp = 900;        % zum einstellen vom "Radius" gößer => Radius wir erhöht
h_stationen = k_stationen *(exp(-((X-110.3).^2+(Y-283.2).^2)/temp)+exp(-((X-230.8).^2+(Y-283.2).^2)/temp)+exp(-((X-350.7).^2+(Y-283.2).^2)/temp)+exp(-((X-469.4).^2+(Y-283.2).^2)/temp)+exp(-((X-628.7).^2+(Y-260.8).^2)/temp)+exp(-((X-630).^2+(Y-308.5).^2)/temp));
h_stationen_1 = k_stationen *(exp(-((X-110.3).^2+(Y-150).^2)/temp)+exp(-((X-230.8).^2+(Y-150).^2)/temp)+exp(-((X-350.7).^2+(Y-150).^2)/temp)+exp(-((X-469.4).^2+(Y-150).^2)/temp));
Bereich=6;
for i=1:20
x1=x_robotino1-Bereich:x_robotino1+Bereich;
y1=y_robotino1-Bereich:y_robotino1+Bereich;
[X1,Y1]=meshgrid(x1,y1);
x2=x_robotino2-Bereich:x_robotino2+Bereich;
y2=y_robotino2-Bereich:y_robotino2+Bereich;
[X2,Y2]=meshgrid(x2,y2);
x3=x_robotino3-Bereich:x_robotino3+Bereich;
y3=y_robotino3-Bereich:y_robotino3+Bereich;
[X3,Y3]=meshgrid(x3,y3);
k_stationen = 400; % zum einstellen der "Höhe" gößer
temp = 900;        % zum einstellen vom "Radius" gößer => Radius wir erhöht
h_stationen1 = k_stationen *(exp(-((X1-110.3).^2+(Y1-283.2).^2)/temp)+exp(-((X1-230.8).^2+(Y1-283.2).^2)/temp)+exp(-((X1-350.7).^2+(Y1-283.2).^2)/temp)+exp(-((X1-469.4).^2+(Y1-283.2).^2)/temp)+exp(-((X1-628.7).^2+(Y1-260.8).^2)/temp)+exp(-((X1-630).^2+(Y1-308.5).^2)/temp));
h_stationen1_1 = k_stationen *(exp(-((X1-110.3).^2+(Y1-150).^2)/temp)+exp(-((X1-230.8).^2+(Y1-150).^2)/temp)+exp(-((X1-350.7).^2+(Y1-150).^2)/temp)+exp(-((X1-469.4).^2+(Y1-150).^2)/temp));

h_stationen2 = k_stationen *(exp(-((X2-110.3).^2+(Y2-283.2).^2)/temp)+exp(-((X2-230.8).^2+(Y2-283.2).^2)/temp)+exp(-((X2-350.7).^2+(Y2-283.2).^2)/temp)+exp(-((X2-469.4).^2+(Y2-283.2).^2)/temp)+exp(-((X2-628.7).^2+(Y2-260.8).^2)/temp)+exp(-((X2-630).^2+(Y2-308.5).^2)/temp));
h_stationen2_1 = k_stationen *(exp(-((X2-110.3).^2+(Y2-150).^2)/temp)+exp(-((X2-230.8).^2+(Y2-150).^2)/temp)+exp(-((X2-350.7).^2+(Y2-150).^2)/temp)+exp(-((X2-469.4).^2+(Y2-150).^2)/temp));

h_stationen3 = k_stationen *(exp(-((X3-110.3).^2+(Y3-283.2).^2)/temp)+exp(-((X3-230.8).^2+(Y3-283.2).^2)/temp)+exp(-((X3-350.7).^2+(Y3-283.2).^2)/temp)+exp(-((X3-469.4).^2+(Y3-283.2).^2)/temp)+exp(-((X3-628.7).^2+(Y3-260.8).^2)/temp)+exp(-((X3-630).^2+(Y3-308.5).^2)/temp));
h_stationen3_1 = k_stationen *(exp(-((X3-110.3).^2+(Y3-150).^2)/temp)+exp(-((X3-230.8).^2+(Y3-150).^2)/temp)+exp(-((X3-350.7).^2+(Y3-150).^2)/temp)+exp(-((X3-469.4).^2+(Y3-150).^2)/temp));

k_ziel=-3; % zum einstellen der "Höhe"
temp = 10000; % zum einstellen vom "Radius" gößer => Radius wir erhöht
k_Zielsqrt=5;
h_ziel1 = k_Zielsqrt*sqrt((X1-x_ziel1).^2+(Y1-y_ziel1).^2)+k_ziel * exp(-((X1-x_ziel1).^2+(Y1-y_ziel1).^2)/temp);
h_ziel2 = k_Zielsqrt*sqrt((X2-x_ziel2).^2+(Y2-y_ziel2).^2)+k_ziel * exp(-((X2-x_ziel2).^2+(Y2-y_ziel2).^2)/temp);
h_ziel3 = k_Zielsqrt*sqrt((X3-x_ziel3).^2+(Y3-y_ziel3).^2)+k_ziel * exp(-((X3-x_ziel3).^2+(Y3-y_ziel3).^2)/temp);

h1=h_stationen1+h_stationen1_1+h_ziel1; %Summe aller Potentiale
h2=h_stationen2+h_stationen2_1+h_ziel2; %Summe aller Potentiale
h3=h_stationen3+h_stationen3_1+h_ziel3; %Summe aller Potentiale


k_robotino=400;
temp=1000;
h_Robotino1=k_robotino * exp(-((X1-x_robotino1).^2+(Y1-y_robotino1).^2)/temp);
h_Robotino2=k_robotino * exp(-((X2-x_robotino2).^2+(Y2-y_robotino2).^2)/temp);
h_Robotino3=k_robotino * exp(-((X3-x_robotino3).^2+(Y3-y_robotino3).^2)/temp);

h_1=h1+h_Robotino2+h_Robotino3;
h_2=h2+h_Robotino1+h_Robotino3;
h_3=h3+h_Robotino1+h_Robotino2;
%h_1d=


temp=500;
h_Robotino11=k_robotino * exp(-((X-x_robotino1).^2+(Y-y_robotino1).^2)/temp);
h_Robotino21=k_robotino * exp(-((X-x_robotino2).^2+(Y-y_robotino2).^2)/temp);
h_Robotino31=k_robotino * exp(-((X-x_robotino3).^2+(Y-y_robotino3).^2)/temp);
temp=1000;
h_ziel1 = k_Zielsqrt*sqrt((X-x_ziel1).^2+(Y-y_ziel1).^2)+k_ziel * exp(-((X-x_ziel1).^2+(Y-y_ziel1).^2)/temp);
h_ziel2 = k_Zielsqrt*sqrt((X-x_ziel2).^2+(Y-y_ziel2).^2)+k_ziel * exp(-((X-x_ziel2).^2+(Y-y_ziel2).^2)/temp);
h_ziel3 = k_Zielsqrt*sqrt((X-x_ziel3).^2+(Y-y_ziel3).^2)+k_ziel * exp(-((X-x_ziel3).^2+(Y-y_ziel3).^2)/temp);
h=h_stationen+h_stationen_1+h_Robotino31+h_Robotino11+h_Robotino21;%h_ziel3;
surf(X,Y,h);
pause(0.4);

[Fx,Fy]=gradient(h_1,.2,.2);
Fx1=-Fx(6,6);
Fy1=-Fy(6,6);
FX1g(i)=Fx1;
FY1g(i)=Fy1;
[Fx,Fy]=gradient(h_2,.2,.2);
Fx2=-Fx(6,6);
Fy2=-Fy(6,6);
FX2g(i)=Fx2;
FY2g(i)=Fy2;
[Fx,Fy]=gradient(h_3,.2,.2);
Fx3=-Fx(6,6);
Fy3=-Fy(6,6);
FX3g(i)=Fx3;
FY3g(i)=Fy3;

FX1(i)=x_robotino1;
FY1(i)=y_robotino1;
FX2(i)=x_robotino2;
FY2(i)=y_robotino2;
FX3(i)=x_robotino3;
FY3(i)=y_robotino3;
Abstand1=sqrt((x_robotino1-x_ziel1)^2+(y_robotino1-y_ziel1)^2)/100;  
Abstand2=sqrt((x_robotino2-x_ziel2)^2+(y_robotino2-y_ziel2)^2)/100;
Abstand3=sqrt((x_robotino3-x_ziel3)^2+(y_robotino3-y_ziel3)^2)/100;    

if Abstand1>0.1
  
    x_robotino1=x_robotino1+Abstand1*Fx1;
    y_robotino1=y_robotino1+Abstand1*Fy1;
else
    x_robotino1=x_robotino1+Abstand1*0.2;
    y_robotino1=y_robotino1+Abstand1*0.2;
end
    
if Abstand2>0.1
    x_robotino2=x_robotino2+Abstand2*Fx2;
    y_robotino2=y_robotino2+Abstand2*Fy2;
else
    x_robotino2=x_robotino2+Abstand2*0.2;
    y_robotino2=y_robotino2+Abstand2*0.2;
end
if Abstand3>0.1
    x_robotino3=x_robotino3+Abstand3*Fx3;
    y_robotino3=y_robotino3+Abstand3*Fy3;
else
    x_robotino3=x_robotino3+Abstand3*0.2;
    y_robotino3=y_robotino3+Abstand3*0.2;
end
    
    
   
    

end
%%
%Zeichnen des Gradienten Verlaufs
% plot(FX1g)
% hold on
% plot(FY1g)
%hold on
plot(FX2g)
hold on
plot(FY2g)
hold on
plot(FX3g)
hold on
plot(FY3g)
hold off
grid on
%%
plot(FX1,FY1)
hold on 
plot( FX2,FY2)
hold on 
plot(FX3,FY3)
hold off
