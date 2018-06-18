function [tri_new] = Delaunay_MAIN(pts,spacing)

%% algorithm

% creating the super triangle which will contain all the points inside it
xmax = max(pts(:,1));       xmin = min(pts(:,1));
ymax = max(pts(:,2));       ymin = min(pts(:,2));
p1_s = [xmin-spacing,ymin-spacing,size(pts,1)+1];   %vertex1 of super triangle
p2_s = [xmax+spacing,ymin-spacing,size(pts,1)+2];   %vertex1 of super triangle
p3_s = [0.5*(xmax+xmin),ymax+spacing,size(pts,1)+3];    %vertex1 of super triangle
pts_new = [pts;p1_s;p2_s;p3_s];     % all points including points for super triangle
tri_s = [p1_s(1,3),p2_s(1,3),p3_s(1,3)];        %super triangle/external triangle

%initialize
tri = [tri_s];          %triangulation
edgep= [];              %edges of polygon
bt = [];                %bad triangles
bt_edges = [];          %edges of bad triangles
%looping for every point except super triangle vertices
for i1 = 1:size(pts,1)
    for j = 1:size(tri,1)           % looping for triangles
        [center,r] = circumc(pts_new(tri(j,1),1:2),...
            pts_new(tri(j,2),1:2),...
            pts_new(tri(j,3),1:2));         % getting center anbd radius of the circumcircle
        
        if (pts(i1,1)-center(1))^2 + (pts(i1,2)-center(2))^2-r^2 <0 %if pt is inside circumcircle
            bt = [bt;tri(j,:)];
            bt_edges = [bt_edges;tri(j,1),tri(j,2);tri(j,1),tri(j,3)...
                ;tri(j,2),tri(j,3)];
            
        end
    end
    
    for i = 1:size(bt_edges,1)
        if bt_edges(i,1)>bt_edges(i,2)
            bt_edges(i,:) = fliplr(bt_edges(i,:));
        end
    end
    
    
    for i = 1:size(bt_edges,1)      %storing unshared bad edges as a polygon edges
        uval = ismember(bt_edges,bt_edges(i,:),'rows');
        if sum(uval)==1
            edgep = [edgep;bt_edges(i,:)];
        end
    end
    
    tri = [tri;edgep,i1.*ones(size(edgep,1),1)];      %triangulation
    if isempty(bt)==0
        tri  = setdiff(tri,bt,'rows');  % removing bad triangles
    end
    bt = [];
    bt_edges = [];
    edgep = [];
end


%% removing the triangles associated with vertices of super triangle

tri_new = [];
for i = 1:size(tri,1)
    if tri(i,1)~=size(pts,1)+1 && tri(i,1)~=size(pts,1)+2 && tri(i,1)~=size(pts,1)+3
        if tri(i,2)~=size(pts,1)+1 && tri(i,2)~=size(pts,1)+2 && tri(i,2)~=size(pts,1)+3
            if tri(i,3)~=size(pts,1)+1 && tri(i,3)~=size(pts,1)+2 && tri(i,3)~=size(pts,1)+3
                tri_new = [tri_new;tri(i,:)];
            end
        end
    end
end
tri_new = unique(tri_new,'rows');

%% plotiing delaunay triangulation
figure('Name','delaunay triangulation by Delaunay_MAIN');
xlabel('x');ylabel('y');
for k = 1: size(tri_new,1)
    plot_pts = [pts_new(tri_new(k,1),1:2);pts_new(tri_new(k,2),1:2);...
        pts_new(tri_new(k,3),1:2);pts_new(tri_new(k,1),1:2)];
    hold on;
    plot(plot_pts(:,1),plot_pts(:,2),'k')
end
% legend('delaunay triangulation by DelaunayMAIN')


end
