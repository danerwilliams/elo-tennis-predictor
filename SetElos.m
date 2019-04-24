%% SetElos.m

function [newPlayerELOs, federerELOs, murrayELOs, djokovicELOs, nadalELOs] = SetElos(data, name2IDmap, k, playerELOs, playerMatches)
federerELOs = zeros(1,22459);
nadalELOs = zeros(1,22459);
djokovicELOs = zeros(1,22459);
murrayELOs = zeros(1,22459);


for i = 1:length(data)                  %Loops through all matches, and updates player's
    winner = char(data(i).Winner);      % ELOs for each match
    winnerID = name2IDmap(winner);
    loser = char(data(i).Loser);
    loserID = name2IDmap(loser);
     matchRound = char(data(i).Round);
    [playerELOs(winnerID),playerELOs(loserID)] =(calculateElo(winnerID,loserID, k, playerELOs, playerMatches, matchRound));
    federerELOs(i) = playerELOs(74);
    murrayELOs(i) = playerELOs(118);
    nadalELOs(i) = playerELOs(75);
    djokovicELOs(i) = playerELOs(115);
    
    
end

newPlayerELOs = round(playerELOs);         %Rounds playerELOs for readability