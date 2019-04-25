%% Animate plot federer ELos

function plotK(handles)
load('datadata.mat');



% 
% 
% plot(kVector,percentVector)
% plot(y);

%plot(kVector(1:13),percentVector(1:13),'b',kVector(5),percentVector(5),'ro');

for i = 1:13
    plot(handles.Kaxes, kVector(1:i),percentVector(1:i),'b',kVector(i),percentVector(i),'k.');
    xlabel(handles.Kaxes,'K');
    ylabel(handles.Kaxes,'Percent Correct');
    axis(handles.Kaxes,[5 55 61 71])
    
    grid on
    drawnow
    pause(0.2)

    
end