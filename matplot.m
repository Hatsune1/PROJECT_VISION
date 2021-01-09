mat = load('J_02.mat')
matPlot(mat.mat)

function matPlot(mat)
    for i = 1:size(mat,1)
        Xs = mat(i,1:3:size(mat,2));
        Ys = mat(i,2:3:size(mat,2));
        refreshdata
        scatter(Xs,1000-Ys);
        xlim([0 2000]);
        ylim([0 1000]);
        drawnow
        pause(0.04);
    end
end