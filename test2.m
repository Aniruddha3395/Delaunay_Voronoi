clc;
clear;
close;

fileID = fopen('file.txt','r');
format = '%d %d %d';
a = fscanf(fileID,format,[3 Inf])'
