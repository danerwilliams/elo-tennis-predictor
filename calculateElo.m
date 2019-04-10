function [newPlayerOneElo,newPlayerTwoElo]=calculateElo(playerOneID,playerTwoID)
% CALCULATE ELO
% oldElo = Players ELO ranking before the match occurs
% K = K factor (Max amount of points gained or lost)
% Outcome = 1 or 0, corresponding to Win or Loss
% opponentElo = the opposing players Elo before the game
    global playerELOs;          %Allows access to playerELOs and playerMatches
    global playerMatches;

    playerOneElo = playerELOs(playerOneID,1);       %Gets the old ELOs of the players
    playerTwoElo = playerELOs(playerTwoID,1);
    
    pWinPlayerOne = 1/(1 + 10^((playerOneElo - playerTwoElo)/400)); %Calculates win probabilities
    pWinPlayerTwo = 1/(1 + 10^((playerTwoElo - playerOneElo)/400));
    
    
    playerOneMatches = playerMatches(playerOneID);      %gets how many matches in a players data set
    playerTwoMatches = playerMatches(playerTwoID);
    
    kPlayerOne = ((25)/(playerOneMatches + 5)^.4);      %calculates K based on matches in set
    kPlayerTwo = ((25)/(playerTwoMatches + 5)^.4);
    
    playerOneOutcome = 1;       %Winner is 1, loser is 0
    playerTwoOutcome = 0;
    
    %Calculates ELOs based on ELO formula
    newPlayerOneElo = round(playerOneElo + kPlayerOne*(playerOneOutcome - pWinPlayerOne),2);
    
    newPlayerTwoElo = round(playerTwoElo + kPlayerTwo*(playerTwoOutcome - pWinPlayerTwo),2);

end
    