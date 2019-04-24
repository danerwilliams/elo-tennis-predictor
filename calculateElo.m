function [newPlayerOneElo,newPlayerTwoElo] = calculateElo(playerOneID,playerTwoID, k, playerELOs, playerMatches, matchRound)
% CALCULATE ELO
% oldElo = Players ELO ranking before the match occurs
% K = K factor (Max amount of points gained or lost)
% Outcome = 1 or 0, corresponding to Win or Loss
% opponentElo = the opposing players Elo before the game
    
    playerOneElo = playerELOs(playerOneID,1);       %Gets the old ELOs of the players
    playerTwoElo = playerELOs(playerTwoID,1);
    
    pWinPlayerOne = 1/(1 + 10^((playerOneElo - playerTwoElo)/400)); %Calculates win probabilities
    pWinPlayerTwo = 1/(1 + 10^((playerTwoElo - playerOneElo)/400));
    
    
    playerOneMatches = playerMatches(playerOneID);      %gets how many matches in a players data set
    playerTwoMatches = playerMatches(playerTwoID);
    
%     kMultiplier = 0;
%     
%     switch matchRound
%         case '1st Round'
%             kMultiplier = 1;
%         case '2nd Round'
%             kMultiplier = 1.1;
%         case '3rd Round'
%             kMultiplier = 1.2;
%         case '4th Round'
%             kMultiplier = 1.3;
%         case 'Quarterfinals'
%             kMultiplier = 1.4;
%         case 'Semifinals'
%             kMultiplier = 1.5;
%         case 'The Final'
%             kMultiplier = 1.6;
%         otherwise
%             kMultiplier = 1;
%     end
%             
%     
%       kPlayerOne = kMultiplier*k/(playerOneMatches + 5)^.4;
%       kPlayerTwo = k * (kMultiplier ^ -1)/(playerTwoMatches + 5)^.4;

%kplayer one = k * MOV
%kplayer two = k*MOV

    
    playerOneOutcome = 1;       %Winner is 1, loser is 0
    playerTwoOutcome = 0;
    
  
    
    %Calculates ELOs based on ELO formula
    newPlayerOneElo = round(playerOneElo + kPlayerOne*(playerOneOutcome - pWinPlayerOne),2);
    
    newPlayerTwoElo = round(playerTwoElo + kPlayerTwo*(playerTwoOutcome - pWinPlayerTwo),2);

    