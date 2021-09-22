clc;
clear all;
close all;
 
% Median Filter
img=imread('cameraman.tif');
[r,c]=size(img);
img=im2double(img);
disp(img);
subplot(231);imshow(img);title('Source image');
 
%%% Adding Salt & Pepper Noise
noisy_img=imnoise(img,'salt & pepper');
subplot(232);imshow(noisy_img);title('Salt & Pepper noisy image');
 
%%% Filtering , window 3*3
mf_img=ordfilt2(noisy_img,5,ones(3,3));
subplot(233);imshow(mf_img);title('Median filtered image');
 
% Max & Min Filter
subplot(234);
imshow(img);
title('Source image');
 
maxf_img=ordfilt2(noisy_img,9,ones(3,3));
subplot(235);imshow(maxf_img);
title('Max filtered image');
 
minf_img=ordfilt2(noisy_img,1,ones(3,3));
subplot(236);
imshow(minf_img);
title('Min filtered image');
