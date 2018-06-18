clc;
clear;
close all;


pts = [1,1;
    6,6;
    12,3;
    4,8;
    7,9;
    9,3;
    11,13;
    12,5;
    2,12;
    10,11;
    4,2
    ];

a = voronoi(pts(:,1),pts(:,2))


% make uniform grid.....dont try centroid of cell....try grid itself...
%     if grid doesnt work,then go for centroid idea
% use simple distance method to get fav pt....group them...
%     get x_avg....y_avg....that is new pt ...replace that pt and try voronoi