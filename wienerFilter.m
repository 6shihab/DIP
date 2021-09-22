clc;
clear all;
close all;
 
% Minimum Mean Square Error Filter( Wiener Filter )
img=imread('cameraman.tif');
subplot(131)
imshow(img)
title('Source image')
 
%%%Adding Gaussian Noise
noisy_img=imnoise(img,'gaussian');
subplot(132);
imshow(noisy_img);
title('Gaussian noisy image');

 
wiener_img=wiener2(noisy_img,[5 5]);
subplot(133)
imshow(wiener_img);
title('Wiener filtered image')
