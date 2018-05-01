%%INIT
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

%% Karte erstellen
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
%% Parkposition
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


