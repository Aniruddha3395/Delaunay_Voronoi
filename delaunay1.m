clc;
clear all;
close all;

%% input points

pts = [1,1;
    6,6;
    12,1;
    4.5,8;
    3.7,9;
    9,3.3;
    2.8,1.9;
    10,11
    ];
scatter(pts(:,1),pts(:,2),'.');         %showing points

%% delaunay triangulation by matlab

% tri = delaunay(pts);      %delaunay triangulation using MATLAB
% patch('Faces',tri,'Vertices',pts,'FaceColor','none');

%% algorihm

% creating the super triangle whcih will contain all the points inside it
xmax = max(pts(:,1));       xmin = min(pts(:,1));
ymax = max(pts(:,2));       ymin = min(pts(:,2));
spacing = 10;
p1_s = [xmin-spacing,ymin-spacing];
p2_s = [xmax+spacing,ymin-spacing];
p3_s = [0.5*(xmax+xmin),ymax+spacing];
tri_s = [p1_s,p2_s,p3_s]; 


tri = [tri_s];
tri_main = [];
edgep= []; 
for i = 1
    hold on;
    scatter(pts(i,1),pts(i,2),'g')
    for j = 1:size(tri,1)
        [center,r] = circumc(tri(1,1:2),tri(1,3:4),tri(1,5:6));
        
        if (pts(i,1)-center(1))^2 + (pts(i,2)-center(2))^2-r^2 
            fprintf('\ninside the circle\n');
            bt = [tri(1,:)];
            bt_edges = {[bt(1,1),bt(1,2);bt(1,3),bt(1,4)];
                [bt(1,1),bt(1,2);bt(1,5),bt(1,6)];
                [bt(1,3),bt(1,4);bt(1,5),bt(1,6)]};
            
            
            %%%%%%find edge of bt which is not shared by any other bt
            
        else
            fprintf('\non or outside the circle\n');
        end
     end
end


% p1 = pts(1,:);
% p2 = pts(2,:);
% p3 = pts(3,:);
% [center,r] = circumc(p1,p2,p3)
% 
% % checking if point is inside the circle or not
% pt = [2,2];
% val = (pt(1)-center(1))^2 + (pt(2)-center(2))^2-r^2;
% if val<0
%     fprintf('\ninside the circle\n');
% else
%     fprintf('\non or outside the circle\n');
% end
% 
% % hold on;
% % scatter(pt(1),pt(2))