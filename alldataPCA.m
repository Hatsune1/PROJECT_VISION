alldata = load('alldata.mat');

i = 9;
k = 5;

mat = alldata.alldata(i).mat;
% delete the confidence columns
mat(:,3:3:51) = [];

[Xet, Xel,Xcov,mPCA] = alldataPca(mat, k);

%colors=['y','m','c','r','g','b','k'];

for i = 1:k
    x = 1:size(mPCA,1);
    %color = colors(randi([1,length(colors)],1,1));
    plot(x, mPCA(:,k));
    hold on
end
hold off
plot(x, mPCA(:,1))
hold on
plot(x, mPCA(:,2))
hold on
plot(x, mPCA(:,3))
hold on
plot(x, mPCA(:,4))
hold on
plot(x, mPCA(:,5))
hold off


function [Met, Mel,Mcov,mPCA] = alldataPca(M, k)
Mm = mean(M,1);
Mn = M - Mm;
Mcov = cov(Mn);
[Met, Mel] = eig(Mcov);
mPCA = M*Met(:,end-k+1:end);
end
