%% eloProjectMain.m
%
%   Main function.
%
%function eloProjectMain(app, years)

%global loading; 
%loading = 'Enter Selected Data Files (ex: 2017.xlsx, 2018.xlsx, 2019.xlsx)';
clear
clc

years = {'2010.xlsx', '2011.xlsx', '2012.xlsx', '2013.xlsx', '2014.xlsx', '2015.xlsx', '2016.xlsx', '2017.xlsx', '2018.xlsx', '2019.xlsx'};

[data, unique] = ImportData(years);
[ID2namemap, name2IDmap] = CreateIDs(unique);

[playerELOs, playerMatches] = InitializeElos(data, unique, name2IDmap);

optimizeK(data, unique, name2IDmap);

k = 60;

playerELOs = SetElos(data, name2IDmap, k, playerELOs, playerMatches);


