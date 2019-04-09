%% ImportData.m

function combinedData = ImportData(paths)%parameter paths should be a cell array

l = length(paths);
mydata = cell(1, l);

for i=1:l
    mydata{i} = importf(paths{i});
end

disp(mydata{1}{1,1});

newdata(1).Tournament = '';
newdata(1).Date = 0;
newdata(1).Series = '';
newdata(1).Court = '';
newdata(1).Surface = '';
newdata(1).Round = 0;
newdata(1).BestOf = '';
newdata(1).Winner = '';
newdata(1).Loser = '';

count = 0;

for i=1:length(mydata)
    
    for n=1:length(mydata{i})-1
        newdata(n+count).Tournament = mydata{i}{n+1,1};
        newdata(n+count).Date = mydata{i}{n+1,2};
        newdata(n+count).Series = mydata{i}{n+1,3};
        newdata(n+count).Court = mydata{i}{n+1,4};
        newdata(n+count).Surface = mydata{i}{n+1,5};
        newdata(n+count).Round = mydata{i}{n+1,6};
        newdata(n+count).BestOf = mydata{i}{n+1,7};
        newdata(n+count).Winner = mydata{i}{n+1,8};
        newdata(n+count).Loser = mydata{i}{n+1,9};
    end
    
    count = count + length(mydata{i}); 
    disp(num2str(count));
    
end

combinedData = newdata;
