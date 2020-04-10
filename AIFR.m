clear all;clc;close all

TrainDatabasePath = uigetdir('D:\\00AIFR', 'Select Training database path' );
TestDatabasePath = uigetdir('D:\\00AIFR', 'Select Test database path');

prompt = {'Enter Test Image from Class(Enter Number between 1 to 10):'};
dlg_title = 'Input of Face Recognition System';
num_lines= 1;
def = {'1'};
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);


for i=1:6
    
    
prompt = {'Enter test image name (a number between 1 to 10):'};
TestImage1  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage1),'.jpg');
im = imread(TestImage);
% im1=imread(strcat('D:\00PCA\TestDatabase\1','\',char(TestImage1),'.BMP'));
%  [result Pk] = nntool(event);
 [OutputName Pk] = Recognition(TestImage, m, A, Eigenfaces);
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
% SelectedImage = strcat('D:\00PCA\TrainDatabase','\',OutputName);
SelectedImage = imread(SelectedImage);
imagesc(im);


subplot(1,2,1);imshow(im);title('Test Image');
subplot(1,2,2);imshow(SelectedImage);title('Equivalent Image');

str1=strcat('Entered Image is:',TestImage);
disp(str1);
str = strcat('Matched image is :  ',OutputName);
disp(str);
MSE=mean(mean(double(rgb2gray(im))-double(rgb2gray(SelectedImage))).^2)
 psnr = 10* log10((255^2)/MSE)

 
end
