%test case generator

clc;
clear;
close all;

total_nodes = 5;
edges = 10;
wll = 1;
wul = 10;

a = zeros(edges,3);
for i=1:edges
    flag = 0;
    while flag==0
        a(i,1:2) = randi([1,total_nodes],1,2);
        if a(i,1)~=a(i,2)
            flag = 1;
        end
    end
end
a = unique(a,'rows');
a(:,3) = randi([wll,wul],size(a,1),1);

a = [a,(a(:,1)).^2+(a(:,2)).^2]
[~, rows] = unique(a(:, 4));
b = a(rows, :);
a = b(:,1:3)
       

