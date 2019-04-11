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
x = a.';                    % Creates vector with an index for every unique player
names = unique.';           % Transposes the vector with all the unique names
name2IDmap = containers.Map('KeyType','char','ValueType','double');
for i = 1:length(unique)        %Creates maps for names and IDs. Ex( name2IDmap('Federer R.') gives Federer's ID
    name2IDmap(char(names(i,1))) = i;
end
ID2namemap = containers.Map(x,unique);


%% Initialize every players ELO to 1500
global playerELOs;          %Declares playerELOs and playerMatches as global,
global playerMatches;       % so calculateELO.m can access it

playerELOs = zeros(length(unique),1); %Initializes a vector for all ELOs 
playerELOs(:,1) = 1500;                 %Initializes all ELOs to 1500
playerMatches = zeros(length(unique),1); %Initializes vector of matches played for each player


%% Find how many matches in a player's dataset

for i = 1:length(data)                  %Loops through all matches, and counts for each player 
    winner = char(data(i).Winner);      % how many matches they have played
    winnerID = name2IDmap(winner);
    loser = char(data(i).Loser);
    loserID = name2IDmap(loser);
    playerMatches(winnerID) = playerMatches(winnerID) + 1;
    playerMatches(loserID) = playerMatches(loserID) + 1;
end

%% update ELOs from match data
for i = 1:length(data)                  %Loops through all matches, and updates player's
    winner = char(data(i).Winner);      % ELOs for each match
    winnerID = name2IDmap(winner);
    loser = char(data(i).Loser);
    loserID = name2IDmap(loser);
    [playerELOs(winnerID),playerELOs(loserID)] =(calculateElo(winnerID,loserID, 25));
    
end

playerELOs = round(playerELOs);         %Rounds playerELOs for readability
