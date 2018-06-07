clc;
clear;
close all;

%% inputs
pts = [1,1;
    6,16;
    6,6;
    15,3;
    12,1;
    4,8;
    7,9;
    9,3
    ];
pts = unique(randi([1,20],1000,2),'rows'); 
spacing  = 2000;

%% Voronoi diagram by In-Built MATLAB function
tic;
figure('Name','voronoi diagram by In-Built MATLAB function');
tri = delaunay(pts(:,1:2));      %delaunay triangulation using MATLAB
patch('Faces',tri,'Vertices',pts,'FaceColor','none');
legend('voronoi diagram by In-Built MATLAB function')
hold on;
% figure;
voronoi(pts(:,1),pts(:,2));
xlim([min(pts(:,1))-2,max(pts(:,1))+2]);
ylim([min(pts(:,2))-2,max(pts(:,2))+2]);
toc;

%% voronoi diagram by Delaunay_MAIN
tic;
Voronoi_MAIN(pts,spacing);
toc;