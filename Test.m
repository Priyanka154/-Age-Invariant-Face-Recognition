clc; clear all; close all;
tic;
[m , A, eigFace] = EnrolledDatabase();

path = '.\TestDatabase1\';
%  i = input('Enter test set: ');
 i='2';
str = [path , num2str(i)];
    
str1 = dir(str);
%  tstImg = input('Enter Image: ');
tstImg=2;
str1 = [str1(tstImg+2).name];
tstImg = [str, '\', str1];

Rec_Face(tstImg, m, A, eigFace);
toc;