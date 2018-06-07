x=-100:1:100;
y=-100:1:100;
[X,Y]=meshgrid(x,y);

k_stationen = 400; % zum einstellen der "Höhe" gößer
temp = 900;        % zum einstellen vom "Radius" gößer => Radius wir erhöht
h_stationen = k_stationen *(exp(-((X-0).^2+(Y-0).^2)/temp));

surf(X,Y,h_stationen);
%%
k = 1; % zum einstellen der "Höhe" gößer

h_ziel=k*sqrt((X-0).^2+(Y-0).^2);

surf(X,Y,h_ziel);