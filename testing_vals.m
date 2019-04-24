function [percent_correct]=testing_vals(data, name2IDmap, playerELOs_kmap, k, playerELOs_Ktest, playerMatches_Ktest,matchRound)

number_correct = 0;
total_number = 0;

for i = (length(data)-2500):length(data)     %Loops through all matches, and counts for each player
    
    winner_actual = char(data(i).Winner);      % how many matches they have played
    winnerID_actual = name2IDmap(winner_actual);
    loser_actual = char(data(i).Loser);
    loserID_actual = name2IDmap(loser_actual);
    matchRound = char(data(i).Round);
    
    if playerELOs_kmap(winner_actual) > playerELOs_kmap(loser_actual)
        number_correct = number_correct + 1;
    end
    total_number = total_number+1;
    
    [playerELOs_Ktest(winnerID_actual),playerELOs_Ktest(loserID_actual)] = (calculateElo(winnerID_actual,loserID_actual, k, playerELOs_Ktest, playerMatches_Ktest, matchRound));
    
end

percent_correct = number_correct/total_number*100;

end