targetname = 'J_02';

jsonFileSuffix = '_keypoints.json';
addpath('./jsonlab-1.5/jsonlab-1.5');
jsonPath = strcat(strcat('../ALLDATA/',targetname),'/');
files = dir([jsonPath '/*.json']);

timelinejson = loadjson(strcat(strcat('../timeline/',targetname),'.json'));
timelineArray = timelinejson.squats{1,1}.in_and_out;
timelineLabel = timelinejson.squats{1,1}.class_label;

for i = 1:length(timelineLabel)
    startTime = timelineArray{2*i-1};
    endTime = timelineArray{2*i};
    frame = startTime;
    while(frame <= endTime)
        jsonKeypointPath = strcat(jsonPath,files(frame).name);
        [Xs,Ys,C] = extractJsonKeypoints(jsonKeypointPath);
        
        refreshdata
        scatter(Xs,1000-Ys);
        xlim([0 2000]);
        ylim([0 1000]);
        label = timelineLabel{i};
        text(50, 900, label);
        drawnow
        pause(0.04);
        frame = frame+1;
    end
end

function [Xs,Ys,C] = extractJsonKeypoints(jsonKeypointPath)
    keypoints = loadjson(jsonKeypointPath).people{1,1}.pose_keypoints;
    for i = 1:17
        Xs(i) = keypoints{3*i-2};
        Ys(i) = keypoints{3*i-1};
        C(i)  = keypoints{3*i};
    end
end
