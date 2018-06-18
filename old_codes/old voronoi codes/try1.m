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
pts = unique(randi([1,20],10,2),'rows'); 

%% MATLAB VORONOI
figure;
tri = delaunay(pts(:,1:2));      %delaunay triangulation using MATLAB
patch('Faces',tri,'Vertices',pts,'FaceColor','none');
hold on;
voronoi(pts(:,1),pts(:,2));

%% code
pts = [pts,[1:size(pts,1)]'];   %all points are denoted by [x y index]
spacing  = 2000;
tri_new = Delaunay_MAIN(pts,spacing);

edges = [];
for i = 1: size(tri_new,1)
    p1 = pts(tri_new(i,1),1:2);
    p2 = pts(tri_new(i,2),1:2);
    p3 = pts(tri_new(i,3),1:2); 
   [c,r] = circumc(p1,p2,p3);
    if tri_new(i,1)<tri_new(i,2)
    edge1 = [tri_new(i,1),tri_new(i,2),i,c(1),c(2)];
    else
    edge1 = [tri_new(i,2),tri_new(i,1),i,c(1),c(2)];
    end
    if tri_new(i,1)<tri_new(i,3)
    edge2 = [tri_new(i,1),tri_new(i,3),i,c(1),c(2)];
    else
    edge2 = [tri_new(i,3),tri_new(i,1),i,c(1),c(2)];
    end
    if tri_new(i,2)<tri_new(i,3)
    edge3 = [tri_new(i,2),tri_new(i,3),i,c(1),c(2)];
    else
    edge3 = [tri_new(i,3),tri_new(i,2),i,c(1),c(2)];
    end
    
edges = [edges;edge1;edge2;edge3];
end

sorted_edges = sortrows(edges)
store = [];
for i = 1:size(sorted_edges,1)-1
    if sorted_edges(i,1)==sorted_edges(i+1,1) && sorted_edges(i,2)==sorted_edges(i+1,2)
        store = [store;sorted_edges(i,4),sorted_edges(i,5),sorted_edges(i+1,4),sorted_edges(i+1,5)];
    end
end
store


for i = 1:size(store,1)
   hold on
   plot([store(i,1);store(i,3)],[store(i,2);store(i,4)],'b')
  
end

