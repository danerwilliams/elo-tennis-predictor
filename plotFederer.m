%% Animate plot federer ELos

function plotFederer(handles)
load('datadata.mat');

nt = 22495;
it = 1:nt;


for i = 2:150:(nt - 19)
    plot(handles.EloAxes, it(1:i),federerELOs(1:i),'b',...
    it(i),federerELOs(i),'ro',...
    it(1:i),nadalELOs(1:i),'g',...
    it(i),nadalELOs(i),'ro',...
    it(1:i),djokovicELOs(1:i),'m',...
    it(i),djokovicELOs(i),'ro',...
    it(1:i),murrayELOs(1:i),'c',...
    it(i),murrayELOs(i),'ro');
    xlabel('Time');
    ylabel('Big 4 ELO');
    axis([0 22459 1400 2100])

    grid on
    drawnow
    pause(0.005);

    
end

legend('Federer','Nadal','Djokovic','Murray');