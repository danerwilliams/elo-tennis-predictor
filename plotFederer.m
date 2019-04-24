%% Animate plot federer ELos
nt = 22495;
it = 1:nt;
figure()


for i = 2:150:(nt - 19)
    plot(it(1:i),federerELOs(1:i),'b',...
    it(i),federerELOs(i),'ro',...
    it(1:i),nadalELOs(1:i),'g',...
    it(i),nadalELOs(i),'ro',...
    it(1:i),djokovicELOs(1:i),'m',...
    it(i),djokovicELOs(i),'ro',...
    it(1:i),murrayELOs(1:i),'c',...
    it(i),murrayELOs(i),'ro');
    xlabel('Time');
    ylabel('Big 4 ELO');
    axis([0 22459 1200 2100])

    grid on
    drawnow
    

    
end