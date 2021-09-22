clc;
clear all;
close all;
 
% Midpoint Filter ( MF )
img=imread('cameraman.tif');
[r,c]=size(img);
img=im2double(img);
subplot(221);imshow(img);title('Source image');
 
%%% Adding Gaussian Noise
noisy_img=imnoise(img,'Gaussian');
subplot(222);imshow(noisy_img);title('Gaussian noisy image');
%%% Filtering , window 3*3
 
midf_img= ( ordfilt2(noisy_img,9,ones(3,3)) + ordfilt2(noisy_img,1,ones(3,3)) )./2;
subplot(223);imshow(midf_img);title('Midpoint filtered image');
 
% Alpha-trimmed Mean Filter ( ATMF )
%%% 'valid' convolution(3*3) , so image dimension will be reduced
d=25; %percent
 
for i=1:r-2
    for j=1:c-2
    window = noisy_img(i:i+2,j:j+2);
    atmf_img(i,j)= trimmean( window(:),d );
    end
end
 
subplot(224);
imshow(atmf_img);
title('ATMF filtered image');
