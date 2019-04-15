%% eloProjectMain.m
%
%   Main function.
%

clear
clc

years = {'2010.xlsx','2011.xlsx','2012.xlsx','2013.xlsx','2014.xlsx','2015.xlsx','2016.xlsx','2017.xlsx', '2018.xlsx', '2016.xlsx','2019.xlsx'};
[data, unique] = ImportData(years);
[ID2namemap, name2IDmap] = CreateIDs(unique);

global playerMatches;
global playerELOs;
InitializeElos(data, unique, name2IDmap);

k = 30;

SetElos(data, name2IDmap, k);

optimizeK(data, unique, name2IDmap);
