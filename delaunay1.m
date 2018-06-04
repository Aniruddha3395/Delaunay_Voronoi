clc;
clear all;
close all;

%% delaunay triangulation by matlab

% pts = rand(15,2);
% tri = delaunay(pts);
% patch('Faces',tri,'Vertices',pts,'FaceColor','none');

%% input
pts1 = [1,1;
    6,6;
    12,1;
    4.5,8;
    3.7,9;
    9,3.3;
    2.8,1.9;
    10,11
    ]
scatter(pts1(:,1),pts1(:,2),'.')


%algorihm

% % %circumcenter for triangle
% % p1 = [1,1];
% % p2 = [4,5];
% % p3 = [5,4];
% % 
% % tri = [p1;p2;p3;p1];
% % plot(tri(:,1),tri(:,2))
% % xlim([-2,8]);
% % ylim([-2,8]);
% % 
% % a = det([p1(1),p1(2),1;p2(1),p2(2),1;p3(1),p3(2),1]);
% % bx = det(-[p1(1)^2+p1(2)^2,p1(2),1;p2(1)^2+p2(2)^2,p2(2),1;p3(1)^2+p3(2)^2,p3(2),1]); 
% % by = det([p1(1)^2+p1(2)^2,p1(1),1;p2(1)^2+p2(2)^2,p2(1),1;p3(1)^2+p3(2)^2,p3(1),1]);
% % c = det(-[p1(1)^2+p1(2)^2,p1(1),p1(2);p2(1)^2+p2(2)^2,p2(1),p2(2);p3(1)^2+p3(2)^2,p3(1),p3(2)]);
% % 
% % center = [-(bx/(2*a)),-(by/(2*a))];
% % r = sqrt((bx^2)+(by^2)-(4*a*c))/(2*abs(a));
% % hold on;
% % plotc(center,r);
% % 
% % % checking if point is inside the circle or not
% % pt = [1,1];
% % val = (pt(1)-center(1))^2 + (pt(2)-center(2))^2-r^2;
% % if val<0
% %     fprintf('\ninside the circle\n');
% % else
% %     fprintf('\non or outside the circle\n');
% % end
% % 
% % hold on;
% % scatter(pt(1),pt(2))