function lptest(file)
    ar = lp_w(file,[0.1 0.5 0.9]);
    set(gcf, 'position', [0 0 600 1000]);
    for i=1:3
        subplot(3,1,i);
        plot(ar(i,:));
    end
end