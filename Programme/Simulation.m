%%INIT
load('Route_Simulation.mat');
d=350; %[mm]
r=d/2;
Sicherheit= 50; %[mm]
OffsetAnfahr= 50;
%Plotfarben
farbeWarte=[1 0 0 0.2];
farbeLadestation=[0 1 0 0.2];
farbeAnfahr=[0 0 0 0.2];

% Lade Anfahr und Abgabepose aus Mat-file
AbgabeAnfahrPose=load('AbgabeAnfahrPose.mat');
AbgabeX=AbgabeAnfahrPose.AbgabeAnfahrPosen(:,1:6);
AbgabeY=AbgabeAnfahrPose.AbgabeAnfahrPosen(:,7:12);
AnfahrX=AbgabeAnfahrPose.AbgabeAnfahrPosen(:,13:18);
AnfahrY=AbgabeAnfahrPose.AbgabeAnfahrPosen(:,19:24);

%Berechne Fertigungsbereich
FertigungsbP1X = AnfahrX(1,3)-r-Sicherheit;
FertigungsbP1Y = AnfahrY(1,3)-r-Sicherheit;
FertigungsbP2X = (AnfahrX(4,6)+r+Sicherheit)-FertigungsbP1X;
FertigungsbP2Y = (AnfahrY(4,6)+r+Sicherheit)-FertigungsbP1Y;

%Positionen Stationen
Station1X = 1032;
Station1Y = 2672;

Station2X = 2244;
Station2Y = 2672;

Station3X = 3461;
Station3Y = 2672;

Station4X = 4636;
Station4Y = 2672;

StationXdim = 130;
StationYdim = 325;

StationX = [Station1X Station2X Station3X Station4X];
StationY = [Station1Y Station2Y Station3Y Station4Y];

%Warteposen berechnen
Wartepose=zeros(4,6);
for n=1:1:4
    %vorne
    Wartepose(n,1)=AnfahrX(n,3);
    Wartepose(n,2)=AnfahrX(n,4);
    Wartepose(n,3)=FertigungsbP1Y-Sicherheit-r;
    %hinten  
    Wartepose(n,4)=AnfahrX(n,1);
    Wartepose(n,5)=AnfahrX(n,6);
    Wartepose(n,6)=FertigungsbP1Y+FertigungsbP2Y+Sicherheit+r;
end

% Ladestationen
LadeX = [5965 6182 5965 6194 5965];
LadeY = [2593 2593 3080 3081 2593];

% Karte erstellen
%close all;[
figure(1);
for t=1:20:4000
axis equal
xlim([0 7500]),ylim([0 3650]);
plot(0,0);
title(''),xlabel('Globale x-Koordinate in mm'),ylabel('Globale y-Koordinate in mm');
grid on;
hold on;


rectangle('Position',[FertigungsbP1X FertigungsbP1Y FertigungsbP2X FertigungsbP2Y], 'FaceColor', [0.1 0.1 0.5 0.2])
for n = 1 : 1 : 4
    rectangle('Position',[StationX(n) StationY(n) StationXdim StationYdim])
    %Plotte Warteposen vor und hinter Stationen
    plotRobot( Wartepose(n,1),Wartepose(n,3),farbeWarte);
    plotRobot( Wartepose(n,2),Wartepose(n,3),farbeWarte);
    plotRobot( Wartepose(n,4),Wartepose(n,6),farbeWarte);
    plotRobot( Wartepose(n,5),Wartepose(n,6),farbeWarte);
    
end
% Parkposition
ParkX(1)=((Station2X-(Station1X+StationXdim))/2)+Station1X+StationXdim;
ParkY(1)=Station1Y+(StationYdim/2);

ParkX(2)=((Station3X-(Station2X+StationXdim))/2)+Station2X+StationXdim;
ParkY(2)=Station2Y+(StationYdim/2);

ParkX(3)=((Station4X-(Station3X+StationXdim))/2)+Station3X+StationXdim;
ParkY(3)=Station3Y+(StationYdim/2);

farbePark=[1 1 1 0];

for n=1:1:3
    plotRobot( ParkX(n), ParkY(n), farbeWarte );
    
end



for x=1:5
plotRobot(Positionen.Data(t,(x-1)*3+1),Positionen.Data(t,(x-1)*3+2),farbeAnfahr);
end
pause(0.001);
hold off
end

%% 3D Simulation
%% Plot für Präsi
[X,Y]=meshgrid(1:7000,1:3600);
load('Route_Simulation.mat');
Zone =0;
H_zeros=zeros([73 151]);
          [x,y]=meshgrid(0:50:5500,0:50:2500); 
         H_011=1000*exp(-(x)/50)+1000*exp((y-2500)/50);
         H_01=H_zeros;
         H_01(1:51,1:111)=H_011;
         
         [x,y]=meshgrid(5550:50:7500,0:50:2500); 
         H_021=1000*exp((-(x-5500)+(y-2500))/50)+1000*exp((-(x-5500)+(y-2500))/50);
         H_02=H_zeros;
         H_02(1:51,112:151)=H_021;
         
         [x,y]=meshgrid(5500:50:7500,2500:50:3600); 
         H_031=1000*exp(-(x-5500)/50)+1000*exp((y-3600)/50);
          H_03=H_zeros;
         H_03(51:73,111:151)=H_031;
       
 [x,y]=meshgrid(0:50:7500,0:50:3600);       
 
 
 H0=H_01+H_02+H_03+1000*exp((x-7500)/50)+1000*exp(-(y)/50);
 

 [x,y]=meshgrid(2750:50:5450,3200:50:3600);  
 H_1=-0.5*x+((y-3400).^2)/100+3000;
 H1=H_zeros; 
 H1(65:73,56:110)=H_1;
 
  [x,y]=meshgrid(600:50:2700,3200:50:3600);  
 H_2=+0.5*x+((y-3400).^2)/100+250;
 H2=H_zeros; 
 H2(65:73,13:55)=H_2;
 

 [x,y]=meshgrid(0:50:550,2000:50:3600);  
 H_3=((x-250).^2)/100+0.5*y-1100;
 H3=H_zeros; 
 H3(41:73,1:12)=H_3;
 
 [x,y]=meshgrid(600:50:5450,2550:50:3150);  
 H_4=-0.5*y+2500;
 H4=H_zeros; 
 H4(52:64,13:110)=H_4;
 
 [x,y]=meshgrid(5500:50:6050,2550:50:3600);  
 H_5=((x-5750).^2)/100+0.5*y-1300;
 H5=H_zeros; 
 H5(52:73,111:122)=H_5;
 H_ones=ones([73 151]);
 H_ones(41:52,1:12)=0;
 
 h=figure(2)
 h.Position=get(0,'Screensize');
 
 
  xlim([0 8000]),ylim([0 4000]),zlim([-250 3000]);
 for t=1:10:4000 
         [x,y]=meshgrid(0:50:7500,0:50:3600);
         k_robotino=1500;
         temp=10000;
         HR1=k_robotino * exp(-((x-Positionen.Data(t,(1-1)*3+1)).^2+(y-Positionen.Data(t,(1-1)*3+2)).^2)/temp);
         HR2=k_robotino * exp(-((x-Positionen.Data(t,(2-1)*3+1)).^2+(y-Positionen.Data(t,(2-1)*3+2)).^2)/temp);
         HR3=k_robotino * exp(-((x-Positionen.Data(t,(3-1)*3+1)).^2+(y-Positionen.Data(t,(3-1)*3+2)).^2)/temp);
         HR4=k_robotino * exp(-((x-Positionen.Data(t,(4-1)*3+1)).^2+(y-Positionen.Data(t,(4-1)*3+2)).^2)/temp);
         HR5=k_robotino * exp(-((x-Positionen.Data(t,(5-1)*3+1)).^2+(y-Positionen.Data(t,(5-1)*3+2)).^2)/temp);
         HRobotinos=HR1+HR2+HR3+HR4+HR5;
     
 [x,y]=meshgrid(0:50:7500,0:50:3600); 
 

 
 surf(x,y,((H1+H0+H2+H4).*H_ones)+H3+HRobotinos)
 axis([0 8000 0 4000 -250 3000]);
 axis('off');
 view(-36, 50);
 pause(0.001);
 end
