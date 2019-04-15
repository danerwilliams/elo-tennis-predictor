%% InitializeID.m
% initializes elos and finds number of matches played by each player

function InitializeElos(data, unique, name2IDmap)

global playerELOs;          %Allows access to playerELOs and playerMatches
global playerMatches;

playerELOs = zeros(length(unique),1); %Initializes a vector for all ELOs 
playerELOs(:,1) = 1500;                 %Initializes all ELOs to 1500
playerMatches = zeros(length(unique),1); %Initializes vector of matches played for each player

for i = 1:length(data)                  %Loops through all matches, and counts for each player 
    winner = char(data(i).Winner);      % how many matches they have played
    winnerID = name2IDmap(winner);
    loser = char(data(i).Loser);
    loserID = name2IDmap(loser);
    playerMatches(winnerID) = playerMatches(winnerID) + 1;
    playerMatches(loserID) = playerMatches(loserID) + 1;
end

