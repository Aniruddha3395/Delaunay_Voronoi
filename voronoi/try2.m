clc;
clear all
close all;

x = [
    1 1
    2 2
    3 3
    4 4
    2 2
    3 3
    3 3
    ];
[u,I,J] = unique(x, 'rows', 'first')
hasDuplicates = size(u,1) < size(x,1)
ixDupRows = setdiff(1:size(x,1), I)
dupRowValues = x(ixDupRows,:)