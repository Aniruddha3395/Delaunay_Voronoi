function [] = Lloyd_Optimizer(pts,tolerence,grid_res_x,grid_res_y)



%% projecting uniform grid
xll = min(pts(:,1));    yll = min(pts(:,2));    
xul = max(pts(:,1));   yul = max(pts(:,2));     
grid_pts = [];
for i = xll:grid_res_x:ceil(xul)
    j = [yll:grid_res_y:ceil(yul)]';
    grid_pts= [grid_pts;[[i*ones(size(j,1),1)],j]];
end

%% voronoi diagram updation
stop_iterate = false;

while stop_iterate == false

%%%%%%%%%%%%making voronoi diagram using In-Built MATLAB function    
% % voronoi(pts(:,1),pts(:,2));     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%making voronoi diagram using In-Built MATLAB function    
clf;
scatter(pts(:,1),pts(:,2),'.');
hold on;
Voronoi_MAIN(pts,2000);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pts_old = pts;
grid_pt_assign = [grid_pts, zeros(size(grid_pts,1),1)];

% clustering grid points
for i = 1:size(grid_pts,1)
    dist_mat = [sqrt((pts(:,1)-grid_pts(i,1)).^2 + (pts(:,2)-grid_pts(i,2)).^2)];
    [~,index] = min(dist_mat);
    grid_pt_assign(i,3) = index;
end

%finding centroids for all clusters
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

%updating centroids as input points
pts = cg(:,1:2);

%check for stability of cells
pts_diff = abs(pts_old-pts);        %comparing orld centroids with new ones
    if max(pts_diff(:))<tolerence            %if converged
        stop_iterate = true;
    end
pause(0.0001)
    
end

end