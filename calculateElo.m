function [newPlayerOneElo,newPlayerTwoElo]=calculateElo(oldPlayerOneElo,K,playerOneOutcome,oldPlayerTwoElo)
% CALCULATE ELO
% oldElo = Players ELO ranking before the match occurs
% K = K factor (Max amount of points gained or lost)
% Outcome = 1 or 0, corresponding to Win or Loss
% opponentElo = the opposing players Elo before the game
    pWinPlayerOne = 1/(1 + 10^((oldPlayerOneElo - oldPlayerTwoElo)/400));
    pWinPlayerTwo = 1/(1 + 10^((oldPlayerTwoElo - oldPlayerOneElo)/400));

    newPlayerOneElo = round(oldPlayerOneElo + K*(playerOneOutcome - pWinPlayerOne),2);
    if (playerOneOutcome)
        playerTwoOutcome = 0;
    else playerTwoOutcome = 1;
    end
    newPlayerTwoElo = round(oldPlayerTwoElo + K*(playerTwoOutcome - pWinPlayerTwo),2);

end
    