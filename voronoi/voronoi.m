clc;
clear;
close all;

% inputs
pts = [1,1;
    6,16;
    6,6;
    15,3];%;
%     12,1;
%     4,8;
%     7,9;
%     9,3
%     ];
pts = [pts,[1:size(pts,1)]'];   % all points are denoted by [x y index]
spacing  = 2000;
tri_new = Delaunay_MAIN(pts,spacing);
center_all = [];
r_all = [];

for i = 1:size(tri_new,1)
    p1 = pts(tri_new(i,1),1:2);
    p2 = pts(tri_new(i,2),1:2);
    p3 = pts(tri_new(i,3),1:2);
[center,r] = circumc(p1,p2,p3);
mp12 = (p1+p2)/2;
mp13 = (p1+p3)/2;
mp23 = (p2+p3)/2;
edge_bisect1 = [center;mp12];
edge_bisect2 = [center;mp13];
edge_bisect3 = [center;mp23];
hold on;
plot(edge_bisect1(:,1),edge_bisect1(:,2))
hold on;
plot(edge_bisect2(:,1),edge_bisect2(:,2))
hold on;
plot(edge_bisect3(:,1),edge_bisect3(:,2))
m1 = (center(2)-mp12(2))/(center(1)-mp12(1));
m2 = (center(2)-mp13(2))/(center(1)-mp13(1));
xcg = (m1*mp12(1)-m2*mp13(1)+mp13(2)-mp12(2))/(m1-m2);
ycg = (m1*mp13(2)-m2*mp12(2)+m1*m2*(mp12(1)-mp13(1)))/(m1-m2);
cg = [xcg,ycg]
hold on;
scatter(cg(1),cg(2))
edge_bisect1in = [cg;mp12]
edge_bisect2in = [cg;mp13]
edge_bisect3in = [cg;mp23]
hold on;
plot(edge_bisect1in(:,1),edge_bisect1in(:,2))
hold on;
plot(edge_bisect2in(:,1),edge_bisect2in(:,2))
hold on;
plot(edge_bisect3in(:,1),edge_bisect3in(:,2))


center_all = [center_all;center];
r_all = [r_all;r];

end