x=-100:1:100;
y=-100:1:100;
[X,Y]=meshgrid(x,y);

k_stationen = 400; % zum einstellen der "H�he" g��er
temp = 900;        % zum einstellen vom "Radius" g��er => Radius wir erh�ht
h_stationen = k_stationen *(exp(-((X-0).^2+(Y-0).^2)/temp));

surf(X,Y,h_stationen);
%%
k = 1; % zum einstellen der "H�he" g��er

h_ziel=k*sqrt((X-0).^2+(Y-0).^2);

surf(X,Y,h_ziel);