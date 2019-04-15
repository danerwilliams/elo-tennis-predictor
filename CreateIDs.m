%% CreateIDs.m

function [ID2namemap, name2IDmapreturn] = CreateIDs(data)

%implementation of ImportData function to generate a struct of data from
%all files entered as arguments

unique = data;

a = 1:1:length(unique);
x = a.';                    % Creates vector with an index for every unique player
names = unique.';           % Transposes the vector with all the unique names
name2IDmap = containers.Map('KeyType','char','ValueType','double');
for i = 1:length(unique)        %Creates maps for names and IDs. Ex( name2IDmap('Federer R.') gives Federer's ID
    name2IDmap(char(names(i,1))) = i;
end
ID2namemap = containers.Map(x,unique);
name2IDmapreturn = name2IDmap;