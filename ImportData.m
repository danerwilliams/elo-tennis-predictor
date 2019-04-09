%% ImportData.m

%parameter paths should be a cell array of strings containing the paths of
%all excel files to be imported
function [combinedData, uniqueNames] = ImportData(paths)

l = length(paths); %number of excel files
mydata = cell(1, l); %declares a 1xl cell array

%creates a cell array containing cell arrays for each excel file
for i=1:l
    mydata{i} = importf(paths{i});
end

% initialize struct
newdata(1).Tournament = '';
newdata(1).Date = 0;
newdata(1).Series = '';
newdata(1).Court = '';
newdata(1).Surface = '';
newdata(1).Round = 0;
newdata(1).BestOf = '';
newdata(1).Winner = '';
newdata(1).Loser = '';

% initializes a counter to be used in for loop for keeping track of the index last element in
% struct after adding an entire excel file's worth of data to struct
count = 0;

%initialize cell array names which will include all names including
%repeats, later to be converted to a cell array of unique names
names{1} = '';

for i=1:length(mydata) %outer loop iterates through each excel file's cell array
    
    for n=1:length(mydata{i})-1 %inner loop iterates through each element of excel file's cell array
        
        %add elements from cell array to struct sequentially
        newdata(n+count).Tournament = mydata{i}{n+1,1};
        newdata(n+count).Date = mydata{i}{n+1,2};
        newdata(n+count).Series = mydata{i}{n+1,3};
        newdata(n+count).Court = mydata{i}{n+1,4};
        newdata(n+count).Surface = mydata{i}{n+1,5};
        newdata(n+count).Round = mydata{i}{n+1,6};
        newdata(n+count).BestOf = mydata{i}{n+1,7};
        newdata(n+count).Winner = mydata{i}{n+1,8};
        newdata(n+count).Loser = mydata{i}{n+1,9};
        
        %add names to non-unique names list
        names{n+count} = mydata{i}{n+1, 8};
        
    end
    
    %adds the length of last iterated inner cell array to counter -1 to
    %exclude headers
    count = count + length(mydata{i})-1; 
    disp(num2str(count));
    
end

%converts non-unique names cell array of strings to non-unique names cell
%array of character vectors so that it can be used with unique() function
uniqueNamesHolder = cellstr(names)

combinedData = newdata; %return structure of all data from excel files put into one
uniqueNames = unique(uniqueNamesHolder); %returns cell array of char vectors containing unique names
