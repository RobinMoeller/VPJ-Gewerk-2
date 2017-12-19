function [ ] = plotRobot( x,y,farbe )

    d = 350;
    r = d/2;
    px = x-r;
    py = y-r;
    rectangle('Position',[px py d d],'Curvature', [1 1], 'FaceColor', farbe, 'LineStyle', 'none');
    plot(x,y,'kx');
    %Service();  %externe Matlabfunction keine Ahnung was die genau macht


end

