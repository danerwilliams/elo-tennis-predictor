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

for i = 1:282
    scaledDifference = playerELOs(i) - 1500;
    playerELOs(i) = 1.5 * scaledDifference + 1500;
end


[k, kVector, percentVector] = optimizeK(data, unique, name2IDmap);

[playerELOs, federerELOs, murrayELOs, djokovicELOs, nadalELOs] = SetElos(data, name2IDmap, k, playerELOs, playerMatches);
federerELOs = round(federerELOs);

for i = 1:282
    scaledDifference = playerELOs(i) - 1500;
    playerELOs(i) = 3.5 * scaledDifference + 1500;
end

