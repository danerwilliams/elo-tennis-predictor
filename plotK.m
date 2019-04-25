%% Animate plot federer ELos
figure()



% 
% 
% plot(kVector,percentVector)
% plot(y);

% plot(kVector(1:13),percentVector(1:13),'b',kVector(5),percentVector(5),'ro');

for i = 1:13
    plot(kVector(1:13),percentVector(1:13),'b',kVector(5),percentVector(5),'ro');
    xlabel('K');
    ylabel('Percent Correct');
    axis([0 60 0 1])

    grid on

    
end