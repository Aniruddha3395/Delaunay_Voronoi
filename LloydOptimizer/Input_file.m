clc;
clear;
close all;

%% input


%%%%%%%%%%%%%%%%%%%%%%%%%% test points %%%%%%%%%%%%%%%%%%%%%%%
% % pts = [1,1;
% %     6,6;
% %     12,3;
% %     4,8;
% %     7,9;
% %     9,3;
% %     11,13;
% %     12,5;
% %     2,12;
% %     10,11;
% %     4,2
% %     ];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pts_count = 20;
pts = unique(randi([1,50],pts_count,2),'rows');

tolerence = 1e-5;       %for accuracy of centroids of cells
grid_res_x = 0.5;     grid_res_y = 0.5;     %grid resolution
Lloyd_Optimizer(pts,tolerence,grid_res_x,grid_res_y)
