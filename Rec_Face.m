function Output = Rec_Face(tstImg, m, A, eigFace)

proImg = [];

%project the Eigenface
number = size(eigFace,2);
for i=1 : number
    temp = eigFace' * A(:,i);
    proImg = [proImg temp];
end

totalimg = 53;
nc = 2;
B = [];
i = 1;
 for j = 1 : totalimg
     temp = 0;
     for k = 1 : nc
         temp = proImg(:,i) + temp;
         i = i + 1;
     end
     temp = temp./nc;
     B = [B temp];
 end
save B B;
Input = imread(tstImg);
img_in=Input;
temp = rgb2gray(Input);
[R C] = size(temp);
image = reshape(temp', R*C, 1);
Diff = double(image) - m;
pt_img = eigFace' * Diff;

totalClass=53;
eucDist = [];
for i = 1 : totalClass
    d = B(:,i);
    temp = norm(pt_img - d);
    eucDist = [eucDist temp];
end


[eucDistmin, r_ind] = min(eucDist);
disp('Minmum Euclidean distance:');
disp(eucDistmin);

Output = strcat(num2str(r_ind));

Output = strcat(num2str(r_ind*2),'.jpg');
selectimg = strcat('.\TrainDatabase1' , '\' , Output);
selectimg = imread(selectimg);

img = imread(tstImg);
subplot(1,2,1);imshow(img_in);title('Test image');
hold on
subplot(1,2,2);imshow(selectimg);title('Equivalent image');


