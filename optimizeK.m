%% optimizeK.m
%
%   Main function.
%

function optimizeK(data, unique, name2IDmap)
%% Initialize every players ELO to 1500


global playerELOs_Ktest;          %Declares playerELOs and playerMatches as global,
global playerMatches_Ktest;       % so calculateELO.m can access it

playerELOs_Ktest = zeros(length(unique),1); %Initializes a vector for all ELOs 
playerELOs_Ktest(:,1) = 1500;                 %Initializes all ELOs to 1500
playerMatches_Ktest = zeros(length(unique),1); %Initializes vector of matches played for each player


%% Find how many matches in a player's dataset

for i = 1:length(data)-800-2367        %Loops through all matches, and counts for each player 
    winner_Ktest = char(data(i).Winner);      % how many matches they have played
    winnerID_Ktest = name2IDmap(winner_Ktest);
    loser_Ktest = char(data(i).Loser);
    loserID_Ktest = name2IDmap(loser_Ktest);
    playerMatches_Ktest(winnerID_Ktest) = playerMatches_Ktest(winnerID_Ktest) + 1;
    playerMatches_Ktest(loserID_Ktest) = playerMatches_Ktest(loserID_Ktest) + 1;
end


%% update ELOs from match data

for h = 100:5:200
    for i = 1:length(data)-800-2367               %Loops through all matches, and updates player's
        winner_Ktest = char(data(i).Winner);      % ELOs for each match
        winnerID_Ktest = name2IDmap(winner_Ktest);
        loser_Ktest = char(data(i).Loser);
        loserID_Ktest = name2IDmap(loser_Ktest);
        [playerELOs_Ktest(winnerID_Ktest),playerELOs_Ktest(loserID_Ktest)] = (calculateElo(winnerID_Ktest,loserID_Ktest, h));
        
    end
    
    playerELOs_Ktest = round(playerELOs_Ktest);         %Rounds playerELOs for readability
    global playerELOs_kMap;
    playerELOs_kMap = containers.Map(names, playerELOs_Ktest);
    
    disp([num2str(h), '= ', num2str(testing_vals(data, name2IDmap, playerELOs_kMap, h))])
end


