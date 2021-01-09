                                                                                                                                                                                                                    0load('C:\Users\WHY\Desktop\JK_Aux\workspace\json_all_data_16\squat_coords\Alessandro.mat');

x = squat_coords(1:2:34,:);
y = squat_coords(2:2:34,:);
scatter(transpose(x(:,1)),transpose(y(:,1)));

for n =1:2268
refreshdata
scatter(transpose(x(1:4,n)),1000-transpose(y(1:4,n)));
xlim([0 1000]);
ylim([0 1000]);
drawnow
pause(0.04);
end
