%% eloProjectMain.m
%
%   Main function.
%
clear
clc

%% Create User IDs



%implementation of ImportData function to generate a struct of data from
%all files entered as arguments

years = {'2010.xlsx','2011.xlsx','2012.xlsx','2013.xlsx','2014.xlsx','2015.xlsx','2016.xlsx','2017.xlsx', '2018.xlsx', '2016.xlsx','2019.xlsx'};

[data, unique] = ImportData(years);


% another test case
%[data, unique] = ImportData({'2017.xlsx', '2018.xlsx', '2019.xlsx'});

a = 1:1:length(unique);
x = a.';
names = unique.';
name2IDmap = containers.Map('KeyType','char','ValueType','double');
for i = 1:length(unique)
    name2IDmap(char(names(i,1))) = i;
end
ID2namemap = containers.Map(x,unique);


%% Initialize every players ELO to 1500
global playerELOs;
global playerMatches;

playerELOs = zeros(length(unique),1);
playerELOs(:,1) = 1500;
playerMatches = zeros(length(unique),1);


%% Find how many matches in a player's dataset

for i = 1:length(data)
    winner = char(data(i).Winner);
    winnerID = name2IDmap(winner);
    loser = char(data(i).Loser);
    loserID = name2IDmap(loser);
    playerMatches(winnerID) = playerMatches(winnerID) + 1;
    playerMatches(loserID) = playerMatches(loserID) + 1;
end

%% update ELOs from match data
for i = 1:length(data)
    winner = char(data(i).Winner);
    winnerID = name2IDmap(winner);
    loser = char(data(i).Loser);
    loserID = name2IDmap(loser);
    [playerELOs(winnerID),playerELOs(loserID)] =(calculateElo(winnerID,loserID));
    
end

playerELOs = round(playerELOs);
