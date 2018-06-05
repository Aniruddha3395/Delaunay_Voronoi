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
centr_all = [];
r_all = [];

for i = 1:size(tri_new,1)
    pts(tri_new(k,1),1:2);pts(tri_new(k,2),1:2);...
        pts(tri_new(k,3),1:2);pts(tri_new(k,1),1:2)
[center,r] = circumc(p1,p2,p3)
center_all = [center_all;center];
r_all = [r_all;r];
end