%% optimizeK.m
%
%   Main function.
%

function [KValue, kVector, percentVector]=optimizeK(data, unique, name2IDmap)
%% Initialize every players ELO to 1500
format longG


playerELOs_Ktest = zeros(length(unique),1); %Initializes a vector for all ELOs 
playerELOs_Ktest(:,1) = 1500;                 %Initializes all ELOs to 1500
playerMatches_Ktest = zeros(length(unique),1); %Initializes vector of matches played for each player


%% Find how many matches in a player's dataset

for i = 1:length(data)-83        %Loops through all matches, and counts for each player 
    winner_Ktest = char(data(i).Winner);      % how many matches they have played
    winnerID_Ktest = name2IDmap(winner_Ktest);
    loser_Ktest = char(data(i).Loser);
    loserID_Ktest = name2IDmap(loser_Ktest);
    playerMatches_Ktest(winnerID_Ktest) = playerMatches_Ktest(winnerID_Ktest) + 1;
    playerMatches_Ktest(loserID_Ktest) = playerMatches_Ktest(loserID_Ktest) + 1;
end


%% update ELOs from match data

optimal_K = 0;
Kpercent = 0;
h = 5;
prev_increase = true;
optimizing = false;
optimizing_value = 0;
last_percent = 0;
kVector1 = [];
percentVector1 = [];

% Machine learning...
while h<60
    kVector1 = [kVector1, h];
    for i = 1:length(data)-83               %Loops through all matches, and updates player's
        winner_Ktest = char(data(i).Winner);      % ELOs for each match
        winnerID_Ktest = name2IDmap(winner_Ktest);
        loser_Ktest = char(data(i).Loser);
        loserID_Ktest = name2IDmap(loser_Ktest);
        matchRound = char(data(i).Round);
        [playerELOs_Ktest(winnerID_Ktest),playerELOs_Ktest(loserID_Ktest)] = (calculateElo(winnerID_Ktest,loserID_Ktest, h, playerELOs_Ktest, playerMatches_Ktest,matchRound));
        
    end
    
    playerELOs_Ktest = round(playerELOs_Ktest);         %Rounds playerELOs for readability
    playerELOs_kMap = containers.Map(unique, playerELOs_Ktest);
    
    current_percent = testing_vals(data, name2IDmap, playerELOs_kMap, h, playerELOs_Ktest, playerMatches_Ktest, matchRound);
    disp([num2str(h), '= ', num2str(testing_vals(data, name2IDmap, playerELOs_kMap, h, playerELOs_Ktest, playerMatches_Ktest, matchRound))])
    if optimizing && current_percent > last_percent
        if current_percent > Kpercent
            optimal_K = h;
            Kpercent = current_percent; 
        end
        h = h-1;
        prev_increase = true;
        if h == optimizing_value
            h = optimizing_value-1;
        end
        last_percent = current_percent;
    elseif current_percent > last_percent
        if current_percent > Kpercent
            optimal_K = h;
            Kpercent = current_percent;
        end
        h = h+5;
        prev_increase = true;
        optimizing = false;
        last_percent = current_percent;
    elseif prev_increase && ~optimizing
        optimizing_value = h-5;
        h = h - 1;
        optimizing = true;
        last_percent = current_percent;
    elseif optimizing % and we see a decrease in percent
        optimizing = false;
        h = optimizing_value + 10;
        prev_increase = false;
        last_percent = current_percent;
    else
        h = h+5;
        last_percent = current_percent;
    end
    percentVector1 = [percentVector1, current_percent];
    
end
kVector = kVector1;
percentVector = percentVector1;
KValue = optimal_K;


