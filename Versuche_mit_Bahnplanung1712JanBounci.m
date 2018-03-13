%%
X=Vektor(2,:);
Y=Vektor(3,:);
for t=1:10006
k_stationen = 400; % zum einstellen der "Höhe" gößer
temp = 70000;        % zum einstellen vom "Radius" gößer => Radius wir erhöht
h_stationen = k_stationen *(exp(-((X(t)-1103).^2+(Y(t)-2832).^2)/temp)+exp(-((X(t)-2308).^2+(Y(t)-2832).^2)/temp)+exp(-((X(t)-3507).^2+(Y(t)-2832).^2)/temp)+exp(-((X(t)-4694).^2+(Y(t)-2832).^2)/temp)+exp(-((X(t)-6287).^2+(Y(t)-2608).^2)/temp)+exp(-((X(t)-6300).^2+(Y(t)-3085).^2)/temp));

k_fahrspur = -100; % zum einstellen der "Höhe"
temp = 20000;      % zum einstellen vom "Radius" gößer => Radius wir erhöht
h_fahrspur = k_fahrspur * (exp(-((X-50.0).^2+(Y-140.0).^2)/temp)+exp(-((X-170).^2+(Y-140).^2)/temp)+exp(-((X-290).^2+(Y-140).^2)/temp)+exp(-((X-410).^2+(Y-140).^2)/temp)+exp(-((X-530).^2+(Y-140).^2)/temp));


k_ziel=-200; % zum einstellen der "Höhe"
temp = 1000; % zum einstellen vom "Radius" gößer => Radius wir erhöht
x_ziel=100;
y_ziel=100;
h_ziel = 0.3*sqrt((X(t)-2200).^2+(Y(t)-250).^2);

h=h_stationen+h_ziel; %Summe aller Potentiale

for i=1:1
k_robotino=100;
temp=100000;
h_Robotino1=k_robotino * exp(-((X(t)-2600).^2+(Y(t)-2500).^2)/temp);
h_Robotino2=k_robotino * exp(-((X(t)-2700).^2+(Y(t)-250).^2)/temp);
h_Robotino3=k_robotino * exp(-((X(t)-2400).^2+(Y(t)-250).^2)/temp);
h_Robotino4=k_robotino * exp(-((X(t)-1100).^2+(Y(t)-800).^2)/temp);
h_2(t)=h+h_Robotino1+h_Robotino2+h_Robotino3+h_Robotino4;
surf(X(t),Y(t),h_2(t));
pause(0.1);
end
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
%%
x=600:50:5100;
y=0:50:2500;
%Grenze bei y= nach unten 2500
[X1,Y1]=meshgrid(x,y);  
    h1= 1000*exp((Y1-2500)/50)+0*X1;
x=0:50:600;
y=0:50:2000;
%Grenze bei
[X4,Y4]=meshgrid(x,y);  
    h4= 1000*exp((Y4-2500)/50)+0*X4;
x=0:50:600;
y=2000:50:4000;
%Fahrrinne in y rivhtung
[X2,Y2]=meshgrid(x,y);
    h2=((X2-300)/10).^2+ 1*Y2-2000;
x=0:50:5100;
y=3250:50:4000;
%Fahrrinne in X richtung
[X3,Y3]=meshgrid(x,y);
    h3=((Y3-3500)/10).^2+ 1*X3;
x=5100:50:7000;
y=2500:50:4000;
%Grenze bei  X = 5100 nach rechts
[X5,Y5]=meshgrid(x,y);
    h5=1000*exp(-(X5-5100)/50)+Y5*0;
     h5=1000*exp((X5-7000)/50)+Y5*0;
x=5100:50:7000;
y=0:50:2500;
%Übergang der 2 Grenzen
[X6,Y6]=meshgrid(x,y);
    h6=1000*exp(-((X6-5100)-(Y6-2500))/50);
surf(X1,Y1,h1)
hold on
surf(X2,Y2,h2)
surf(X3,Y3,h3)
surf(X4,Y4,h4)
surf(X5,Y5,h5)
surf(X6,Y6,h6)
hold off

%% 
[X,Y]=meshgrid(1:7000,1:3600);
x_g=zeros([3600 7000]);
y_g=zeros([3600 7000]);
Zone =0;
for x= 1:7001
    for y=1:3601
 if (x >601) && (x<=5501) && (y>2501) && (y<=3201)
    Zone=4;
elseif (x >2751) && (x<=5501) && (y>3201)
    Zone=1;
elseif (x > 601) && (x<=2751) && (y>3201)
    Zone=2;
 elseif (x<=601) && (y>2501)
     Zone=3;
 else
     Zone=0;
 end

 if Zone == 0 % Fahrbereich
%      x_g=(1/50)*1000*exp(-(X)/50)-(1/50)*1000*exp((X-7000)/50);
%      y_g=(1/50)*1000*exp(-(Y)/50)-(1/50)*1000*exp((Y-3600)/50);
     if (x <= 5500) && (y <= 2500)
         x_test=(1/50)*1000*exp(-(x-1)/50);
         y_test=(-1/50)*1000*exp((y-1-2500)/50);
     elseif (x > 5500) && (y <= 2500)
         x_test=(1/50)*1000*exp((-(x-1-5500)+(y-1-2500))/50);
         y_test=(-1/50)*1000*exp((-(x-1-5500)+(y-1-2500))/50);
     elseif (x > 5500) && (y > 2500)
         x_test=(1/50)*1000*exp(-(x-1-5500)/50);
         y_test=(-1/50)*1000*exp((y-1-3600)/50);
      end
 x_g(y,x)=x_test+(-1/50)*1000*exp((x-1-7000)/50);
 y_g(y,x)=y_test+(1/50)*1000*exp(-(y-1)/50);
 elseif Zone == 1 %Rinne nach rechts weg
     x_g(y,x)=10; %Konstante Steigung
     y_g(y,x)=-2*(y-1-3500)/10; % Parabel abgeleitet
 elseif Zone == 2 %Rinne nach links weg
     x_g(y,x)=-10; %Konstante Steigung
     y_g(y,x)=-2*(y-1-3500)/10; % Parabel abgeleitet
 elseif Zone == 3 %Rinne nach unten weg
     x_g(y,x)=-2*(x-1-300)/10; %Konstante Steigung
     y_g(y,x)=-10; % Parabel abgeleitet
 else 
     x_g(y,x)=0;
     y_g(y,x)=10;
 end
     end   
 end
%
quiver(X(1:10:3600,1:10:7000),Y(1:10:3600,1:10:7000),x_g(1:10:3600,1:10:7000),y_g(1:10:3600,1:10:7000))
%% Plot für Präsi
[X,Y]=meshgrid(1:7000,1:3600);


Zone =0;

%  if (x >601) && (x<=5501) && (y>2501) && (y<=3201)
%     Zone=4;
% elseif (x >2751) && (x<=5501) && (y>3201)
%     Zone=1;
% elseif (x > 601) && (x<=2751) && (y>3201)
%     Zone=2;
%  elseif (x<=601) && (y>2501)
%      Zone=3;
%  else
%      Zone=0;
%  end 
%401 701
H_zeros=zeros([73 141]);
          [x,y]=meshgrid(0:50:5500,0:50:2500); 
         H_011=1000*exp(-(x)/50)+1000*exp((y-2500)/50);
         H_01=H_zeros;
         H_01(1:51,1:111)=H_011;
         
         [x,y]=meshgrid(5550:50:7000,0:50:2500); 
         H_021=1000*exp((-(x-5500)+(y-2500))/50)+1000*exp((-(x-5500)+(y-2500))/50);
         H_02=H_zeros;
         H_02(1:51,112:141)=H_021;
         
         [x,y]=meshgrid(5500:50:7000,2500:50:3600); 
         H_031=1000*exp(-(x-5500)/50)+1000*exp((y-3600)/50);
          H_03=H_zeros;
         H_03(51:73,111:141)=H_031;
       
 [x,y]=meshgrid(0:50:7000,0:50:3600);       
 
 
 H0=H_01+H_02+H_03+1000*exp((x-7000)/50)+1000*exp(-(y)/50);
 

 [x,y]=meshgrid(2750:50:5450,3200:50:3600);  
 H_1=-0.5*x+((y-3400).^2)/100+3000;
 H1=H_zeros; 
 H1(65:73,56:110)=H_1;
 
  [x,y]=meshgrid(600:50:2700,3200:50:3600);  
 H_2=+0.5*x+((y-3400).^2)/100+250;
 H2=H_zeros; 
 H2(65:73,13:55)=H_2;
 
 [x,y]=meshgrid(0:50:550,2550:50:3600);  
 H_3=((x-250).^2)/100+0.5*y-1300;
 H3=H_zeros; 
 H3(52:73,1:12)=H_3;
 
 [x,y]=meshgrid(0:50:7000,0:50:3600); 
 surf(x,y,H1+H0+H2+H3)
 
%%
if 2
 elseif Zone == 1 %Rinne nach rechts weg
     x_g(y,x)=-10*x((y-1-3500)^2)/10; %Konstante Steigung
    
 elseif Zone == 2 %Rinne nach links weg
     x_g(y,x)=10*x; %Konstante Steigung
     y_g(y,x)=((y-1-3500)^2)/10; % Parabel abgeleitet
 elseif Zone == 3 %Rinne nach unten weg
     x_g(y,x)=((x-1-300)^2)/10; %Konstante Steigung
     y_g(y,x)=10*y; % Parabel abgeleitet
 else 
     x_g(y,x)=0;
     y_g(y,x)=10*y;
 end
     end   
 end
%

