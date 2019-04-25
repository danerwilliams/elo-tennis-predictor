function [edgePlayerOne, edgePlayerTwo,playerOneProbability,vegasPlayerOneProbability,playerTwoProbability,vegasPlayerTwoProbability] = compareOdds(playerOneOdds,playerTwoOdds,playerOne,playerTwo)
load('datadata.mat');
% ONLY WORKS IF PLAYERONE IS THE FAVORITE, ONLY MONEYLINE BETS


playerOneID = name2IDmap(playerOne);
playerTwoID = name2IDmap(playerTwo);

playerOneProbability = 1/(1 + 10^((playerELOs(playerOneID) - playerELOs(playerTwoID))/400)) * 100;
playerTwoProbability = 1/(1 + 10^((playerELOs(playerTwoID) - playerELOs(playerOneID))/400)) * 100;

vegasPlayerOneProbability = (playerOneOdds/(playerOneOdds + 100)) * 100;
vegasPlayerTwoProbability = (100 / (playerTwoOdds + 100)) * 100;

edgePlayerOne = (playerOneProbability - vegasPlayerOneProbability);
edgePlayerTwo = (playerTwoProbability - vegasPlayerTwoProbability);

% Plot to compare odds

% y = [playerOneProbability, vegasPlayerOneProbability];
% bar(y);