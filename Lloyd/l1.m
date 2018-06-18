clc;
clear;
close all;

%% input



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

% pts = unique(randi([1,20],20,2),'rows');
pts =   [ 2    16;
     3    17;
     4    15;
     6    15;
     9    14;
    10     1;
    11     8;
    13    14;
    16    20;
    17     2;
    17    14;
    19     1;
    19     7;
    19    19;
    20     1;
    20     4;
    20     6;
    20    14]


for ii = 1:1

a = voronoi(pts(:,1),pts(:,2));

%% algo

%making uniform grid
xll = 0;    yll = 0;    xul = 20;   yul = 20;
grid_res_x = 0.1;     grid_res_y = 0.1;     
grid_pts = [];
for i = xll:grid_res_x:ceil(xul)
    j = [yll:grid_res_y:ceil(yul)]';
    grid_pts= [grid_pts;[[i*ones(size(j,1),1)],j]];
end
% scatter(grid_pts(:,1),grid_pts(:,2),'.')
grid_pt_assign = [grid_pts, zeros(size(grid_pts,1),1)];
for i = 1:size(grid_pts,1)
    dist_mat = [sqrt((pts(:,1)-grid_pts(i,1)).^2 + (pts(:,2)-grid_pts(i,2)).^2)];
    [dist_min,index] = min(dist_mat);
    grid_pt_assign(i,3) = index;
end
dist_mat;
grid_pt_assign_sorted = sortrows(grid_pt_assign,3);
xt = 0;     yt = 0;
counter = 0;
cg = [];
for i = 1:size(grid_pt_assign_sorted,1)-1
    if grid_pt_assign_sorted(i,3)==grid_pt_assign_sorted(i+1,3)
        xt = xt+grid_pt_assign_sorted(i,1);
        yt = yt+grid_pt_assign_sorted(i,2);
        counter = counter+1;
    else
        xt = xt+grid_pt_assign_sorted(i,1);
        yt = yt+grid_pt_assign_sorted(i,2);
        counter = counter+1;
        x_avg = xt/(counter);       y_avg = yt/(counter);
        cg = [cg; x_avg y_avg grid_pt_assign_sorted(i,3)];
        xt = 0;     yt = 0;     counter = 0;
    end
end
%adding last point
xt = xt+grid_pt_assign_sorted(size(grid_pt_assign_sorted,1),1);
yt = yt+grid_pt_assign_sorted(size(grid_pt_assign_sorted,1),2);
counter = counter+1;
x_avg = xt/(counter);       y_avg = yt/(counter);
cg = [cg; x_avg y_avg grid_pt_assign_sorted(i,3)];
   
pts = cg(:,1:2);

pause(0.05)
end

% hold on;
% scatter(cg(:,1),cg(:,2),'r')


% make uniform grid.....dont try centroid of cell....try grid itself...
%     if grid doesnt work,then go for centroid idea
% use simple distance method to get fav pt....group them...
%     get x_avg....y_avg....that is new pt ...replace that pt and try voronoi