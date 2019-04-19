%% SetElos.m

function newPlayerELOs = SetElos(data, name2IDmap, k, playerELOs, playerMatches)

for i = 1:length(data)                  %Loops through all matches, and updates player's
    winner = char(data(i).Winner);      % ELOs for each match
    winnerID = name2IDmap(winner);
    loser = char(data(i).Loser);
    loserID = name2IDmap(loser);
    matchRound = char(data(i).Round);
    [playerELOs(winnerID),playerELOs(loserID)] =(calculateElo(winnerID,loserID, k, playerELOs, playerMatches, matchRound));
    
end

newPlayerELOs = round(playerELOs);         %Rounds playerELOs for readability