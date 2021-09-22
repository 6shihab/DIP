clc;
im=imread('fruits.jpg');
img=rgb2gray(im);
figure(1);
subplot(121);
imshow(img);
title('Input image.');
img2=im2double(img);
c=input('Input constant c:');
gamma=input('Input constant gamma:');
trans_img = c*(img2.^gamma);
subplot(122);
imshow(trans_img);
title('Power-law transformation')
