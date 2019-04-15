%% eloProjectMain.m
%
%   Main function.
%

clear
clc

years = {'2010.xlsx','2011.xlsx','2012.xlsx','2013.xlsx','2014.xlsx','2015.xlsx','2016.xlsx','2017.xlsx', '2018.xlsx', '2016.xlsx','2019.xlsx'};
[data, unique] = ImportData(years);
[ID2namemap, name2IDmap] = CreateIDs(unique);

[playerELOs, playerMatches] = InitializeElos(data, unique, name2IDmap);

k = 60;

SetElos(data, name2IDmap, k, playerELOs, playerMatches);

optimizeK(data, unique, name2IDmap);
