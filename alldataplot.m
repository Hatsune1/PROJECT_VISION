alldata = load('alldata.mat');

i = 9;

alldataPlot(alldata.alldata(i))

function alldataPlot(alldata)
    data = alldata.mat;
    for i = 1:size(data,1)
        Xs = data(i,1:3:size(data,2));
        Ys = data(i,2:3:size(data,2));
        refreshdata
        scatter(Xs,1000-Ys);
        xlim([0 2000]);
        ylim([0 1000]);
        name = alldata.name;
        text(1000,900,name);
        label = alldata.labels{i};
        text(50, 900, label);
        drawnow
        pause(0.04);
    end
end