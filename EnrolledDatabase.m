function [m A eigFace] = EnrolledDatabase()

%create Database
totalImg = 106;
Data=[];
for i = 1 : totalImg
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat('.\TrainDatabase1',str);    
    img = imread(str);
    img = rgb2gray(img);
    [row col] = size(img);   
    temp = reshape(img', row * col, 1);  
    Data = [Data temp];                     
end

m = mean(Data,2);
number = size(Data,2);

A = [];

%sub stract the mean 
for i = 1 : number
    temp = double(Data(:,i)) - m;
    A = [A temp]; 
end

%the covariance matrix
C = cov(A);

%the eigenvectors and eigenvalues 
[eigVact eigVal] = eig(C);

%sort the Eigenvalue and according to that Eigenvectors are selected

    eigVal = diag(eigVal);
    [sVal inds] = sort(eigVal,'descend');
    eigVact = eigVact(:,inds);

eigFace = A * eigVact;
