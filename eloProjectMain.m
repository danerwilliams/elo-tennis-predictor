%% eloProjectMain.m
%
%   Main function.
%
clear
clc

%% Create User IDs


%{
%implementation of ImportData function to generate a struct of data from
%all files entered as arguments

years = {'2001.xlsx', '2002.xlsx','2003.xlsx','2004.xlsx', ...
    '2005.xlsx','2006.xlsx','2007.xlsx','2008.xlsx', ...
    '2009.xlsx','2010.xlsx','2011.xlsx','2012.xlsx', ...
    '2013.xlsx','2014.xlsx','2015.xlsx','2016.xlsx', ...
    '2017.xlsx','2018.xlsx','2019.xlsx'};

[data, unique] = ImportData(years);
%}

% another test case
%[data, unique] = ImportData({'2017.xlsx', '2018.xlsx', '2019.xlsx'});

a = 1:1:197;
x = a.';
b = table2cell(playerNames(:,2));
names = string(b.');
name2IDmap = containers.Map('KeyType','char','ValueType','double');
for i = 1:197
    name2IDmap(char(names(1,i))) = i;
end
ID2namemap = containers.Map(x,b);


%% Initialize every players ELO to 1500
playerELOs = zeros(197,1);
playerELOs(:,1) = 1500;


%% update ELOs from match data
for i = 1:length(matchdata)
    winner = char(string(matchdata{i,10}));
    winnerID = name2IDmap(winner);
    loser = char(string(matchdata{i,11}));
    loserID = name2IDmap(loser);
    [playerELOs(winnerID),playerELOs(loserID)] =(calculateElo(playerELOs(winnerID),32,1,playerELOs(loserID)));
    
end


