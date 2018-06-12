%% Laden der StationsKoordinaten
load('StationsKoordinaten.mat')

%% Berechnung der Zustandsregler

aMax = 498;  % Maximale Beschleunigung
vMax = 403; % Maximale Geschwindigkeit

aMaxPsi = 1;  % Maximale Beschleunigung
vMaxPsi = 3; % Maximale Geschwindigkeit

nGr = 1000; % Groesse der Planvektoren

%Zykluszeit
dt = 0.005;
Blindzeit = 25;         %Zeit die der Beobachter ohne KameraSignal weitermacht

% Robi-Parameter
Tx = 1/16.3756284231547; % Zeitkonstante der x-Achse
%Tx = 0.25;
Kx = 0.857776524037231;

Ty = 1/16.151284951305392;  % Zeitkonstante der y-Achse
%Ty = 0.25;
Ky = 0.868549738739715;

Tpsi = 1/23.708476823125870; % Zeitkonstante der Drehachse
%Tpsi = 0.3;
Kpsi = 0.899664355997346;

%% Regler fue die x-Achse
%        
% u      |-----|z1'|-----|z1=z5'|-----|z5=y  
% -->o-->| 1/Tx|-->| 1/s |----->| 1/s |-->
%    ^-  |-----|   |-----| |    |-----|
%    |_____________________|
%

A1 = [-1/Tx 0;1 0];
B1 = [Kx/Tx 0]';
Ss1 = ctrb(A1,B1);
rank(Ss1);

pWunsch1    = [-2 -19];
K1          = place(A1,B1,pWunsch1);

%% Regler fue die y-Achse

A2 = [-1/Ty 0;1 0];
B2 = [Ky/Ty 0]';
Ss2 = ctrb(A2,B2);
rank(Ss2);

pWunsch2    = [-2.2 -18];
K2          = place(A2,B2,pWunsch2);
%% Regler fuer phi

A3 = [-1/Tpsi 0;1 0];
B3 = [Kpsi/Tpsi 0]';
Ss3 = ctrb(A3,B3);
rank(Ss3);

pWunsch3    = [-2.1 -29];
K3          = place(A3,B3,pWunsch3);

 
%% Mit I-Erweiterung

CI1 = [0 1];
AI1 = [-1/Tx 0   0;
        1    0   0;
        CI1      0];
BI1 = [Kx/Tx 0 0]';
Ss1 = ctrb(AI1,BI1);
rank(Ss1);

pWunschI1    = [-1.5 -18 -0.8];
K1          = place(AI1,BI1,pWunschI1);

