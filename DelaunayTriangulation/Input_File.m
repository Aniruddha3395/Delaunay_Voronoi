clc;
clear all;
close all;

%% input points

pts = [1,1;
    6,6;
    12,3;
    15,3;
    12,1;
    4,8;
    7,9;
    9,3;
    11,13;
    12,5;
    2,12;
    10,11;
    4,2
    ];

% pts = unique(randi([1,200],100,2),'rows');        %activate for random inputs
pts = [pts,[1:size(pts,1)]'];   % all points are denoted by [x y index]

spacing  = 2000;          % increase this to accomoate all points inside super triangle


%% delaunay triangulation by In-Built MATLAB function
tic;
figure('Name','delaunay triangulation by In-Built MATLAB function');
tri = delaunay(pts(:,1:2));      %delaunay triangulation using MATLAB
patch('Faces',tri,'Vertices',pts,'FaceColor','none');   %plotting triangulation
legend('delaunay triangulation by In-Built MATLAB function')
xlabel('x');ylabel('y');
toc;

%% delaunay triangulation by Delaunay_MAIN
tic;
tri_new = Delaunay_MAIN(pts,spacing);
toc;
