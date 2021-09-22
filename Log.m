clc;
clear all;
close all;
im=imread('fruits.jpg');
img=rgb2gray(im);
figure(1);
subplot(1,2,1)
imshow(img)
title('Input image.');
img2=im2double(img);
c=input('Input constant c:');
trans_img = c*log(1+img2);
subplot(1,2,2)
imshow(trans_img)
title('Log transformed image');
