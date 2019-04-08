%% eloProjectMain.m
%
%   Main function.
%
%% Create User IDs
a = 1:1:197;
x = a.';
b = table2cell(playerNames(:,2));
names = string(b.');
name2IDmap = containers.Map('KeyType','char','ValueType','double');
for i = 1:197
    name2IDmap(char(names(1,i))) = i;
end
ID2namemap = containers.Map(x,b);

%% Initialize every players ELO to 1500
playerELOs = zeros(197,1);
playerELOs(:,1) = 1500;


%% update ELOs from match data
for i = 1:length(matchdata)
    winner = char(string(matchdata{i,10}));
    winnerID = name2IDmap(winner);
    loser = char(string(matchdata{i,11}));
    loserID = name2IDmap(loser);
    [playerELOs(winnerID),playerELOs(loserID)] =(calculateElo(playerELOs(winnerID),32,1,playerELOs(loserID)));
    
end


