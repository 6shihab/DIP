clc;
clear all;
close all;
i1=imread('fruits.jpg');
i2=rgb2gray(i1);
figure(1)
subplot(121);
imshow(i2)
title('Original image')
b=255-i2;
subplot(122);
imshow(b);
title('Negative image')
