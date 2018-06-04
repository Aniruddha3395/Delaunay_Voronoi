clc;
clear;
close all;


names = {'O' 'A' 'B' 'C' 'D' 'E' 'F' 'T'};
names_to_numbers = 1:size(names,2);

start_node = input('input start node: ','s');       %start node
find(contains(names,start_node))