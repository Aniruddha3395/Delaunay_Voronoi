function [circle_plot] = plotc(C,R)


%circle generation by polyline
I = [0:0.1:2*pi]';
x = R*cos(I)+C(1);
x = [x;x(1,:)];
y = R*sin(I)+C(2);
y = [y;y(1,:)];
circle_plot = plot(x,y);
end