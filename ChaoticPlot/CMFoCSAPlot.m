function CMFoCSAPlot
% By x0 = 0.5 and b = 0.2, chaotic numbers will be generated in (0,1)
OPTIONS_.noRand = 10000;
OPTIONS_.a = linspace(-1, 1, 100);
OPTIONS_.b = linspace(-10, 10, 100);

OPTIONS = struct();
% OPTIONS.x0 = @rand;

for a = OPTIONS_.a
%     OPTIONS.a = a;
    for b = OPTIONS_.b
%         OPTIONS.b = b;
        randVector = CMFoCSA(1, OPTIONS_.noRand, OPTIONS);
        clf
        disp(['Constant a: ', num2str(a), ' --- Constant b:', num2str(b)]);
        subplot(1, 2, 1);
        scatter(1 : length(randVector), randVector, '.');
        title('CMFoCSA Chaotic Map Function');
        xlabel('Iteration');
        ylabel('Randomly Generated');
        
        subplot(1, 2, 2);
        histogram(randVector, 100);
        title('CMFoCSA Chaotic Map Function');
        xlabel('100 Bins');
        ylabel('Number Of Example');
        pause(0.01);
    end
end

end

