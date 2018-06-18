function [tri_new] = Voronoi_MAIN(pts,spacing)

%% Algorithm
  
tri_new = Delaunay_MAIN(pts,spacing);
pts = [pts,[1:size(pts,1)]']; %all points are denoted by [x y index]
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

sorted_edges = sortrows(edges);
store = [];
% sorted_edges_repeat = [];
for i = 1:size(sorted_edges,1)-1
    if sorted_edges(i,1)==sorted_edges(i+1,1) && sorted_edges(i,2)==sorted_edges(i+1,2)
%         sorted_edges_repeat = [sorted_edges_repeat;sorted_edges(i,:)];
        store = [store;sorted_edges(i,4),sorted_edges(i,5),sorted_edges(i+1,4),sorted_edges(i+1,5)];
    end
end
store;
% sorted_edges_nonrepeat = setdiff(sorted_edges(:,1:2),sorted_edges_repeat(:,1:2),'rows');
%this gives the pts index value from before

% store2 = [];
% for j =1:size(sorted_edges_nonrepeat,1)
% indexx = ismember(sorted_edges(:,1:2),sorted_edges_nonrepeat(j,:));
% indexx = indexx(:,1)+indexx(:,2);
% I = find(indexx==2);
% % store2 = [store2;sorted_edges(I,:)];
% mpx = (pts(sorted_edges(I,1),1)+pts(sorted_edges(I,2),1))/2;
% mpy = (pts(sorted_edges(I,1),2)+pts(sorted_edges(I,2),2))/2;
% store2 = [store2;mpx,mpy,sorted_edges(I,4),sorted_edges(I,5)]; 
% end


% figure;
for i = 1:size(store,1)
    
hold on
plot([store(i,1);store(i,3)],[store(i,2);store(i,4)],'k')
xlim([min(pts(:,1))-2,max(pts(:,1))+2]);
ylim([min(pts(:,2))-2,max(pts(:,2))+2]);
end
% legend('delaunay triangulation by VoronoiMAIN');

% for i = 1:size(store2,1)
% hold on
% plot([store2(i,1);store2(i,3)],[store2(i,2);store2(i,4)],'b')
% end
end