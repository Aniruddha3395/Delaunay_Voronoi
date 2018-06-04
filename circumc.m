function [center,r] = circumc(p1,p2,p3)

% circumcenter for triangle

tri = [p1;p2;p3;p1];
plot(tri(:,1),tri(:,2))           %plotting triangle
% xlim([-20,20]);
% ylim([-20,20]);

a = det([p1(1),p1(2),1;p2(1),p2(2),1;p3(1),p3(2),1]);
bx = det(-[p1(1)^2+p1(2)^2,p1(2),1;p2(1)^2+p2(2)^2,p2(2),1;p3(1)^2+p3(2)^2,p3(2),1]); 
by = det([p1(1)^2+p1(2)^2,p1(1),1;p2(1)^2+p2(2)^2,p2(1),1;p3(1)^2+p3(2)^2,p3(1),1]);
c = det(-[p1(1)^2+p1(2)^2,p1(1),p1(2);p2(1)^2+p2(2)^2,p2(1),p2(2);p3(1)^2+p3(2)^2,p3(1),p3(2)]);

center = [-(bx/(2*a)),-(by/(2*a))];
r = sqrt((bx^2)+(by^2)-(4*a*c))/(2*abs(a));
hold on;                          %plotting circumcircle
plotc(center,r);

end