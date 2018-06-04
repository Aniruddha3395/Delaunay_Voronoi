clc;
clear;

i = 120:-1:60;
for j = 1:size(i,2)
   fprintf('%d,',i(j)) 
end
fprintf('\n')