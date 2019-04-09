
%% Import the data
function data = importf(file)

[~, ~, data] = xlsread(file);
data = data(1:length(data),3:11);
data(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),data)) = {''};

idx = cellfun(@ischar, data);
data(idx) = cellfun(@(x) string(x), data(idx), 'UniformOutput', false);

%% Clear temporary variables
clearvars idx;