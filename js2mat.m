names = {'J_01',
    'J_02',
    'J_INCORRECT_CHIN_TUCK_01',
    'J_INCORRECT_FEET_CLOSE_01',
    'J_INCORRECT_LEAN_01',
    'J_INCORRECT_LEAN_02',
    'J_INCORRECT_OUT_KNEES_01',
    'J2_03',
    'Joromy',
    'Louis',
    'Nick',
    'Rhys',
    'Ricky',
    'Sion',
    'SION_01',
    'SION_02',
    'Tom',
    'Wes_01',
    'Wes_02'};
name = names{1};

mat = js2Mat(name);

save(strcat(name,'.mat'), 'mat');

function mat = js2Mat(name)
    addpath('./jsonlab-1.5/jsonlab-1.5');
    jsonPath = strcat(strcat('../ALLDATA/',name),'/');
    files = dir([jsonPath '/*.json']);

    timelinejson = loadjson(strcat(strcat('../timeline/',name),'.json'));
    timelineArray = timelinejson.squats{1,1}.in_and_out;
    timelineLabel = timelinejson.squats{1,1}.class_label;
    mat = []
    for i = 1:length(timelineLabel)
        startTime = timelineArray{2*i-1};
        endTime = timelineArray{2*i};
        frame = startTime;
        while(frame <= endTime)
            jsonKeypointPath = strcat(jsonPath,files(frame).name);
            keypoints = loadjson(jsonKeypointPath).people{1,1}.pose_keypoints;
            keypointsArray = cat(2,keypoints{1:51});
            mat = [mat;keypointsArray];
            frame = frame+1;
        end
    end
end
