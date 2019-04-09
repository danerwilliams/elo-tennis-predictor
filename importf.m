%% importf.m
% utilized by import data to turn a tennis excel file into a cell array
% including columns 3 through 11 from excel (other columns shouldn't be
% needed)

%don't know how but this works

function data = importf(file) %parameter is path name as a string

[~, ~, data] = xlsread(file);
data = data(1:length(data),3:10);
data(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),data)) = {''};

idx = cellfun(@ischar, data);
data(idx) = cellfun(@(x) string(x), data(idx), 'UniformOutput', false);

% clear temporary vars
clearvars idx;