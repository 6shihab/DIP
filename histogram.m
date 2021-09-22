clc;
clear all;
close all;
im=imread('fruits.jpg');
img=rgb2gray(im);
figure(1);
subplot(2,1,1);
imshow(img);
title('Source image')
subplot(2,1,2);
imhist(img);
title('Histogram');
