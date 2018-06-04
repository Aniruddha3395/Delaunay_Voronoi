function [circle_plot] = plotc(C,R)

% plotting circle by polyline method

I = [0:0.1:2*pi]';      %angles from 0 to 2pi in radians
x = R*cos(I)+C(1);
x = [x;x(1,:)];         %x-coordinates
y = R*sin(I)+C(2);
y = [y;y(1,:)];         %y-coordinates
circle_plot = plot(x,y);
end